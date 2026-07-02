hello <- function() {
    print("Hello world")
}

greet <- function(name, honorific) {
    cat("hello", honorific, name, "\n")
}

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
