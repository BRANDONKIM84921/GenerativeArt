% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/canvasknn.R
\name{canvasknn}
\alias{canvasknn}
\title{Generating abstract art from k nearest neighbors algorithm}
\usage{
canvasknn(colors, k = 3, n = 100, resolution = 30, rdist, ...)
}
\arguments{
\item{colors}{a vector of color hex codes}

\item{k}{number of neighbors to check}

\item{n}{number of generated observations for the test data}

\item{resolution}{resolution of generated image}

\item{rdist}{function for generating values (i.e. runif, rnorm, rexp)}

\item{...}{other arguments passed into the function that generates values}
}
\value{
a ggplot of abstract art
}
\description{
Generating abstract art from k nearest neighbors algorithm
}
