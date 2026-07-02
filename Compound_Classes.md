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

## Compound Classes

Compound classes are datatypes that are composed of other datatypes.
These datatypes are used to represent a collection of numbers, matrices, or entire datasets.

### Atomic Vector

Atomic vectors represent vectors of other datatypes.
You can create vectors using the combine function (`c()`).
In the example below, we create vectors of numerics:

```{code-cell} r
c (1, 2, 3, 4, 5)
```

```{code-cell} r
c(1, 4, 5, -1)
```

When creating regular numeric series you can use the colon operator to create expressions that evaluate into numeric vectors.
Using the syntax `b:e`, the series will start at `b` and end at `e`.
It will create an increasing series if $b < e$, and a decreasing series if $b e$.
If $b = e$ it will simply evaluate into one number.

```{code-cell} r
1:5
```

```{code-cell} r
5:-3
```

```{code-cell} r
3:3
```

There are some helpful functions and operations you can use with vectors, you can use `length()`, which evaluates to the number of items in your vector.
For example, `1:5` has five numerics, so the expression below evaluates as such:

```{code-cell} r
length(1:5)
```

We can also use `is.vector()` to check if an expression evaluates into a vector.
The `is.vector()` function evaluates to `TRUE` if used on a vector and `FALSE` otherwise.

```{code-cell} r
is.vector(1)
```

You can find the sum of all the elements of a numeric vector using `sum()`:

```{code-cell} r
sum(c(2,4,7,-1))
```

You can find the largest and smallest values using `max()`, and `min()`:

```{code-cell} r
max(c(2,4,7,-1))
```

```{code-cell} r
min(c(2,4,7,-1))
```

We can also fetch the $n$th element of a vector, to do this we use indexing with the syntax `[i]`, a vector expression, followed by an index `[i]`, evaluates to the $i$th element of said vector.
In the example below we can fetch the third item in the vector, which happens to be `-2`

```{code-cell} r
c(3,8,-2,0.1,4)[3]
```

What happens if you try to fetch index 0? Or index 6? Or index -1?

The vectors we see above are all double vectors.
But R also supports vectors composed of other datatypes.
You can create vectors of integers using the `L` suffix on the elements:

```{code-cell} r
typeof(c(1L, 2L))
```

You can also create vectors of characters:

```{code-cell} r
typeof(c("this", "word"))
```

Does R support vectors of vectors? A vector where the elements are also vectors?

### Matrices

Matrices allow us to create 2-dimensional collections.
These are mainly used to represent its namesake in math.
To create one we use the `matrix()` function and provide it with a vector that can be rearranged into a matrix.

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2)
```

In the example above, we rearrange the vector `c(1,2,3,4,5,6)` into a matrix with two rows using the `nrow = 2`.
Logically, this means that we the matrix created is of size 2x3.
When creating matrix objects using this method, we generally want the vector's size to be compatible with how we want to rearrange it.
In this case since we specify that we want two rows using `nrow = 2`, we must provide a vector where the number of elements are divisible by 2.
When given an incompatible sizes, R will still try to fit your matrix into the desired matrix dimensions but it will repeat the elements of the vector to fill in missing values in the matrix.
R will warn us when this is happening.

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 4)
```

```{code-cell} r
matrix(c(9,8,7,6), nrow = 7)
```

```{code-cell} r
matrix(c(0,4), nrow = 6)
```

Note that creating the matrix using `matrix(c(1,2,3,4,5,6), nrow = 2)`, the matrix will be filled up column by column, starting from the first column.
If we want to fill the matrix up by row instead we add the flag `byrow = TRUE` in the function call:

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2)
```

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
```

We can also create matrices by specifying the number of columns instead of number of rows.
To do this we simply use `ncols` instead of `nrows`

```{code-cell} r
matrix(c(1,2,3,4,5,6), ncol = 2)
```

