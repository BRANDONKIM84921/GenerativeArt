#' Generating abstract polygon art from
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
#' @import ggplot2
#' @import aRtsy
#'
#' @export


generate_art <- function(fill_stroke, position_randomness, color_palette, seed) {
  # Set the seed for reproducibility
  set.seed(seed)

  # Define the canvas using ggplot
  p <- ggplot() +
    theme_void()  # remove axes and labels

  # Generate a random number of polygons
  num_polygons <- sample(1:100, 1)

  # Loop over polygons
  for(i in 1:num_polygons) {
    # Generate polygon parameters
    num_vertices <- sample(3:10, 1)
    x_coords <- runif(num_vertices, min=-1, max=1) * position_randomness
    y_coords <- runif(num_vertices, min=-1, max=1) * position_randomness
    df <- data.frame(x = x_coords, y = y_coords)

    # Define the color for this polygon
    color <- sample(color_palette, 1)

    # Add the polygon to the plot
    if(fill_stroke == "fill") {
      p <- p + geom_polygon(data = df, aes(x = x, y = y), fill = color, color = NA)
    } else if(fill_stroke == "stroke") {
      p <- p + geom_polygon(data = df, aes(x = x, y = y), fill = NA, color = color)
    }
  }

  # Return the plot
  return(p)
}
