#' Generating abstract art from k nearest neighbors algorithm
#'
#' @param colors a vector of color hex codes
#' @param k number of neighbors to check
#' @param n number of generated observations for the test data
#' @param resolution resolution of generated image
#' @param rdist function for generating values (i.e. runif, rnorm, rexp)
#' @param ... other arguments passed into the function that generates values
#'
#' @return a ggplot of abstract art
#'
#' @import neighbr
#' @import ggplot2
#'
#' @export
canvasknn <- function(colors, k = 3, n = 100, resolution = 30, rdist, ...) {
  train <- data.frame(
    x = rdist(n, ...),
    y = rdist(n, ...),
    color = sample(colors, n, replace = T)
  )

  sequence <- seq(0, resolution, by = 1)
  test <- expand.grid(sequence, sequence)
  names(test) <- c("x", "y")

  model <- knn(train, test, k = k, categorical_target = "color", comparison_measure="euclidean")
  canvas <- test
  canvas$colors <- model$test_set_scores$categorical_target

  plot <- ggplot(data = canvas, mapping = ggplot2::aes(x = x, y = y, fill = colors)) +
    geom_raster(interpolate = TRUE, show.legend = FALSE) +
    scale_fill_manual(values = colors) +
    theme_void()

  return(plot)
}
