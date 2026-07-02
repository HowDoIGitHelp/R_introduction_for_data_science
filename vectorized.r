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


variance_v <- function(vec) {
    mean <- sum(vec) / length(vec)

    square_errors = (vec - mean) * (vec - mean)
    sum(square_errors) / length(vec)
}

addone_l <- function(vec) {
    new_vector <- vec
    for (i in 1:length(vec)) {
        new_vector[i] <- new_vector[i] + 1
    }
    new_vector
}

addone_v <- function(vec) {
    vec + 1
}

special_sum_l <- function(vec) {
    cumulative_sum <- 0
    for (e in vec) {
        if (e > 0) {
            cumulative_sum <- cumulative_sum + e
        }
    }
    cumulative_sum
}

special_sum_v <- function(vec) {
    negatives <- vec < 0
    vec[negatives] <- 0
    sum(vec)
}

