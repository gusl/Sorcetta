Sorcetta
========

Source-to-source translation to enrich Julia libraries.

**Goal:** we do not expect to obtain 100% coverage, but merely to speed up the process of translating code from other languages into Julia.

**Idea:** as long as the outputs agree for every input, the codes are good translations of each other.  This means that you can use any approach you like (human translation, genetic algorithms, inductive logic programming, etc), as long as the tests pass.  Note: we don't worry about mutating code just yet.


Current project: R.  (Future: Matlab, Python)


# Project A: automatic test generation

**Q:** when are two pieces of code good translations of each other?  i.e. when do two pieces of code compute the same function?<br>
**A:** when they agree on every *valid* input.


## .Rjl file

```
== Code ==
R: a+b
J: a+b
```
This tells to test whether `a+b` in R corresponds to `a+b` in Julia.  If no PRE statement is specified, then `a` and `b` will take their full range of values.  The full range of values is specified under the "Inputs" header at the bottom of the .Rjl file.

A blank line is required between tests.


```
PRE: typeof(a)<:Real && a>=0
R: sqrt(a)
J: sqrt(a)
```

The PRE statement restricts the range of values, and propagates downwards.  To reset to default state, one can use `PRE: true`. Likewise `PRE: false` will cause tests to be skipped until the next PRE statement.  The above block tells to test whether `sqrt(a)` in R corresponds to `sqrt(a)` in Julia, but only for non-negative values of `a`.


```
== Libraries ==
R: 
J: Distributions
```

This specifies which libraries need to be loaded before tests are run.  For R, the Base package is enough.  For Julia, it will call `using Distributions`.


## Issues

* R identifiers may not be valid Julia identifiers, e.g. anything containing `.`.

* Dependencies



## How to run




# Project B: web application to collect parallel corpus from humans

Ruby on Rails?

## Plan

* interface showing R code, side-by-side with Julia code, aligned by line

* use Project A to judge correctness of translations.


