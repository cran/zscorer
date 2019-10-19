## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if(!require(zscorer)) install.packages("zscorer")


## ----usage1, echo = TRUE, eval = FALSE-----------------------------------
#  anthro3

## ----usage1a, echo = FALSE, eval = TRUE----------------------------------
head(anthro3)

## ----usage2, echo = TRUE, eval = TRUE------------------------------------
svy <- addWGSR(data = anthro3, sex = "sex", firstPart = "weight",
               secondPart = "height", index = "wfh")

## ----usage2a, echo = FALSE, eval = TRUE----------------------------------
head(svy)

## ----usage2b, echo = TRUE, eval = FALSE----------------------------------
#  ?addWGSR

## ----usage3, echo = TRUE, eval = TRUE------------------------------------
table(is.na(svy$wfhz))

## ----usage4, echo = TRUE, eval = TRUE------------------------------------
svy[is.na(svy$wfhz), ]

## ----usage5, echo = TRUE, eval = TRUE------------------------------------
svy <- addWGSR(data = svy, sex = "sex", firstPart = "weight", 
               secondPart = "age", index = "wfa")

## ----usage5a, echo = TRUE, eval = TRUE-----------------------------------
summary(svy$wfaz)

## ----usage5b, echo = TRUE, eval = TRUE-----------------------------------
svy$age <- svy$age * (365.25 / 12)
head(svy)

## ----usage5c, echo = TRUE, eval = TRUE-----------------------------------
svy <- addWGSR(data = svy, sex = "sex", firstPart = "weight", 
               secondPart = "age", index = "wfa")
head(svy)
summary(svy$wfaz)

## ----usage6, echo = TRUE, eval = TRUE------------------------------------
svy$muac <- svy$muac / 10
head(svy)

## ----usage6a, echo = TRUE, eval = TRUE-----------------------------------
svy <- addWGSR(svy, sex = "sex", firstPart = "muac",	
               secondPart = "age", index = "mfa")
head(svy)

## ----usage7, echo = TRUE, eval = TRUE------------------------------------
svy <- addWGSR(data = svy, sex = "sex", firstPart = "weight", 
               secondPart = "height", thirdPart = "age", index = "bfa", 
               output = "bmiAgeZ", digits = 4)
head(svy)

