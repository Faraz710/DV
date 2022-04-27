require(MASS)
# Load data
data(iris)
head(iris, 3)
r <- lda(formula = Species ~ ., 
         data = iris, 
         prior = c(1,1,1)/3)
r$prior
r$counts
r$means
r$scaling
r$svd
prop = r$svd^2/sum(r$svd^2)
prop
r2 <- lda(formula = Species ~ ., 
          data = iris, 
          prior = c(1,1,1)/3,
          CV = TRUE)
head(r2$class)
head(r2$posterior, 3)
train <- sample(1:150, 75)
r3 <- lda(Species ~ ., # training model
          iris, 
          prior = c(1,1,1)/3, 
          subset = train)
plda = predict(object = r, # predictions
               newdata = iris[-train, ])
head(plda$class) # classification result
head(plda$posterior, 3)
head(plda$x, 3) # LD projections
lda_plot <- cbind(train, predict(r3)$x)
ggplot(plda_plot, aes(r2, r3)) + geom_point(aes(color = Species))

