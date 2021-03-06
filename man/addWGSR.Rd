% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addWGSR.R
\name{addWGSR}
\alias{addWGSR}
\title{Add the WHO Growth Reference z-scores to a data frame of anthropometric data
for weight, height or length, MUAC, head circumference, sub-scapular
skinfold and triceps skinfold.}
\usage{
addWGSR(data, sex, firstPart, secondPart, thirdPart = NA, index = NA,
  standing = NULL, output = paste(index, "z", sep = ""), digits = 2)
}
\arguments{
\item{data}{A survey dataset as a data.frame object}

\item{sex}{Name of variable specifying the sex of the subject. This must be
coded as \code{1 = male} and \code{2 = female}. Give a quoted variable
name as in (e.g.) \code{"sex"}.}

\item{firstPart}{Name of variable specifying:
  \itemize{
    \item Weight (kg) for BMI/A, W/A, W/H, or W/L
    \item Head circumference (cm) for HC/A
    \item Height (cm) for BMI/A for H/A
    \item Length (cm) for L/A
    \item MUAC (cm) for MUAC/A
    \item Sub-scapular skinfold (mm) for SSF/A
    \item Triceps skinfold (mm) for TSF/A
  }

  Give a quoted variable name as in (e.g.) \code{"weight"}. Be careful with
  units (weight in kg; height, length, head circumference, and MUAC in cm,
  skinfolds in mm).}

\item{secondPart}{Name of variable specifying:
  \itemize{
    \item Age (days) for H/A, HC/A, L/A, MUAC/A, SSF/A, or TSF/A
    \item Height (cm) BMI/A or W/H
    \item Length (cm) for W/L
  }

  Give a quoted variable name as in (e.g.) \code{"age"}. Be careful with
  units (age in days; height and length in cm).}

\item{thirdPart}{Name of variable specifying age (in days) for BMI/A. Give a
quoted variable name as in (e.g.) \code{"age"}. Be careful with units
(age in days).}

\item{index}{The index to be calculated and added to \code{data}. One of:
  \describe{
    \item{\code{bfa}}{BMI for age}
    \item{\code{hca}}{Head circumference for age}
    \item{\code{hfa}}{Height for age}
    \item{\code{lfa}}{Length for age}
    \item{\code{mfa}}{MUAC for age}
    \item{\code{ssa}}{Sub-scapular skinfold for age}
    \item{\code{tsa}}{Triceps skinfold for age}
    \item{\code{wfa}}{Weight for age}
    \item{\code{wfh}}{Weight for height}
    \item{\code{wfl}}{Weight for length}
 }

 Give a quoted index name as in (e.g.) \code{"wfh"}.}

\item{standing}{Variable specifying how stature was measured. If NULL then age
(for \code{"hfa"} or \code{"lfa"}) or height rules (for \code{"wfh"} or
\code{"wfl"}) will be applied. This must be coded as \code{1 = Standing};
\code{2 = Supine}; \code{3 = Unknown}. All other values will be recoded to
\code{3 = Unknown}. Give a quoted variable name as in (e.g.) \code{"measured"}
or a single value (e.g.\code{"measured = 1"}). If no value (or NULL) is
specified then height and age rules will be applied.}

\item{output}{The name of the column containing the specified index to be
added to the dataset. This is an optional parameter. If you do not specify
a value for output then the added column will take the name of the specified
index with a \code{"z"} appended.}

\item{digits}{The number of decimal places for \code{output}. Defaults to 2 d.p.}
}
\value{
A data.frame of the survey dataset with the calculated z-scores added.
}
\description{
Add the WHO Growth Reference z-scores to a data frame of anthropometric data
for weight, height or length, MUAC, head circumference, sub-scapular
skinfold and triceps skinfold.
}
\examples{
# Calculate weight-for-height (wfh) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "weight",
        secondPart = "height",
        index = "wfh")

# Calculate weight-for-age (wfa) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "weight",
        secondPart = "age",
        index = "wfa")

# Calculate height-for-age (hfa) for the anthro3 dataset
addWGSR(data = anthro3,
        sex = "sex",
        firstPart = "height",
        secondPart = "age",
        index = "hfa")

# Calculate MUAC-for-age (mfa) for the anthro4 dataset

## Convert age in anthro4 from months to days
testData <- anthro4
testData$age <- testData$agemons * (365.25 / 12)

addWGSR(data = testData,
        sex = "sex",
        firstPart = "muac",
        secondPart = "age",
        index = "mfa")

}
