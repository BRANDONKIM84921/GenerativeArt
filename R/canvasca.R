#' Generating abstract art from cellular automation
#'
#' @param color a vector of two colors to be used for the art
#' @param n number of rows and columns
#' @param iterations number of iterations of the algorithm
#' @param probability the probability of a starting sell being "alive"
#' @param conway a boolean for if Conway's Game of Life algorithm will be used
#'
#' @return a ggplot of abstract art
#'
#' @import ggplot2
#'
#' @export
canvasca <- function(colors,
                     n = 100,
                     iterations = 20,
                     probability = 0.5,
                     conway = FALSE) {

  # data validation
  if(length(colors) != 2){
    stop("Please supply a vector of exactly 2 colors.")
  }
  if(n > 999){
    stop("Consider using a smaller number of rows and columns.")
  }
  if(n < 1){
    stop("Please supply a positive number of rows and columns.")
  }
  if(iterations > 999){
    stop("Consider using a smaller number of iterations.")
  }
  if(iterations < 0){
    stop("Please supply a non-negative number of iterations.")
  }
  if((probability > 1) || (probability < 0)){
    stop("Please provide a probability in between 0 and 1.")
  }

  # matrix setup
  mat <- matrix(0, ncol = n, nrow = n)
  mat[1:n, 1:n] <- ifelse(runif(n^2) < probability, 1, 0)

  # run a cellular automation algorithm on the matrix
  if(conway == TRUE){
    mat <- game_of_life(mat, iterations)
  }
  else{
    mat <- my_ca(mat, iterations)
  }

  # create a data frame from the matrix
  df <- expand.grid(x = 1:n, y = 1:n)

  # set colors
  df$fill <- ifelse((as.vector(mat))==1, colors[1], colors[2])

  # create the plot
  plot <- ggplot(df, aes(x = x, y = y, fill = fill)) +
    geom_tile() +
    scale_fill_identity() +
    theme(axis.line = element_blank(),
          axis.text = element_blank(),
          axis.title = element_blank(),
          panel.grid = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          axis.ticks = element_blank(),
          legend.position = "none",
          plot.background = element_rect(fill = colors[2]))

  # return the plot
  return(plot)
}

#' Run Conway's Game of Life algorithm on a matrix
#'
#' @param mat a matrix
#' @param iterations number of iterations of the algorithm
#'
#' @return resulting matrix from the algorithm
#'
#' @references
#' \url{https://www.youtube.com/watch?v=6byzbkDe-RI}
game_of_life <- function(mat, iterations) {

  # initial setup
  n <- ncol(mat)
  temp_mat <- mat

  # run Conway's game of life algorithm
  # for each iteration
  for (k in 1:iterations) {
    # for each row
    for (i in 1:n) {
      # for each column
      for (j in 1:n) {
        # set the north, south, east, and west cells
        E <- j + 1
        W <- j - 1
        N <- i - 1
        S <- i + 1

        # correct to other edge if cell is out of bounds
        if (E == (n + 1)) {
          E <- 1
        }
        if (W == 0) {
          W <- n
        }
        if (N == 0) {
          N <- n
        }
        if (S == (n + 1)) {
          S <- 1
        }

        # count the number of adjacent cells that are alive
        n_alive <- mat[S, j] + mat[S, W] + mat[i, W] + mat[N, W] + mat[N, j] +
          mat[N, E] + mat[i, E] + mat[S, E]

        # if the current cell is alive and there are less than 2 adjacent alive cells
        if (mat[i, j] == 1 && n_alive < 2) {
          temp_mat[i, j] <- 0
        }
        # if the current cell is alive and there are more than 3 adjacent alive cells
        if (mat[i, j] == 1 && n_alive > 3) {
          temp_mat[i, j] <- 0
        }
        # if the current cell is alive and there are 2 or 3 adjacent alive cells
        if (mat[i, j] == 1 && (n_alive == 2 || n_alive == 3)) {
          temp_mat[i, j] <- 1
        }
        # if the current cell is dead and there exactly 3 adjacent alive cells
        if (mat[i, j] == 0 && n_alive == 3) {
          temp_mat[i, j] <- 1
        }
      }
    }

    # set the matrix to the contents of the temporary matrix
    mat <- temp_mat

  }

  # return the new matrix
  return(mat)
}

#' Run an alternate cellular automation algorithm on a matrix
#'
#' @param mat a matrix
#' @param iterations number of iterations of the algorithm
#'
#' @return resulting matrix from the algorithm
my_ca <- function(mat, iterations) {

  # initial setup
  n <- ncol(mat)
  temp_mat <- mat

  # for each iteration
  for (k in 1:iterations) {
    # for each row
    for (i in 1:n) {
      # for each column
      for (j in 1:n) {
        # set the north, south, east, and west cells
        E <- j + 1
        W <- j - 1
        N <- i - 1
        S <- i + 1

        # correct to other edge if cell is out of bounds
        if (E == (n + 1)) {
          E <- 1
        }
        if (W == 0) {
          W <- n
        }
        if (N == 0) {
          N <- n
        }
        if (S == (n + 1)) {
          S <- 1
        }

        # if a diagonal is formed with corner cells
        if ((mat[N, W] && mat[S, E]) == 1 ||
            (mat[S, W] && mat[N, E]) == 1) {
          temp_mat[i, j] <- 1
        }
        # if a row is formed with adjacent cells (vertical or horizontal)
        else if ((mat[N, j] && mat[S, j]) == mat[i,j] ||
            (mat[i, E] && mat[i, W]) == mat[i,j]) {
          temp_mat[i, j] <- 0
        }
      }
    }

    # set the matrix to the contents of the temporary matrix
    mat <- temp_mat

  }

  # return the new matrix
  return(mat)
}
