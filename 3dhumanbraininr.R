#install.packages("remotes")
#remotes::install_github("sidchop/brainconn")

library(brainconn)
brainconn(atlas ="schaefer300_n7", conmat=example_unweighted_undirected, view="ortho")
x <- example_unweighted_undirected
p <- brainconn3D(atlas ="schaefer300_n7", conmat=x, show.legend = F)
p
??brainconn




library(brainconn)
x <- example_unweighted_undirected
brainconn(atlas ="schaefer300_n7", conmat=x, node.size = 3, view="ortho")
brainconn(atlas ="schaefer300_n7", conmat=example_unweighted_undirected, view="left", node.size = 3, node.color = "hotpink", edge.width = 2, edge.color="darkblue", edge.alpha = 0.8, all.nodes = T, show.legend = F)


## Not run: 
library(brainconn)
a=custom_atlas_example
check_atlas(a)

## End(Not run)



library(R.matlab)
path="/Users/ali/Desktop/apr/atlss3d/coordinates.mat"
data=readMat(path)
coordinates=round(data$coordinates)

colnames(coordinates)=c("ROI.Name","x.mni","y.mni","z.mni")
coordinates=as.data.frame(round(coordinates))
coordinates$ROI.Name=as.integer(coordinates$ROI.Name)
coordinates$x.mni=as.integer(coordinates$x.mni)
coordinates$y.mni=as.integer(coordinates$y.mni)
coordinates$z.mni=as.integer(coordinates$z.mni)
check_atlas(coordinates)


x=matrix(0,84,84)
x[1,2]=x[2,1]=1
rownames(x)=colnames(x)=coordinates[,1]

brainconn(atlas =coordinates, conmat=x, 
          view="front", node.size = 2, 
          node.color = "hotpink", 
          edge.width = 1, edge.color="darkblue", 
          edge.alpha = 0.8, 
          all.nodes = T, 
          show.legend = T)

