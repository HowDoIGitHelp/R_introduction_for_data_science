---
jupyter:
  kernelspec:
    display_name: R
    language: r
    name: ir
  text_representation:
    extension: .md
    format_name: markdown
---
# Programming in Data Science

Data Science a field that combines the tools and skillset of other disciplines.
As a data scientist you will wear the hat of a Statistician, a Computer Scientist, a domain expert and more.
This course aims to equip you with the necessary skills to use one of the most versatile tools in these disciplines.
While this course focuses on R and Python, you can apply the same skills demonstrated here on other programming languages as well.

## Why R

R was created as a statisticians programming language.
Since the beginning of the project, the intention was to create a language that will natively support statistical computations.
The language was a project started by statisticians from the University of Auckland, Ross Ihaka and Robert Gentleman (The language is called "R" from their first names).
While other programming languages can be used for all sorts of statistical computation tasks, R has and always has been created by statisticians and created for statisticians.
The R language is supported by a large database of community maintained packages that include advanced statistical tests, models, and machine learning algorithms.
When it comes to statistical computation, R remains one of the first choices.

## Why Python

Python on the other hand was created to be a general purpose programming language.
The language is high-level, has modern features, and uses a syntax that is easy to use.
Due these reasons, Python became the choice language for enthusiasts, scripting, and most importantly for our context, scientific computation.
It's large community also contributes to the creation of packages that have matured to become industry standards in many disciplines.
These includes packages such as numpy for large array computations, scipy for scientific computations, matplotlib for visualization, pandas for data analytics, sci-kit learn for machine learning and many more.

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
 [1] 1000  999  998  997  996  995  994  993  992  991  990  989  988  987  986
[16]  985  984  983  982  981  980  979  978  977  976  975  974  973  972  971
[31]  970  969  968  967  966  965  964  963  962  961  960  959  958  957  956
[46]  955  954  953  952  951  950  949  948  947  946  945  944  943  942  941
[61]  940
```

In the example above, expression `1000:940` generates the numbers from 1000 to 940.
Looking at the output the second line of values start with the 16th value which happens to be 985.
The third line starts with the 31st value which happens to be 985.

As mentioned before, the REPL can only evaluate your expression if said expression is valid.
Valid in this context means, that the expression syntactically correct and complete.
If you do end up with an invalid expression, R will let you know with an informative error message:

```{code-cell} r
4 4
Error: unexpected numeric constant in "4 4"
```

If you end up pressing enter with an incomplete expression, R will wait for you to complete the expression in a new line as observed in the line with the `+` symbol in the example below:

```{code-cell} r
2 + 3 -
+ 2
[1] 3
```

## R Atomic Datatypes

Expressions in R can come in different datatypes.
The examples we have seen so far are numeric representations known as `Doubles` which are also known as numeric.
By default numeric expressions are interpreted as doubles unless you specify otherwise.
You can check the type of the expression using the function `class()`:

```{code-cell} r
class(12)
[1] "numeric"
class(3 - 4)
[1] "numeric"
```

If you want to specify integers, then your numbers must end with the suffix `L`:

```{code-cell} r
class(3L - 1L)
[1] "integer"
class(5L)
[1] "integer"
```

R also features the complex numbers using the complex datatype, expressions written with an imaginary term will interpreted as complex.

```{code-cell} r
class(3 + 2i)
[1] "complex"
class(0i)
[1] "complex"
```

Non-numeric types also include logicals, which can only be either `TRUE` or `FALSE`, 

```{code-cell} r
class(TRUE)
[1] "logical"
class(FALSE)
[1] "logical"
class(TRUE | FALSE)
[1] "logical"
```

When writing logicals, `TRUE` or `FALSE` must be written in all-caps, otherwise R will not interpret as logicals.

```{code-cell} r
class(True)
Error: object 'True' not found
class(true)
Error: object 'true' not found
```

R also has datatypes to represent text data.
These are called characters.
Any text that is surrounded by pairs of double quotes `"` or pairs of single quotes `"` are interpreted as character datatypes.

```{code-cell} r
[1] "character"
class("e")
[1] "character"
class("data")
[1] "character"
class("3 quick brown foxes?")
[1] "character"
class('word')
[1] "character"
class('{')
[1] "character"
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
[1] 3
x + 4
[1] 7
x + x
[1] 6
x / 2
[1] 1.5
```
If you want to replace the value stored in an object, you can simply reassign using the `<-`:

```{code-cell} r
x <- 21
x
[1] 21
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

