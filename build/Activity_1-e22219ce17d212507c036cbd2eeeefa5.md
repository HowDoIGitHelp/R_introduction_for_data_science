# Activity 1

1. In your R repl, create the following vectors and store them with the name `v_1`, `v_2`, `v_3`, and `v_4`:
    
    $$
    \begin{aligned}
        \mathbf{v_1} = \begin{bmatrix} 1\\2\\-1\\3\\-1 \end{bmatrix}\\
        \mathbf{v_2} = \begin{bmatrix} 2\\2\\-1\\-1\\0 \end{bmatrix}\\
        \mathbf{v_3} = \begin{bmatrix} 3\\2\\0\\3\\2 \end{bmatrix}\\
        \mathbf{v_4} = \begin{bmatrix} 1\\-2\\2\\0\\0 \end{bmatrix}
    \end{aligned}
    $$
    
2. In linear algebra, the dot product is a scalar measurement that calculates the similarity between two vectors. It is calculated using the following:
    
    Given n_dimensional vectors $\mathbf{x}$ and $\mathbf{y}$, The dot product $\mathbf{x} \cdot \mathbf{y}$ can be calculated as:

    $$
    \begin{aligned}
        \text{Let } \mathbf{x} = \begin{bmatrix} x_1, x_2, x_3, \vdots x_n \end{bmatrix}\\
        \text{Let } \mathbf{y} = \begin{bmatrix} y_1, y_2, y_3, \vdots y_n \end{bmatrix}\\
        \\
        \mathbf{x} \cdot \mathbf{y} = x_1 y_1 + x_2 y_2 + x_3 y_3 + \cdots + x_n y_n
    \end{aligned}
    $$

    The dot product can also be calculated as the matrix operation $\mathbf{x}^T \mathbf{y}$

    Note that in R, using the `*` operation will multiply the vectors element wise. If you really want to perform matrix multiplication you can use the operator `%*%`.

    Calculate the dot product for every possible pair in the set of vectors `v_1`, `v_2`, `v_3`, and `v_4`.

3. The larger the dot product, the more similar the two vectors are. Find the most similar pair of vectors among the 4 vectors.
