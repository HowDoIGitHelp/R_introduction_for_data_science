variance_v <- function(vec) {
    mean_value <- mean(vec)

    errors <- (vec - mean_value)
    square_errors <- errors * errors
    mean(square_errors)
}
