Sorcetta
========

Source-to-source translation.

**Why?** because a lot of research code exists only in R, Python, Matlab.  One can interface with other languages by using e.g. PyCall, but in this case, it is preferable to have the Python code translated to Julia (for performance reasons if nothing else).  Since human translation is slow and burdensome, automated translation may be a good alternative.

**Goal:** we do not expect Sorcetta to obtain 100% coverage without human assistance, but merely to speed up the process of translating code from other languages into Julia.

**Dogma:** as long as the outputs agree for every valid input, the codes are good translations of each other.  This means that you can use any approach you like (human translation, statistical machine translation, genetic algorithms, inductive logic programming, etc), as long as the tests pass.  Note: we don't worry about mutating code just yet.


Current project: R.  (Future: Matlab, Python)


# Project A: automatic test generation

**Q:** when are two pieces of code good translations of each other?  i.e. when do two pieces of code compute the same function?<br>
**A:** when they agree on every *valid* input.<br>
**Q:** what is valid input?<br>
**A:** for the purposes of Project A, an input is valid if it satisfies the precondition (i.e. the last PRE statement).

For Project B, we will be testing *sequences* of lines, and will compare variable values after each line.  The precondition is only enforced at the top of the sequence. At a given line, an input is valid if it can be achieved, given the code above it and the precondition at the top.


## .Rjl file

```
== Code ==
R: a+b
J: a+b
```
This tells to test whether `a+b` in R corresponds to `a+b` in Julia.  If no precondition (PRE statement) is specified, then `a` and `b` will take their full range of values.  The full range of values is specified under the "Inputs" header at the bottom of the .Rjl file.


```
a::Real -1.0, 0.0, 1.0, 5.0, 1e10, Inf
b::Real -1.0, 0.0, 1.0, 5.0, 1e10, Inf
```

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

* Some R identifiers are not valid Julia identifiers, e.g. anything containing `.`.

* Type annotation: R code is not type-annotated, but to obtain good performance, Julia requires type annotation.  Under the `==Inputs==` header, one can specify a Julia type for each variable.


## How to run

...


# Project B: web application to collect parallel corpus from humans

Ruby on Rails?

## Plan

* interface showing R code, side-by-side with Julia code, aligned by line

* use Project A to judge correctness of translations.


