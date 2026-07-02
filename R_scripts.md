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

# R programs and Scripting

While you can do a lot just by interacting with the R REPL, you can do even more by creating r scripts.
R scripts allow you to automate R commands, create repeatable step-by-step programs, and distribute R code.
Let's start by creating a simple file called `hello.r`. Inside the file, write the following statement:

```{code-cell} r
print("Hello world!")
```

To execute the script, you can go to your terminal write the following command:

```bash
Rscript hello.r
```

Make sure you are in the same directory/folder of the file `hello.r`

Here's an example of an R script that has multiple steps.
The program below has multiple lines.
R reads each line from top to bottom, executing each line.

```{code-cell} r
vec <- c(2, -1, 3, 2, 0, 2, 1, 2, 2)
mat <- matrix(vec, byrow = TRUE, nrow = 3)

determinant <- det(mat)

cat("given matrix:\n")
print(mat)
cat("determinant:", determinant, "\n")
```

1. The first line, is executed, storing a vector with 9 elements to the object called `vec`.
2. The second line is executed storing a new matrix by rearranging vec.
3. The third line is executed, storing the determinant of `mat` to `determinant`
4. The line `"given matrix:"` is printed to the console.
5. the matrix `mat` is printed.
6. The determinant is printed along with the message in the console.

To print messages to the console we use the functions called `cat()` and `print()`.
The function `cat()` prints the concatenation of the given expressions.
The function `print()` can only print one object at a time with the appropriate formatting for said object's class.

# Conditionals

Conditionals allow us to create scripts where some steps are executed on a conditional basis.
Depending on the value of a specific logical expression, specific lines of your code can be either executed or ignored.

```{code-cell} r
value <- 4

if (value > 3) {
    cat(value, "is too high\n")
}
```

In the example above, since `value` is 4, then the logical expression parenthesized inside the if statement evaluates into 4, therefore the statements in between `{}` are executed.
If we replace the assigned value to `3`, then the logical expression evaluates to a false, therefore, the statements inside `{}` are ignore.
In general, the statements in between `{}` are executed if and only if the logical expression evaluates to `TRUE`.

You can also add an `else` branch in your if statement.
The statements inside the else branch will only be executed if and only if the logical expression evaluates to `TRUE`.

```{code-cell} r
value <- 4

if (value > 3) {
    cat(value, "is too high\n")
} else {
    cat(value, "is just enough")
}
```

Adding an else branch allows you to create two branches in your script.
R will execute exactly one of the two branches.
If you need 3 branches, then you will need to put another if-else pair inside the else branch:

```{code-cell} r
value <- 0

if (value > 3) {
    cat(value, "is too high\n")
} else {
    if (value < 1) {
        cat(value, "is too low\n")
    } else {
        cat(value, "is just enough\n")
    }
}
```

Writing three branches like this can look confusing, so we can instead write it as the following:

```{code-cell} r
value <- 0

if (value > 3) {
    cat(value, "is too high\n")
} else if (value < 1) {
        cat(value, "is too low\n")
} else {
        cat(value, "is just enough\n")
}
```

If you want to add more branches you can simply add one more `else if` branch somewhere in between the `if` and `else` branch.

You can also write `if-else` as expressions that can be evaluated and can be incorporated into other expressions.
These expression forms are useful when applied to vectorized operations which will be discussed later.

```{code-cell} r
value <- 3
print(ifelse(value > 3, "too high", "just enough"))
```

The function `ifelse()` accepts 3 expressions, and the first one must be logical.
In this example, the `ifelse()` function evaluates to "too high" if the logical expression: `value 3` evaluates to `TRUE` otherwise the `ifelse()` function evaluates to "just enough".

# Loops

In some cases you would want to repeat parts of your script in a specific way.
This can be achieved through loops.

### `for` loop

A `for` loop lets you repeat a section of your script based on elements of vector or a list.
It executes a section of the code for each element in a given vector or list.

```{code-cell} r
vec <- c(3, 1, 2, -1, 0)

for (element in vec) {
    print(element)
}
```

The line `print(element)` is repeatedly executed 5 times, one for each element in `vec`.
At the first time it is executed, the value of `element` is 3, which is the first element in `vec`.
At the second time it is execute, the value of the `element` is 1, which is the second element in `vec`.
This continues until the fifth repetition, where the value of `element` is 0, the fifth and last element in `vec`.
After this, there are no more elements in `vec`, which completes the loop.

## `while` loop

A `while` loop, repeats a section of your script while a logical expression evaluates to a `TRUE`.
As soon as said logical expression evaluates to a `FALSE`, the `while` loop completes.