## Compound Classes

Compound classes are datatypes that are composed of other datatypes.
These datatypes are used to represent a collection of numbers, matrices, or entire datasets.

### Atomic Vector

Atomic vectors represent vectors of other datatypes.
You can create vectors using the combine function (`c()`).
In the example below, we create vectors of numerics:

```{code-cell} r
c (1, 2, 3, 4, 5)
[1] 1 2 3 4 5
c(1, 4, 5, -1)
[1]  1  4  5 -1
```

When creating regular numeric series you can use the colon operator to create expressions that evaluate into numeric vectors.
Using the syntax `b:e`, the series will start at `b` and end at `e`.
It will create an increasing series if $b < e$, and a decreasing series if $b e$.
If $b = e$ it will simply evaluate into one number.

```{code-cell} r
1:5
[1] 1 2 3 4 5
5:-3
[1]  5  4  3  2  1  0 -1 -2 -3
3:3
[1] 3
```

There are some helpful functions and operations you can use with vectors, you can use `length()`, which evaluates to the number of items in your vector.
For example, `1:5` has five numerics, so the expression below evaluates as such:

```{code-cell} r
length(1:5)
[1] 5
```

We can also use `is.vector()` to check if an expression evaluates into a vector.
The `is.vector()` function evaluates to `TRUE` if used on a vector and `FALSE` otherwise.

```{code-cell} r
is.vector(1)
[1] TRUE
```

You can find the sum of all of the elements of a numeric vector using `sum()`:

```{code-cell} r
sum(c(2,4,7,-1))
[1] 12
```

You can find the largest and smallest values using `max()`, and `min()`:

```{code-cell} row
max(c(2,4,7,-1))
[1] 7
min(c(2,4,7,-1))
[1] -1
```

We can also fetch the $n$th element of a vector, to do this we use indexing with the syntax `[i]`, a vector expression, followed by an index `[i]`, evaluates to the $i$th element of said vector.
In the example below we can fetch the third item in the vector, which happens to be `-2`

```{code-cell} r
c(3,8,-2,0.1,4)[3]
[1] -2
```
What happens if you try to fetch index 0? Or index 6? Or index -1?

The vectors we see above are all double vectors.
But R also supports vectors composed of other datatypes.
You can create vectors of integers using the `L` suffix on the elements:

```{code-cell} r
typeof(c(1L, 2L))
[1] "integer"
```

You can also create vectors of characters:

```{code-cell} r
typeof(c("this", "word"))
[1] "character"
```

Does R support vectors of vectors? A vector where the elements are also vectors?

### Matrices

Matrices allow us to create 2-dimensional collections.
These are mainly used to represent its namesake in math.
To create one we use the `matrix()` function and provide it with a vector that can be rearranged into a matrix.

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2)
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```
In the example above, we rearrange the vector `c(1,2,3,4,5,6)` into a matrix with two rows using the `nrow = 2`.
Logically, this means that we the matrix created is of size 2x3.
When creating matrix objects using this method, we generally want the vector's size to be compatible with how we want to rearrange it.
In this case since we specify that we want two rows using `nrow = 2`, we must provide a vector where the number of elements are divisible by 2.
When given an incompatible sizes, R will still try to fit your matrix into the desired matrix dimensions but it will repeat the elements of the vector to fill in missing values in the matrix.
R will warn us when this is happening.

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 4)
     [,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    1
[4,]    4    2
Warning message:
In matrix(c(1, 2, 3, 4, 5, 6), nrow = 4) :
  data length [6] is not a sub-multiple or multiple of the number of rows [4]
```

