---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.4
kernelspec:
  name: ir
  display_name: R
  language: R
---

# Making R fast

Admittedly, R is not really a fast language.
If you need to write code that needs to prioritize speed and efficiency, you're probably better off looking at languages like C or Rust.
R is just meant for other purposes.

But still, R is meant for statistical computation.
In a lot of cases, you will need to perform computation on large amounts of data.
In cases like this if you do not write R code in a specific way then you will for sure feel how slow R is.

To make R fast you will need to take advantage of advanced R techniques like vectorization and element-wise operations.

# Element-wise operation

In other programming languages, when you need to perform calculations on a vector of values, the naive way of doing this is to use a for loop.
For example, if you simply want to add 1 to each element in a vector, you can do the following:

```{code-cell} r
addone_l <- function(vec) {
    new_vector <- vec
    for (i in 1:length(vec)) {
        new_vector[i] <- new_vector[i] + 1
    }
    new_vector
}
```

Here, you are iterating through each element in the vector, and adding one to it.
In R, you can perform the same calculations, in simpler and more terse way.
When you use the operators like `+`, `*`, `-`, `/`, etc, on vectors, it will perform element-wise operations.
This means the operation is performed on every element of the vector.
Instead of writing `addone` the way we did above, we can simply write:

```{code-cell} r
addone_v <- function(vec) {
    vec + 1
}
```

Not only is this approach shorter, is also much much quicker.
Behind the scenes of this evaluation, R performs a lot of optimizations.
To see the speed difference, lets invoke these functions on randomly generated dataset of 100 million numbers.
Here we are generating the data using `runif()` which generates a randomly distributed vector based on a given max and min value.
To measure the time it takes to perform the functions, we use `system.time()`

```{code-cell} r
data <- runif(100000000, min = 1, max = 10)
system.time(addone_l(data))
```

```{code-cell} r
system.time(addone_v(data))
```

Based on the elapsed time, the loop version of took more than 11 seconds while the element-wise version took 0.232 seconds.

When you are evaluating `+`, `-`, `*`, `/`, etc, operations on 2 vectors, R also performs the calculate element-wise. 
For example when adding two vectors using `v1 + v2`, each corresponding pair of elements are added.
The sums will form the resulting sum vector.

Not that when evaluating these operations on 2 vectors, the lengths must be compatible.
If one vector is longer, the length of the longer vector must be a multiple of the shorter vector.
For example, if the vectors `u` and `v` have lengths $n$ and $kn$ respectively, the shorter vectors elements, (`u`) will be paired multiple times.
The element `u[1]` will be paired with `v[1]`, `v[n+1]`, `v[2n+1]` and so on. 
The element `u[2]` will be paired with `v[2]`, `v[n+2]`, `v[2n+2]` and so on.
In general `u[i]` will be paired with `v[i]`, `v[n+i]`, `v[2n+i]`, until `v[(k-1)*n + i]`.
Here's an example:

```{code-cell} r
c(1,2,3,4) + c(1,1,1,1,2,2,2,2,3,3,3,3)
```

If the length of the longer vector is not a multiple of the shorter vector, then the expression will not evaluate.

In another example, if you want to compute the variance of a vector, you can use a for loop to find all the mean square errors for every element.

```{code-cell} r
variance_l <- function(vec) {
    cumulative_sum <- 0
    for (e in vec) {
        cumulative_sum <- cumulative_sum + e
    }

    mean <- cumulative_sum / length(vec)

    square_error_sum <- 0
    for (e in vec) {
        square_error_sum <- square_error_sum + ((e - mean) * (e - mean))
    }

    square_error_sum / length(vec)
}
```

But as we learned in the previous section, for loops like these are very slow for R.
Instead, we can avoid loops and evaluate the entire vectors:

```{code-cell} r
variance_v <- function(vec) {
    mean <- sum(vec) / length(vec)

    square_errors = (vec - mean) * (vec - mean)
    sum(square_errors) / length(vec)
}
```

# Subetting

There are cases where you might need to handle vector elements on a case to case basis.
For example, let's say you need to find the sum of a vector of numbers.
But in this particular case, you need to treat negative numbers differently.
Instead of adding the negative numbers as-is, you need to ignore them entirely.
We've learned that we can use `if`-`else` statements to handle branched execution.

