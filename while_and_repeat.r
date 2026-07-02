counter <- 0
while (counter < 10) {
    print("Hello world!")
    counter <- counter + 1
}

n_consecutive_heads = 0
repeat {
    result <- sample(c("heads", "tails"), 1)
    print(result)

    if (result == "tails") {
        break
    } else {
        n_consecutive_heads <- n_consecutive_heads + 1
    }
}

cat("consecutive heads:", n_consecutive_heads, "\n")