```{code-cell} r
matrix(c(9,8,7,6), nrow = 7)
     [,1]
[1,]    9
[2,]    8
[3,]    7
[4,]    6
[5,]    9
[6,]    8
[7,]    7
Warning message:
In matrix(c(9, 8, 7, 6), nrow = 7) :
  data length [4] is not a sub-multiple or multiple of the number of rows [7]
```

```{code-cell} r
matrix(c(0,4), nrow = 6)
     [,1]
[1,]    0
[2,]    4
[3,]    0
[4,]    4
[5,]    0
[6,]    4
```

Note that creating the matrix using `matrix(c(1,2,3,4,5,6), nrow = 2)`, the matrix will be filled up column by column, starting from the first column.
If we want to fill the matrix up by row instead we add the flag `byrow = TRUE` in the function call:

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2)
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

```{code-cell} r
matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

We can also create matrices by specifying the number of columns instead of number of rows.
To do this we simply use `ncols` instead of `nrows`

```{code-cell} r
matrix(c(1,2,3,4,5,6), ncol = 2)
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

```{code-cell} r
matrix(c(1,2,3,4,5,6), ncol = 2, byrow = TRUE)
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
```

We can isolate elements of a matrix using indexing.
Using the indexing syntax for vectors `m[i]`, you will retrieve the ith element if the matrix was unfurled into a vector by column:

```{code-cell} r
m = matrix(c(1,2,3,4,5,6), ncol = 2)
m
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
m[2]
[1] 2
```

We can also retrieve an element by specifying the row and column number.
For example we can retrieve the element found at the 3rd row and 1st column using the following syntax:

```{code-cell} r
m[3,1]
[1] 3
```
We can also retrieve an entire row (specifically the 2nd row), using the following syntax:

```{code-cell} r
m[2,]
[1] 2 5
```

Likewise, the second column can be retrieved as such:

```{code-cell} r
m[,2]
[1] 4 5 6
```

# Attributes


There are more compound types in R.
But before we talk about other compound types, lets talk about R attributes.
R allows us to assign metadata to any object using attributes.
While you can use this on any valid object, it's usefulness becomes more obvious once you are working with compound classes.

## `name` attribute

For example, if you want to assign specific names to the elements of a vector object, you can use the special `name` attribute using the following syntax:

```{code-cell} r
vec <- c(23, 21, 22, 22, 18, 90)
names(vec) <- c("first", "second", "third", "fourth", "fifth", "sixth")
vec
 first second  third fourth  fifth  sixth 
    23     21     22     22     18     90 
vec["second"]
second 
    21 
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
     [,1] [,2]
[1,]    1    0
[2,]    0    1
dim(identity)
[1] 2 2
```

The `dim` attribute also allow you to change the dimensions of a matrix.
Below `mat` is originally a $3 \times 2$. We can change it to $1 \times 6$ by reassigning the dim attribute.

```{code-cell} r
mat = matrix(c(1:6), nrow = 3)
mat
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
dim(mat)
[1] 3 2
dim(mat) <- c(1,6)
mat
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    1    2    3    4    5    6
```
Vectors do not have a dim attribute. If you try to display the dimension of a vector using `dim()`, it will evaluate into `NULL`.
But if you assign the `dim` of a vector, it will convert the vector into a matrix based on the specified dimensions.

