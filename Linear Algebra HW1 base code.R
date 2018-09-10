library(RColorBrewer)

setwd("C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework")

path = "C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework\\LeukError.RData"

load(path)


## Calculate PCA
leuk.pca = prcomp(leuk[,1:5000], scale=TRUE)

## Pick a color palette
display.brewer.all()
palette(brewer.pal(n = 3, name = "Set1"))

## Plot first 2 PCA components   !!!!!!! I couldn't get different colors for the 3 different leukemia's; help please !!!!!!!
plot(leuk.pca$x[,1], leuk.pca$x[,2], xlab = "Principal Component 1", ylab = "Principal Component 2")

## Do a biplot --> this did not work out so well; too many vectors projected onto the 2-D space (5000 original vectors!)
biplot(leuk.pca, choices = 1:2)

## Calculate percent variation captured
sum(leuk.pca$sdev[1:2]^2)/sum(leuk.pca$sdev^2)
