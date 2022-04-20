

m=ICBM152_front
bbb=m[,,3]
dim(m)
background.alpha=0.2 
aaa=m[,,4]
aaa[aaa!=0]=background.alpha
#m[,,4]=aaa
w <- matrix(rgb(m[,,1],m[,,2],m[,,3], m[,,4]), nrow=dim(m)[1])
background <- grid:: rasterGrob(w)
plot(background$raster)
# aaaa=raster::as.matrix(background$raster)
# 
# png('file.png', height=nrow(r), width=ncol(r)) 
# library(raster)
# raster::plot(background$raster)
# dev.off()

#aaaaa=raster(file)

library(ggplot2)
# Dummy plot
df <- data.frame(x = 1:10, y = 1:10)
base <- ggplot(df, aes(x, y)) +
  geom_blank() +
  theme_bw()

# Full panel annotation
base + annotation_custom(
  grob = grid::roundrectGrob(),
  xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
)

library(ggplot2)
# Inset plot
df2 <- data.frame(x = 1 , y = 1)
g <- ggplotGrob(ggplot(df2, aes(x, y)) +
                  geom_point() +
                  theme(plot.background = element_rect(colour = "black")))
base +
  annotation_custom(background, xmin = 0, xmax = 10, ymin = 0, ymax = 10)




ICBM152_left=OpenImageR::readImage("/Users/ali/Desktop/apr/atlss3d/brainconmod/aabb.png")
dim(ICBM152_left)
m=ICBM152_left
background.alpha=1
save(ICBM152_left, file = "ICBM152_left.rda")

w <- matrix(rgb(m[,,1],m[,,2],m[,,3], m[,,4] * background.alpha), nrow=dim(m)[1])
background <- grid:: rasterGrob(w)





ICBM152_front=OpenImageR::readImage("/Users/ali/Desktop/apr/atlss3d/brainconmod/front.png")
dim(ICBM152_front)
m=ICBM152_bottom
background.alpha=1
save(ICBM152_front, file = "ICBM152_front.rda")

w <- matrix(rgb(m[,,1],m[,,2],m[,,3], m[,,4] * background.alpha), nrow=dim(m)[1])
background <- grid:: rasterGrob(w)