```{code-cell} r
vec = c(1:6)
dim(vec)
NULL
dim(vec) <- c(2,3)
vec
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

## `class` attribute

The `class` attribute refers to the high-level classification of an R object.
For example, we've been using this attribute to show if an object is a matrix.

```{code-cell} r
mat = matrix(c(1:6), nrow = 3)
class(mat)
[1] "matrix" "array" 
```

In the example above, we can see that `mat` has two classes, matrix and array.
This is as expected because all matrices are arrays.
It's out of scope for this discussion but this is an example of inheritance.

Just like, `dim` and `name` you can change the `class` attribute using `<-` assignment.

```{code-cell} r
numbers = c("1", "-2", "1000")
numbers
[1] "1"    "-2"   "1000"
class(numbers) <- "numeric"
numbers
[1]    1   -2 1000
```

While the example above, works to convert values into different types, said method is considered bad practice.
To make sure that you are performing type/class coercions safely, you can use the `as` conversions instead.

```{code-cell} r
numbers = c("1", "-2", "1000")
numbers <- as.numeric(numbers)
numbers
[1]    1   -2 1000
```

There are more attributes aside from `names`, `dim`, and class `class`.
Some of these attributes are specific to the class only.
For example, matrices can use the `colnames`, and `rownames` attributes.

```{code-cell} r
table = matrix(c(1:9), nrow = 3)
rownames(table) <- c("top", "middle", "bottom")
colnames(table) <- c("left", "center", "right")
table
       left center right
top       1      4     7
middle    2      5     8
bottom    3      6     9
table["top","right"]
[1] 7
```

To show all attributes with assigned values, you can use `attributes()`:

```{code-cell} r
attributes(table)
$dim
[1] 3 3

$dimnames
$dimnames[[1]]
[1] "top"    "middle" "bottom"

$dimnames[[2]]
[1] "left"   "center" "right" 
```

Note that `rownames` is just internally translated to `dimnames[[1]]` and `colnames` to `dimnames[[2]]`.
The attribute `dimnames` refers to dimension names, a generalization of row names, column names, and etc.

# More compound classes

Some more compound classes that you might encounter in R include `array`s which are just like matrices but can support more than two dimensions.
For example, the array below has a size of $3 \times 2 \times 4$.
You can think of it as 4 layers of $3 \times 2$ matrices

```{code-cell} r
array(1:24, dim = c(3,2,4))
, , 1

     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

, , 2

     [,1] [,2]
[1,]    7   10
[2,]    8   11
[3,]    9   12

, , 3

     [,1] [,2]
[1,]   13   16
[2,]   14   17
[3,]   15   18

, , 4

     [,1] [,2]
[1,]   19   22
[2,]   20   23
[3,]   21   24
```


Another compound class is the `list`.
You can think of it as a generalized version of a vector.
While the elements of a vector can only be homogeneous simple types, `list`s can support a mix of classes classes (including compound classes).

```{code-cell} r
list(3, "word", TRUE, c(0,1,2), matrix(c(1,2), nrow = 1), list("a", 2))
[[1]]
[1] 3

[[2]]
[1] "word"

[[3]]
[1] TRUE

[[4]]
[1] 0 1 2

[[5]]
     [,1] [,2]
[1,]    1    2

[[6]]
[[6]][[1]]
[1] "a"

[[6]][[2]]
[1] 2
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
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

Note that `head()` is a function that we use to display only the first few rows of a dataframe.
If we don't use it, it will display all rows of the dataset which can be too long.

As we can see in the example above, data frames also have helpful attributes such as the column names also known as headers, represented by the attribute `names`.
Row numbers are represented by the attribute `row.names`

```{code-cell} r
attributes(iris)
$names
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"     

$class
[1] "data.frame"

$row.names
  [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
 [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
 [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
 [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
 [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
 [91]  91  92  93  94  95  96  97  98  99 100 101 102 103 104 105 106 107 108
[109] 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126
[127] 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144
[145] 145 146 147 148 149 150
```

You can fetch elements from the data frame the same way you do for matrices. Entire rows:

```{code-cell} r
iris[20,]
   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
20          5.1         3.8          1.5         0.3  setosa
```


Entire columns:

```{code-cell} r
iris[,2]
  [1] 3.5 3.0 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 3.7 3.4 3.0 3.0 4.0 4.4 3.9 3.5
 [19] 3.8 3.8 3.4 3.7 3.6 3.3 3.4 3.0 3.4 3.5 3.4 3.2 3.1 3.4 4.1 4.2 3.1 3.2
 [37] 3.5 3.6 3.0 3.4 3.5 2.3 3.2 3.5 3.8 3.0 3.8 3.2 3.7 3.3 3.2 3.2 3.1 2.3
 [55] 2.8 2.8 3.3 2.4 2.9 2.7 2.0 3.0 2.2 2.9 2.9 3.1 3.0 2.7 2.2 2.5 3.2 2.8
 [73] 2.5 2.8 2.9 3.0 2.8 3.0 2.9 2.6 2.4 2.4 2.7 2.7 3.0 3.4 3.1 2.3 3.0 2.5
 [91] 2.6 3.0 2.6 2.3 2.7 3.0 2.9 2.9 2.5 2.8 3.3 2.7 3.0 2.9 3.0 3.0 2.5 2.9
[109] 2.5 3.6 3.2 2.7 3.0 2.5 2.8 3.2 3.0 3.8 2.6 2.2 3.2 2.8 2.8 2.7 3.3 3.2
[127] 2.8 3.0 2.8 3.0 2.8 3.8 2.8 2.8 2.6 3.0 3.4 3.1 3.0 3.1 3.1 3.1 2.7 3.2
[145] 3.3 3.0 2.5 3.0 3.4 3.0
```

Note that when fetching an entire column, you might accidentally interchange `iris[,2]` and `iris[2]`.
While both look the same and are related, the former evaluates into a vector, while the latter evaluates into a data frame with one column (specifically the second column).
In some cases, some expressions might require a data frame and in some cases expressions might require the vector itself.

Selected rows and columns:

```{code-cell} r
iris[25:30,1:2]
   Sepal.Length Sepal.Width
25          4.8         3.4
26          5.0         3.0
27          5.0         3.4
28          5.2         3.5
29          5.2         3.4
30          4.7         3.2
```

Or a single cell:

```
iris[26,3]
[1] 1.6
```

But since data frames usually come with useful attributes such as headers and row names, you can forgo indices and use said headers and row names instead.
In the example below, instead of using `iris[25:30,1:2]`, you can write the following:

```{code-cell} r
iris[25:30,c("Sepal.Length","Sepal.Width")]
   Sepal.Length Sepal.Width
25          4.8         3.4
26          5.0         3.0
27          5.0         3.4
28          5.2         3.5
29          5.2         3.4
30          4.7         3.2
```

In the case of the `iris` dataset (and most datasets), row indices and row names are the same.

If you are familiar with relational databases, you can perform also selections, joins, unions and intersections with data frames.
The example below demonstrates a selection operation (\sigma) that filters only rows that have a sepal length less than 5:

```{code-cell} r
iris[iris["Sepal.Length"] < 5,]
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
2            4.9         3.0          1.4         0.2     setosa
3            4.7         3.2          1.3         0.2     setosa
4            4.6         3.1          1.5         0.2     setosa
7            4.6         3.4          1.4         0.3     setosa
9            4.4         2.9          1.4         0.2     setosa
...
```

You can also perform aggregations on the data frame.
In the example below we can find the mean of all sepal widths for all rows:

```{code-cell} r
mean(iris[,"Sepal.Width"]"), na.rm = TRUE
[1] 3.057333
```

`na.rm = TRUE` is a flag that must be set to TRUE so that columns with NA values are not a automatically aggregated to NA.

You can combine these principles to find the mean of sepal width of species labelled as "setosa"

```{code-cell} r
mean(iris[iris["Species"] == "setosa",][,"Sepal.Width"], na.rm = TRUE)
[1] 3.428
```

You can also perform aggregations with specified groupings.
In the example below, sepal width and sepal length are aggregated using mean, grouped by species:

```{code-cell} r
aggregate(cbind(Sepal.Width,Sepal.Length) ~ Species, data = iris, FUN = mean)
     Species Sepal.Width Sepal.Length
1     setosa       3.428        5.006
2 versicolor       2.770        5.936
3  virginica       2.974        6.588
```
