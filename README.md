# Generative Art Package

### Contributors: Aiden Kelly, Brandon Kim, Sam Todd

## **canvasca** - Cellular Automation

This function creates generative art using cellular automation. The only parameter that the user is required to pass in is a vector of two colors. These colors are used to color the alive (color 1) and dead (color 2) cells. The second color is also used as the background color. The logarithm  first creates a matrix with a size specified by the user or with the default value (100*100). Each element of the matrix is set to either 0 or 1 using either a probability specified by the user or a default value (0.5). The algorithm then checks a variety of rules for each cell. These rules use the value (alive or dead) of the current cell and adjacent cell to decide whether the current cell should be changed to a different value (alive or dead). This process is repeated for a certain number of iterations specified by the user or a default value (20). The user is also given the choice of two cellular automation algorithms to use in the generation of the art. If not value is specified, an algorithm that looks at diagonal and adjacent cells to decide the value of the current cell is used. If a value is specified (conway = "TRUE"), Conway's Game of Life algorithm is used instead. This algorithm uses the number of adjacent cells that are alive to decide the value of the current cell. After all iterations are completed, a plot of the resulting art is returned.

## **canvasknn** - K Nearest Neighbors

[insert description]

## **canvaslogreg** - Logistic Regression

[insert description]

## **canvastree** - Decision Tree

[insert description]