```{code-cell} r
special_sum_l <- function(vec) {
    cumulative_sum <- 0
    for (e in vec) {
        if (e > 0) {
            cumulative_sum <- cumulative_sum + e
        }
    }
    cumulative_sum
}
```

Because of the multiple cases, we are forced to use a `for` loop to individually handle cases.
And as we learned, the loop slows down our calculation.

Instead of using `if`-`else` statements, we can make use of R's advanced subsetting syntax for branching cases.
We used simple subsetting when we fetched individual elements (e.g. `vec[1]`), or when we fetched a range of elements (e.g. `vec[1:3]`), or when we fetched all elements while excluding some (e.g. `vec[-2]`).

When you subset a vector with another vector of numbers, for example `vec[c(1,3,9)]`, R will fetch all elements at index 1,3, and 9:

```{code-cell} r
vec <- c(-1,2,0,2,-3,4,3,2,5,10,-2)
vec[c(1,3,9)]
```

If the indices do not exist, R will fetch `NA`.

```{code-cell} r
c(1,2,3,4)[c(4,9,2)]
```

If you subset a vector with another vector of logicals, elements that line up with `TRUE` will be fetched while elements that line up with `FALSE` will be not be fetched.

```{code-cell} r
c(1,2,3,4)[c(TRUE,FALSE,FALSE,TRUE)]
```

If the vector of logicals is longer than the indexed vector, R will fetch `NA` for every excess `TRUE`.

```{code-cell} r
c(1,2,3,4)[c(TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE)]
```

If the vector of logicals is shorter than the indexed vector, R will repeat the logical vector until all elements are paired.

```{code-cell} r
c(1,2,3,4,5,6,7)[c(TRUE,FALSE)]
```

Going back to our sum function, we can make use of logical indexing to quickly handle negative and nonnegative numbers differently.

```{code-cell} r
special_sum_v <- function(vec) {
    negatives <- vec < 0
    vec[negatives] <- 0
    sum(vec)
}
```

In the new function below, we first create a vector of logicals by performing a evaluating, `vec < 0`.
Since `vec` is a vector, this is evaluated element-wise, creating a vector of logicals.
If an element in vec is less than 0, then the corresponding logical will be `TRUE`.
This resulting logical vector is stored to `negatives` which is then used for subsetting.
All of the vectors fetched in the subsetting are replaced by zero, which means they will not contribute to the sum anymore.
This function will work identically as the loop version, but is much faster:

```{code-cell} r
special_sum_l(data)
```

```{code-cell} r
special_sum_v(data)
```

```{code-cell} r
system.time(special_sum_l(data))
```

```{code-cell} r
system.time(special_sum_v(data))
```

In summary, if you want to write fast code in R, you must try to avoid, using loops.
As much as possible, you should try to find a way to evaluate vectors in its entirety.
Code like this is also known as vectorized code.

Most builtin functions in R are also vectorized.
These builtin functions are written while prioritizing their speed.
If you want to write vectorized code, you should also aim to use builtin functions as much as possible.

Here are some useful builtin functions you can use:

- `is.element(value, vec)` - returns true if value is an element in `vec`
- `unique(vec)` - returns the same vector with the duplicate elements removed
- `rep(vec,n)` - repeats a vector `n` times
- `which(logical_vec)` - returns which indices have the value `TRUE`
- `sort(vec)` - sorts a vector in increasing order, (use argument `decreasing = TRUE` for decreasing order) 
- `rev(vec)` - reverses a vector
- `paste(char_vec, separator)` - concatenates a vector of characters into one with a separator (use `paste0(string_vec)` for no separators)
- `toupper(char_vec),`, `tolower(string_vec)` - converts the character to uppercase or lowercase
- `substr(char_vec, begin, end)` - extracts a substring based from a character type
- `gsub(pattern, replacement, char_vec)` - replaces instances of a pattern in a with a replacement in a character.
- `min(vec)`, `max(vec)`, `sum(vec)`, `mean(vec)`, `median(vec)`, `var(vec)`, `sd(vec)` - descriptive statistics for a vector. You can also use `summary(vec)` to show available descriptive statistics.
- `table(vec)` - creates a contingency tables of value frequencies. `table(vec1, vec2)` will create a two-way contingency table.
- `expand.grid(vec1, vec2, ...)` - returns every possible combination of elements from the vectors

Yo can use `help()` to check advanced usages, and optional arguments for these functions.