```{code-cell} r
matrix(c(1,2,3,4,5,6), ncol = 2, byrow = TRUE)
```

We can isolate elements of a matrix using indexing.
Using the indexing syntax for vectors `m[i]`, you will retrieve the `i`th element if the matrix was unfurled into a vector by column:

```{code-cell} r
m = matrix(c(1,2,3,4,5,6), ncol = 2)
m
```

We can also retrieve an element by specifying the row and column number.
For example, we can retrieve the element found at the 3rd row and 1st column using the following syntax:

```{code-cell} r
m[3,1]
```

We can also retrieve an entire row (specifically the 2nd row), using the following syntax:

```{code-cell} r
m[2,]
```

Likewise, the second column can be retrieved as such:

```{code-cell} r
m[,2]
```

# Attributes


There are more compound types in R.
But before we talk about other compound types, lets talk about R attributes.
R allows us to assign metadata to any object using attributes.
While you can use this on any valid object, its usefulness becomes more obvious once you are working with compound classes.

## `name` attribute

For example, if you want to assign specific names to the elements of a vector object, you can use the special `name` attribute using the following syntax:

```{code-cell} r
vec <- c(23, 21, 22, 22, 18, 90)
names(vec) <- c("first", "second", "third", "fourth", "fifth", "sixth")
vec
```

```{code-cell} r
vec["second"]
```

Attributes are considered like metadata because attributes do not affect the actual values of the data itself.
In the example above we are simply assigning names to the elements of our numeric vector `vec`.
With names assigned, when `vec` is evaluated by the REPL, the value does not change but the it is displayed has changed.
The names of every element is also displayed alongside their values.
It also allows us to use the names as indexes as shown by the evaluation of `vec["second"]` above.

## `dim` attribute

The `dim` attribute refers to the dimensions of an object. 
In the example below, we can check the dimensions of the matrix called `identity` using `dim(identity)`:

```{code-cell} r
identity = matrix(c(1,0,0,1), nrow = 2)
identity
```

```{code-cell} r
dim(identity)
```

The `dim` attribute also allow you to change the dimensions of a matrix.
Below `mat` is originally a $3 \times 2$. We can change it to $1 \times 6$ by reassigning the dim attribute.

```{code-cell} r
mat = matrix(c(1:6), nrow = 3)
mat
```

```{code-cell} r
dim(mat)
```

```{code-cell} r
dim(mat) <- c(1,6)
```

Vectors do not have a dim attribute. If you try to display the dimension of a vector using `dim()`, it will evaluate into `NULL`.
But if you assign the `dim` of a vector, it will convert the vector into a matrix based on the specified dimensions.

```{code-cell} r
vec = c(1:6)
dim(vec)
```

```{code-cell} r
dim(vec) <- c(2,3)
vec
```

## `class` attribute

The `class` attribute refers to the high-level classification of an R object.
For example, we've been using this attribute to show if an object is a matrix.

```{code-cell} r
mat = matrix(c(1:6), nrow = 3)
class(mat)
```

In the example above, we can see that `mat` has two classes, matrix, and array.
This is as expected because all matrices are arrays.
It's out of scope for this discussion but this is an example of inheritance.

Just like, `dim` and `name` you can change the `class` attribute using `<-` assignment.

```{code-cell} r
numbers = c("1", "-2", "1000")
numbers
```

```{code-cell} r
class(numbers) <- "numeric"
numbers
```

While the example above, works to convert values into different types, said method is considered bad practice.
To make sure that you are performing type/class coercions safely, you can use the `as` conversions instead.

```{code-cell} r
numbers = c("1", "-2", "1000")
numbers <- as.numeric(numbers)
numbers
```

There are more attributes aside from `names`, `dim`, and class `class`.
Some of these attributes are specific to the class only.
For example, matrices can use the `colnames`, and `rownames` attributes.

```{code-cell} r
table = matrix(c(1:9), nrow = 3)
rownames(table) <- c("top", "middle", "bottom")
colnames(table) <- c("left", "center", "right")
table
```

