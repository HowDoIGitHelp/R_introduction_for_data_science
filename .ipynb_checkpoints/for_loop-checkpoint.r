vec <-  c(3, 1, 2, -1, 0)

for (element in vec) {
    print(element)
}

total_length <- 0
for (word in c("this", "are", "some", "words")) {
    total_length <- total_length + nchar(word)
}
print(total_length)

mat <- rbind(c(1, 2), c(2, 0))
power <- 4
product <- rbind(c(1, 0), c(0, 1))

cat("current product at power =", 0, ":\n")
print(product)

for (i in 1:power) {
    product <- product %*% mat
    cat("current product at power =", i, ":\n")
    print(product)
}
