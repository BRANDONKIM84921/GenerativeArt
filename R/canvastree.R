#' Generating abstract art from a decision tree
#'
#' @param colors a vector of color hex codes
#' @param n number of generated observations for the test data
#' @param resolution resolution of generated image
#' @param rdist function for generating values (i.e. runif, rnorm, rexp)
#' @param ... other arguments passed into the function that generates values
#'
#' @return a ggplot of abstract art
#'
#' @import ggplot2
#'
#' @export
canvastree <- function(colors, n = 100, resolution = 30, rdist, ...) {
  train <- data.frame(
    x = as.numeric(rdist(n, ...)),
    y = as.numeric(rdist(n, ...))
  )

  train <- train[order(train$x, train$y),]

  train$color <- factor(sort(rep(colors, times = ceiling(n/length(colors))))[1:n])

  sequence <- seq(0, resolution, by = 1)
  canvas <- expand.grid(sequence, sequence)
  names(canvas) <- c("x", "y")

  model <- party::ctree(color ~ ., data = train)
  canvas$colors <- predict(model, canvas, type = "response")

  plot <- ggplot(data = canvas, mapping = aes(x = x, y = y, fill = colors)) +
    geom_raster(interpolate = TRUE, show.legend = FALSE) +
    scale_fill_manual(values = colors) +
    theme_void()

  return(plot)
}