```{code-cell} r
table["top","right"]
```

To show all attributes with assigned values, you can use `attributes()`:

```{code-cell} r
attributes(table)
```

Note that `rownames` is just internally translated to `dimnames[[1]]` and `colnames` to `dimnames[[2]]`.
The attribute `dimnames` refers to dimension names, a generalization of row names, column names, and etc.

# More compound classes

Some more compound classes that you might encounter in R include `array`s which are just like matrices but can support more than two dimensions.
For example, the array below has a size of $3 \times 2 \times 4$.
You can think of it as 4 layers of $3 \times 2$ matrices

```{code-cell} r
array(1:24, dim = c(3,2,4))
```

Another compound class is the `list`.
You can think of it as a generalized version of a vector.
While the elements of a vector can only be homogeneous simple types, `list`s can support a mix of classes classes (including compound classes).

```{code-cell} r
list(3, "word", TRUE, c(0,1,2), matrix(c(1,2), nrow = 1), list("a", 2))
```

# Data Frames

Data frames are compound classes that you will for sure encounter a lot as a data scientist.
Data frames are used to represent tabular data.
Like any table, a data frame is two dimensional.
But unlike matrices, or 2-dimensional arrays, the columns of a data frame can be of non-numeric.
Each column can be vectors of any simple type.
In the example below from the sample dataset `iris`, the first four columns are numeric vectors, and the last column is a character vector.

```{code-cell} r
head(iris)
```

Note that `head()` is a function that we use to display only the first few rows of a dataframe.
If we don't use it, it will display all rows of the dataset which can be too long.

As we can see in the example above, data frames also have helpful attributes such as the column names also known as headers, represented by the attribute `names`.
Row numbers are represented by the attribute `row.names`

```{code-cell} r
attributes(iris)
```

You can fetch elements from the data frame the same way you do for matrices. Entire rows:

```{code-cell} r
iris[20,]
```

Entire columns:

```{code-cell} r
iris[,2]
```

Note that when fetching an entire column, you might accidentally interchange `iris[,2]` and `iris[2]`.
While both look the same and are related, the former evaluates into a vector, while the latter evaluates into a data frame with one column (specifically the second column).
In some cases, some expressions might require a data frame and in some cases expressions might require the vector itself.

Selected rows and columns:

```{code-cell} r
iris[25:30,1:2]
```

Or a single cell:

```{code-cell} r
iris[26,3]
```

But since data frames usually come with useful attributes such as headers and row names, you can forgo indices and use said headers and row names instead.
In the example below, instead of using `iris[25:30,1:2]`, you can write the following:

```{code-cell} r
iris[25:30,c("Sepal.Length","Sepal.Width")]
```

In the case of the `iris` dataset (and most datasets), row indices and row names are the same.

If you are familiar with relational databases, you can perform also selections, joins, unions, and intersections with data frames.
The example below demonstrates a selection operation (\sigma) that filters only rows that have a sepal length less than 5:

```{code-cell} r
iris[iris["Sepal.Length"] < 5,]
```

You can also perform aggregations on the data frame.
In the example below we can find the mean of all sepal widths for all rows:

```{code-cell} r
mean(iris[,"Sepal.Width"], na.rm = TRUE)
```

`na.rm = TRUE` is a flag that must be set to TRUE so that columns with `NA` values are not automatically aggregated to `NA`.

You can combine these principles to find the mean of sepal width of species labeled as "setosa"

```{code-cell} r
mean(iris[iris["Species"] == "setosa",][,"Sepal.Width"], na.rm = TRUE)
```

You can also perform aggregations with specified groupings.
In the example below, sepal width and sepal length are aggregated using mean, grouped by species:

```{code-cell} r
aggregate(cbind(Sepal.Width,Sepal.Length) ~ Species, data = iris, FUN = mean)
```
