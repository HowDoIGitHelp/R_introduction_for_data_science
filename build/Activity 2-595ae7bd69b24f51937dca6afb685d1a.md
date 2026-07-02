# Activity 2

1. To begin you need to load the builtin dataset called `iris` as a matrix. Store said dataset into a matrix called `M`.

    ```r
    M <- as.matrix(iris[,1:4])
    ```
    > To explain the code above, `iris` is a builtin dataframe in R. We extract the first four columns, (hence `iris[,1:4]`) since the fifth column is not numeric. We convert the first four columns into a matrix using the function `as.matrix()`.

2. Find the mean for every column in matrix `M`. You should end up with 4 means. Column 1 in the matrix refers to the Sepal Length, Column 2 refers to the Sepal Width, Column 3 refers to the Petal Length and Column 4 refers to the Petal Width.

3. Create a new vector called `sepal_size`, every element in this vector should be the product of sepal length and sepal width of each row in matrix `M`. For example, the first three rows in `M` is the following:
    
    ```r
    [1,]          5.1         3.5          1.4         0.2
    [2,]          4.9         3.0          1.4         0.2
    [3,]          4.7         3.2          1.3         0.2
    ...
    ```
    The first 3 elements in `sepal_size` should be the products:
    
    ```r
    [1] 17.85 14.70 15.04 ...
    ```

4. Find the largest value in `sepal_size`, which can be calculated using `max(sepal_size)`. Find the index of the largest value using `which.max(sepal_size)`.
