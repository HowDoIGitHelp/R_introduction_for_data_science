---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.4
kernelspec:
  display_name: R
  language: R
  name: ir
---

# The R Workspace

When you launch the R workspace, you will be greeted by what is known as a REPL.
This stands for a read-evaluate-print loop.
When you write expression in the prompt and press enter, the R interpreter reads the expression, it evaluates said expression and then it prints what said expression evaluates into.
After these steps, it loops back and prompts for new inputs.
You can think of this the same way interacting with a calculator.

While it is mainly used for writing expressions, you can also input commands such as launching the help screen using `help()`, viewing demons using `demo()`, importing packages using `source()`, update packages using `update.packages()` and more.
To exit the workspace, you can use the command `q()`

## R-expressions

To interact with the REPL, you must write complete expressions in the prompt.

```{code-cell} r
2 + 3
```

In the example above, when we write the expression `2 + 3` and press enter, the REPL reads the expression, and if said expression is valid, it will evaluate the expression and prints the evaluation as a reply.
This reply is the line directly after the prompt `[1] 5`, The `[1]` here tells you that the output here begins with the first value in the output.
In this particular case we only have one value as an output for the evaluation.
In some cases where there are a lot of values as an output, R will organize the reply into multiple lines:

```{code-cell} r
1000:940
```

In the example above, expression `1000:940` generates the numbers from 1000 to 940.
Looking at the output the second line of values start with the 16th value which happens to be 985.
The third line starts with the 31st value which happens to be 985.

As mentioned before, the REPL can only evaluate your expression if said expression is valid.
Valid in this context means, that the expression syntactically correct and complete.
If you do end up with an invalid expression, R will let you know with an informative error message:

```{code-cell} r
4 4
```

If you end up pressing enter with an incomplete expression, R will wait for you to complete the expression in a new line as observed in the line with the `+` symbol in the example below:

```{code-cell} r
2 + 3 -
+ 2
```

## R Atomic Datatypes

Expressions in R can come in different datatypes.
The examples we have seen so far are numeric representations known as `Doubles` which are also known as numeric.
By default numeric expressions are interpreted as doubles unless you specify otherwise.
You can check the type of the expression using the function `class()`:

```{code-cell} r
class(12)
```

```{code-cell} r
class(3 - 4)
```

If you want to specify integers, then your numbers must end with the suffix `L`:

```{code-cell} r
class(3L - 1L)
```

```{code-cell} r
class(5L)
```

R also features the complex numbers using the complex datatype, expressions written with an imaginary term will interpreted as complex.

```{code-cell} r
class(3 + 2i)
```

```{code-cell} r
class(0i)
```

Non-numeric types also include logicals, which can only be either `TRUE` or `FALSE`,

```{code-cell} r
class(TRUE)
```

```{code-cell} r
class(FALSE)
```

```{code-cell} r
class(TRUE | FALSE)
```

When writing logicals, `TRUE` or `FALSE` must be written in all-caps, otherwise R will not interpret as logicals.

```{code-cell} r
class(True)
```

```{code-cell} r
class(true)
```

R also has datatypes to represent text data.
These are called characters.
Any text that is surrounded by pairs of double quotes `"` or pairs of single quotes `"` are interpreted as character datatypes.

```{code-cell} r
class("e")
```

```{code-cell} r
class("data")
```

```{code-cell} r
class("3 quick brown foxes?")
```

```{code-cell} r
class('word')
```

```{code-cell} r
class('{')
```

## R Objects

R objects allow us to conveniently hold a piece of data in memory.
Any type of data can be placed into an R object, all you have to do is to assign to it a valid name.
For example we can store the number `3` into the object called `x`.
We can use the `<-` operator for this.

```{code-cell} r
x <- 3
```

Note that when you do this in the REPL, R doesn't reply.
This is because `x <- 3` is not an expression, therefore it doesn't evaluate into anything.

But now that we have stored `3` into the object `x`.
Anytime we use `x` in this REPL session, it will evaluate into `3`.

```{code-cell} r
x
```

```{code-cell} r
x + 4
```

```{code-cell} r
x + x
```

```{code-cell} r
x / 2
```

If you want to replace the value stored in an object, you can simply reassign using the `<-`:

```{code-cell} r
x <- 21
x
```

Note that when assigning or reassigning using `<-`, you use any valid object name.
As long as the name doesn't start with a number, doesn't use the special symbols such as `+`, `-`, `*`, `/`, `^`, `$`, etc, and is not a reserved word, then it is a valid object name.
Also, you can store any valid expression into an object name.

```{code-cell} r
y <- 2 + 3
quotient <- 70 / 3
boolean_value <- 5 < 3
date1 = as.Date("2026-6-12")
```
