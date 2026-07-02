# Activity 4

Write the following functions in one file called `library.r`

1. `adaptive_greeter()`
    Create a function that accepts a name as an argument. If the number of characters in the name of the person is less than 7, the program prints "Hello, {name}". Otherwise it prints "Hi, {name}"

2. `repeat()`
    This function expects a word and a numeric. The program returns the word repeated $n$-times (where $n$ is the number inputted by the user). If the length of the resulting repeated word is more than 20, it returns "Too long, cannot print" instead
    Example 1: 
    - **arguments:** `ha`, `5`
    - **evaluation**: `hahahahaha`
    Example 2:
    - **arguments**: `ha`, `12`
    - **evaluation**: `Too long, cannot print`

    > There is a builtin function called `strrep()` which mostly does this already. For the sake of this activity, try to write this function without using `strrep()`
    > to concatenate without spaces use the function `paste0()`

3. `mean_estimate()`
    The function expects a vector of numerics.
    - If the mean of the numbers is negative, return "Negative mean" 
    - If the mean of the numbers is positive, print "Positive mean"
    - If the mean of the numbers is zero, print "Zero mean"
