% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lmm.R
\name{fitLMM}
\alias{fitLMM}
\title{Fit a linear mixed model}
\usage{
fitLMM(Kva, y, X, reml = TRUE, check_boundary = TRUE, tol = 0.0001,
  use_cpp = TRUE)
}
\arguments{
\item{Kva}{Eigenvalues of K (calculated by \code{\link{eigen_rotation}})}

\item{y}{Rotated phenotypes (calculated by \code{\link{eigen_rotation}})}

\item{X}{Rotated covariate matrix (calculated by \code{\link{eigen_rotation}})}

\item{reml}{If TRUE, use REML; otherwise use ordinary maximum likelihood.}

\item{check_boundary}{If TRUE, explicitly check log likelihood at 0 and 1.}

\item{tol}{Tolerance for convergence}

\item{use_cpp}{= if TRUE, use c++ version of code}
}
\value{
List containing estimates of \code{beta}, \code{sigmasq},
\code{hsq}, \code{sigmasq_g}, and \code{sigmasq_e}, as well as the log
likelihood (\code{loglik}).
}
\description{
Fit a linear mixed model of the form y = Xb + e where e follows a
multivariate normal distribution with mean 0 and variance matrix
\code{sigmasq_g K + sigmasq_e I}, where \code{K} is a known kniship
matrix and \code{I} is the identity matrix.
}
\examples{
data(recla)
e <- eigen_rotation(recla$kinship, recla$pheno[,1], recla$covar)
result <- fitLMM(e$Kva, e$y, e$X)
}

