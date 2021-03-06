% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addWGSR.R
\name{getWGSR}
\alias{getWGSR}
\title{Calculate WHO Growth Reference z-score for a given anthropometric
measurement.}
\usage{
getWGSR(sex, firstPart, secondPart, index = NA, standing = NA,
  thirdPart = NA)
}
\arguments{
\item{sex}{Sex of the subject. This must be coded as \code{1 = male} and
\code{2 = female}.}

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
  specified then height and age rules will be applied.
zz}

\item{thirdPart}{Name of variable specifying age (in days) for BMI/A. Give a
quoted variable name as in (e.g.) \code{"age"}. Be careful with units
(age in days).}
}
\value{
A numeric value or vector of z-scores for the specified \code{index}.
}
\description{
This function is usually called by the \code{addWGSR()} function
but could be used as a stand-alone calculator for getting z-score for a given
anthropometric measurement.
}
\examples{
# Given a male child 10 months old with a weight of 5.7 kgs, height of 64.2
# cms, and MUAC of 125 mm:
#
# Calculate weight-for-height
getWGSR(sex = 1,
        firstPart = 5.7,
        secondPart = 64.2,
        index = "wfh",
        standing = 3)

# calculate weight-for-age
getWGSR(sex = 1,
        firstPart = 5.7,
        secondPart = 10,
        index = "wfa",
        standing = 3)

# calculate height-for-age
getWGSR(sex = 1,
        firstPart = 64.2,
        secondPart = 10,
        index = "hfa",
        standing = 3)

# Calculate MUAC-for-age z-score for a girl
getWGSR(sex = 1,
        firstPart = 20,
        secondPart = 62 * (365.25 / 12),
        index = "mfa")

}
