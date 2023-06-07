#' Generating abstract art from logistic regression
#'
#' @param color1 first color hexcode
#' @param color2 second color hexcode
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
canvaslogreg <- function(color1, color2, n = 100, resolution = 30, rdist, ...) {
  train <- data.frame(
    x = rdist(n, ...),
    y = rdist(n, ...),
    color = sample(c(0, 1), 100, replace = T)
  )

  sequence <- seq(0, resolution, by = 1)
  canvas <- expand.grid(sequence, sequence)
  names(canvas) <- c("x", "y")

  model <- glm(color~., data = train, family = binomial(link = "logit"))

  canvas$colors <- predict(model, test, type="response")

  plot <- ggplot(data = canvas, mapping = aes(x = x, y = y, fill = colors)) +
    geom_raster(interpolate = TRUE, show.legend = FALSE) +
    scale_fill_gradient(low = color1, high = color2) +
    theme_void()

  return(plot)
}
