#From the given 'Iris' dataset, predict the optimum number of clusters and
#represent it visually.

#importing the data
Iris=read.csv("C:/Users/ADMIN/OneDrive/Desktop/spark intenship/Task 2-Kmean clustering/Iris.csv",header = TRUE)
#view the data
View(Iris)
head(Iris)

#to check if data contain any missing values or a outlier 
summary(Iris)
#from the result we can see that data does not contain any outliar as well as it doesnot have any missing value


#creating same data set where we remove the unwanted colums
Iris.f=Iris
Iris.f$Species=NULL #we remove species column so that there is no biasness towards any speacies
View(Iris.f)
# as we can see all the variables have diffrent sclaes it very difficault to campare them 
#for that we normalize the scale of all

Iris.stand=scale(Iris.f[-1])
View(Iris.stand)
#now we can compare them easyly accorind to diffren atributes

#Kmeans algorithm is an iterative algorithm that tries to partition the dataset into Kpre-defined distinct non-overlapping subgroups (clusters) 
#where each data point belongs to only one group. ... Keep iterating until there is no change to the centroids. 
#i.e assignment of data points to clusters isn't changing.

results=kmeans(Iris.stand,3) #since there are only 3 species therefore we used 3 clusters 
#here k stand of no of clusters 
attributes(results) 
results

results$centers
#these are the centers of each attributes 
#to see the clustering with orignal data
table(Iris$Species,results$cluster)
#the reslts shows how accurate the clustering is done 
#as we see for Iris-setosa is accuratelty classified 
#where as there is an error while classifing for Iris-versicolor,Iris-virginica

plot(Iris[c("SepalLengthCm","SepalWidthCm")],col=results$cluster)
plot(Iris[c("PetalLengthCm","PetalWidthCm")],col=results$cluster) #col baised clusters
plot(Iris[c("PetalLengthCm","PetalWidthCm")],col=Iris$Species)    #col baised on oringal group 