```{code-cell} r
counter <- 0
while (counter < 10) {
    print("Hello world!")
    counter <- counter + 1
}
```

## `repeat` loop

A `repeat` loop repeatedly executes a section of your script until it encounters a `break` command.

```{code-cell} r
n_consecutive_heads = 0
repeat {
    result <- sample(c("heads", "tails"), 1)
    print(result)

    if (result == "tails") {
        break
    }
    n_consecutive_heads <- n_consecutive_heads + 1
}

cat("consecutive heads:", n_consecutive_heads, "\n")
```

# Functions

Functions are reusable scripts that are stored in memory.
These functions can be invoked to execute scripts or evaluate into values.
We have been using some builtin functions so far, like `c()`, `matrix()`, `print()`, and etc.
We can also create our own functions.
The example below is a simple function that prints a message:

```{code-cell} r
hello <- function() {
    print("Hello world")
}

hello()
hello()
```

While the example above seems kind of useless since we simply define and use the function immediately, we can see how it can be reused if we load our file into the repl.
Before we do this, let's delete the last two lines so  `hello()` does not get invoked when it is loaded.
First lets open the R repl in our command line.
To make it easier, it is best to open the repl on the same directory/folder as your script file.

In the repl, enter the command following command.
Replace the argument with the file name of the file you want to load.

```{code-cell} r
source("functions.r")
```

Since the file has now been loaded/sourced, we can now invoke the functions defined inside said file.

```{code-cell} r
hello()
```

## Function parameters

To create more interactive functions, we can add parameters.
When your function definition has parameters, it allows you to add arguments during the invokation.
When you call a function with arguments the arguments are passed into the scope of the function definition allowing you to change the behavior of the function depending on said argument.
For example, if we want to create a more interactive greeting.
Instead of printing "hello world", we want a function that can greet someone based on the name we provide.

```{code-cell} r
greet <- function(name) {
    cat("hello", name, "\n")
}
```

In this example, we have `name` which is a required parameter for the function `greet()`.
Since we added a required parameter, anytime greet is invoked, it must be invoked with one argument.
During the invokation, the argument will be stored to the parameter.
In the contents of greet, whenever you use `name`, it will evaluate into whatever argument was store in name.
For example if we invoke `greet("Rubelito")`, the argument "Rubelito" will be stored to `name`, resulting in the following:

```{code-cell} r
greet("Rubelito")
```

You can have multiple parameters in your function definition.
For example, we can modify `greet()` to include an honorific:

```{code-cell} r
greet <- function(name, honorific) {
    cat("hello", honorific, name, "\n")
}
```

```{code-cell} r
greet("Rubelito", "Mr.")
```

When you have more than one parameters, the first argument is stored to the first parameter, the second argument is stored to the second parameter, and so on.
But you can also pass arguments out of order by specifying the parameter during invokation:

```{code-cell} r
greet(honorific = "Mr.", name = "Rubelito")
```

Specifying parameters at function invokation also helps with readability.

You can also function parameters to be optional.
If you want a parameter to be optional, you must provide a default value for said parameter.
For example lets modify honorific to be optional.
The default value we will assign to it is an empty character `""`.

```{code-cell} r
greet <- function(name, honorific = "") {
    cat("hello", honorific, name, "\n")
}
```

Now you can choose whether to add honorifics when `greet()` is invoked.

```{code-cell} r
greet("Rubelito", "Mr.")
```

```{code-cell} r
greet("Rubelito")
```

## return values

If the function definition's last line is a valid expression, the evaluation of said expression is considered its return value.
A function's return value is what it evaluates into if said function is used as an expression.

The example below calculates the power of a square matrix by repeatedly multiplying the matrix to itself.

```{code-cell} r
mpower <- function(mat, power) {
    product <- rbind(c(1, 0), c(0, 1))

    for (i in 1:power) {
        product <- product %*% mat
    }
    product
}
```

This function will evaluate into whatever the value of `product` is at the end of the function.
This method of returning values is called implicit return.


You can also explicitly declare the return value of a function using the function `return()` inside a function definition.
Explicit returns are especially useful when you are dealing with conditionals:

```{code-cell} r
mpower <- function(mat, power) {
    dimensions <- dim(mat)
    if(dimensions[1] != dimensions[2]) {
        return(NULL)
    }
    product <- rbind(c(1, 0), c(0, 1))

    for (i in 1:power) {
        product <- product %*% mat
    }
    return(product)
}
```

In the example above, we add a check if the matrix is square by checking its dimensions.
If it is not square we explicitly return `NULL`.
If it is square we will eventually return `product`
