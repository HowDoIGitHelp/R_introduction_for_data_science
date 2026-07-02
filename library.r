adaptive_greeter <- function(name) {
    if (nchar(name) < 7) {
        return(cat("Hello,", name,"\n"))
    } else {
        return(cat("Hi,", name,"\n"))
    }
}

repeatword <- function(word, n) {
    cumulative_word <- ""
    for (i in 1:n) {
        cumulative_word <- paste0(cumulative_word, word)
    }
    if (nchar(cumulative_word) <= 20) {
        cumulative_word
    } else {
        "Too long, cannot print"
    }
}

mean_estimate <- function(vec) {
    mean_value <- mean(vec)
    if (mean_value > 0) {
        "Positive Mean"
    } else if (mean_value < 0) {
        "Negative Mean"
    } else {
        "Zero Mean"
    }
}
