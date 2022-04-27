#install.packages("igraph")
install.packages("igraph")
g<-graph.empty(n=10, directed=TRUE)
plot(g)

g<-graph.full(n=10, directed = FALSE, loops = FALSE)
plot(g)

g<-graph.star(n=10, mode="out")
plot(g)

g<-graph.star(n=10, mode="in")

plot(g)
g<-graph.ring(n=10)
plot(g)

edges <- c(1,2, 3,2, 2,4)
g<-graph(edges, n=max(edges), directed=TRUE)
plot(g)
g <- read.graph("sample_net",format="ncol",directed=F)
g
E(g)
V(g)
m <-get.adjacency(g)
m
plot(g)
g
