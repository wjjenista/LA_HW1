library(RColorBrewer)
library(ggplot2)

rm(list=ls())

#setwd("C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework")
setwd("C:\\Users\\Steven\\Documents\\MSA\\Analytics Foundations\\lab and hw\\Linear Algebra\\HW1 Repo")

#path = "C:\\Users\\Bill\\Documents\\NCSU\\Course Work\\Fall\\Linear Algebra\\Homework\\LeukError.RData"
path = "C:\\Users\\Steven\\Documents\\MSA\\Analytics Foundations\\lab and hw\\Linear Algebra\\LeukError.RData"

load(path)

## Calculate PCA
leuk.pca = prcomp(leuk[,1:5000], scale=FALSE)
View(leuk[,1:50])

## Pick a color palette
display.brewer.all()
palette(brewer.pal(n = 3, name = "Set1"))


## Plot first 2 PCA components
plot(leuk.pca$x[,1], leuk.pca$x[,2], col=leuk$V5001, xlab = "Principal Component 1", ylab = "Principal Component 2")


#refining PCA output into a dataframe
# and adding factor of leukemia class for easier referencing w/ ggplot 
# 3rd pca included for possible 3D Modelling
pca_df <- as.data.frame(leuk.pca$x[,1:3])
leuk_class <- leuk$V5001
pca_df <- cbind(pca_df, leuk_class)
id <- c(1:38)
pca_df <- cbind(pca_df, id)
str(pca_df)


############ PLOTTING
#Base plot
pc_plot <- ggplot(pca_df, aes(x=PC1, y=PC2)) +
  geom_point(aes(color = leuk_class)) +
  coord_cartesian() +
  theme_bw()

#plot with all labels
pc_plot +
  geom_text(aes(label=id), hjust=1, vjust=0)

#plot with more selective labels
labeled_pts <- c(2, 10, 19, 20, 23) #change this line to select which points to label
pc_plot +
  geom_text(data=subset(pca_df, id %in% labeled_pts),
            aes(label=id, hjust=1, vjust=0))

## Calculate percent variation captured
sum(leuk.pca$sdev[1:2]^2)/sum(leuk.pca$sdev^2)
