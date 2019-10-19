## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if(!require(zscorer)) install.packages("zscorer")


## ----example1, eval = TRUE-----------------------------------------------
# weight-for-age z-score
waz <- getWGS(sexObserved = 1,     # 1 = Male / 2 = Female
              firstPart = 14.6,    # Weight in kilograms up to 1 decimal place
              secondPart = 52,     # Age in whole months
              index = "wfa")       # Anthropometric index (weight-for-age)

waz

# height-for-age z-score
haz <- getWGS(sexObserved = 1,
              firstPart = 98,      # Height in centimetres
              secondPart = 52,
              index = "hfa")       # Anthropometric index (height-for-age)

haz

# weight-for-height z-score
whz <- getWGS(sexObserved = 1,
              firstPart = 14.6,
              secondPart = 98,
              index = "wfh")       # Anthropometric index (weight-for-height)

whz

## ----sample-data1, eval = FALSE------------------------------------------
#  # Make a call for the anthro1 dataset
#  anthro1

## ---- echo = FALSE, eval = TRUE------------------------------------------
library(zscorer)

## ----sample-data2, eval = TRUE-------------------------------------------
head(anthro1)

## ----example2, eval = TRUE-----------------------------------------------
# weight-for-age z-score
waz <- getCohortWGS(data = anthro1,
                    sexObserved = "sex",
                    firstPart = "weight",
                    secondPart = "age",
                    index = "wfa")
head(waz, 50)

# height-for-age z-score
haz <- getCohortWGS(data = anthro1,
                    sexObserved = "sex",
                    firstPart = "height",
                    secondPart = "age",
                    index = "hfa")
head(haz, 50)

# weight-for-height z-score
whz <- getCohortWGS(data = anthro1,
                    sexObserved = "sex",
                    firstPart = "weight",
                    secondPart = "height",
                    index = "wfh")
head(whz, 50)

## ----example3, eval = TRUE-----------------------------------------------
# weight-for-age z-score
zScores <- getAllWGS(data = anthro1,
                     sex = "sex",
                     weight = "weight",
                     height = "height",
                     age = "age",
                     index = "all")
head(zScores, 20)

