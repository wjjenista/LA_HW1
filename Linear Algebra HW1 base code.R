library(RColorBrewer)
library(ggplot2)

setwd("C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework")

path = "C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework\\LeukError.RData"

load(path)


## Calculate PCA
leuk.pca = prcomp(leuk[,1:5000], scale=TRUE)

## Pick a color palette
display.brewer.all()
palette(brewer.pal(n = 3, name = "Set1"))

## Plot first 2 PCA components
plot(leuk.pca$x[,1], leuk.pca$x[,2], col=leuk$V5001, xlab = "Principal Component 1", ylab = "Principal Component 2")

## Calculate percent variation captured
sum(leuk.pca$sdev[1:2]^2)/sum(leuk.pca$sdev^2)
