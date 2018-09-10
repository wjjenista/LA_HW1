library(RColorBrewer)

#setwd("C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework")
setwd("C:\\Users\\Steven\\Documents\\MSA\\Analytics Foundations\\lab and hw\\Linear Algebra\\HW1 Repo")

#path = "C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework\\LeukError.RData"
path = "C:\\Users\\Steven\\Documents\\MSA\\Analytics Foundations\\lab and hw\\Linear Algebra\\LeukError.RData"

load(path)


## Calculate PCA
leuk.pca = prcomp(leuk[,1:5000], scale=FALSE)

## Pick a color palette
display.brewer.all()
palette(brewer.pal(n = 3, name = "Set1"))

## Plot first 2 PCA components   !!!!!!! I couldn't get different colors for the 3 different leukemia's; help please !!!!!!!
plot(leuk.pca$x[,1], leuk.pca$x[,2], col=leuk$V5001, xlab = "Principal Component 1", ylab = "Principal Component 2")

#refining PCA output into a dataframe
# and adding factor of leukemia class for easier referencing w/ ggplot 
# 3rd pca included for possible 3D Modelling
pca_df <- as.data.frame(leuk.pca$x[,1:3])
leuk_class <- leuk$V5001
pca_df <- cbind(pca_df, leuk_class)
str(pca_df)

#plot
ggplot(pca_df) +
  geom_point(aes(x=PC1, y=PC2, color = leuk_class)) +
  coord_cartesian() +
  theme_bw()


## Do a biplot --> this did not work out so well; too many vectors projected onto the 2-D space (5000 original vectors!)
biplot(leuk.pca, choices = 1:2)

## Calculate percent variation captured
sum(leuk.pca$sdev[1:2]^2)/sum(leuk.pca$sdev^2)
