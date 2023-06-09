# Generative Art Package

### Contributors: Aiden Kelly, Brandon Kim, Sam Todd

## **canvasca** - Cellular Automation

This function creates generative art using cellular automation. The only parameter that the user is required to pass in is a vector of two colors. These colors are used to color the alive (color 1) and dead (color 2) cells. The second color is also used as the background color. The logarithm  first creates a matrix with a size specified by the user or with the default value (100*100). Each element of the matrix is set to either 0 or 1 using either a probability specified by the user or a default value (0.5). The algorithm then checks a variety of rules for each cell. These rules use the value (alive or dead) of the current cell and adjacent cell to decide whether the current cell should be changed to a different value (alive or dead). This process is repeated for a certain number of iterations specified by the user or a default value (20). The user is also given the choice of two cellular automation algorithms to use in the generation of the art. If not value is specified, an algorithm that looks at diagonal and adjacent cells to decide the value of the current cell is used. If a value is specified (conway = "TRUE"), Conway's Game of Life algorithm is used instead. This algorithm uses the number of adjacent cells that are alive to decide the value of the current cell. After all iterations are completed, a plot of the resulting art is returned.

## **canvasknn** - K Nearest Neighbors

This function creates generative art using the KNN algorithm. The user needs to input a vector of colors, the number of observations that the model is trained on, the outputted resolution of the generative art, the number of neighbors the model checks, and the distribution in which the values of the training dataset is generated from. Each observation in the training dataset will be randomly selected one of the colors from the vector of colors. This will then train a model based off the training data, and will predict the color that each pair of integers in a resolution*resolution grid will become. 

## **canvaslogreg** - Logistic Regression

This function creates generative art using logistic regression. The user needs to input a two colors, the number of observations that the model is trained on, the outputted resolution of the generative art, and the distribution in which the values of the training dataset is generated from. Each observation in the training dataset will be randomly selected one of the two colors. This will then train a model based off the training data, and will predict the color that each pair of integers in a resolution*resolution grid will become. Since logistic regression is primarily used with binary classification, we made the choice of only having 2 color parameters. 

## **canvastree** - Decision Tree

This function creates generative art using a decision tree. The user needs to input a vector of colors, the number of observations that the model is trained on, the outputted resolution of the generative art, and the distribution in which the values of the training dataset is generated from. Each observation in the training dataset will be randomly selected one of the colors from the vector of colors. This will then train a model based off the training data, and will predict the color that each pair of integers in a resolution*resolution grid will become. 
