Sorcetta
========

Source-to-source translation.

Currently: R to Julia.  (Future: Matlab, Python)

# Project A: automatic test generation

## .Rjl file: 

```
R: a+b
J: a+b
```
This tells to test whether "a+b" in R corresponds to "a+b" in Julia, with `a` and `b` taking their full range of values.  The range of values is specified under the "Inputs" header at the bottom of the .Rjl file.

A blank line is required between tests.


```
PRE: typeof(a)<:Real && a>=0
R: sqrt(a)
J: sqrt(a)
```

The PRE statement restricts the range of values, and propagates downwards.  To reset to default state, one can use `PRE: true`.  The above block tells to test whether "sqrt(a)" in R corresponds to "sqrt(a)" in Julia, but only for non-negative values of `a`.


# Project B: web application to collect human translations from R to Julia, using Project A to provide feedback.