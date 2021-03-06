% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/class.r
\docType{class}
\name{rodeo-class}
\alias{rodeo}
\alias{rodeo-class}
\title{A reference class to represent an ODE-based model.}
\description{
A reference class to represent an ODE-based model.
}
\section{Fields}{

\describe{
\item{\code{PROS}}{A data frame with fields 'name', 'unit', 'description', and
'expression' defining the process rates.}

\item{\code{STOI}}{A data frame with fields 'variable', 'process', and 'expression'
reprenting the stoichiometry matrix in data base format.}

\item{\code{VARS}}{A data frame with fields 'name', 'unit', 'description' declaring
the state variables of the model. The declared names become valid
identifiers to be used in the expression fields of \code{PROS} or \code{STOI}.}

\item{\code{PARS}}{A data frame of the same structure as \code{vars} declaring the
parameters of the model. The declared names become valid
identifiers to be used in the expression fields of \code{PROS} or \code{STOI}.}

\item{\code{FUNS}}{A data frame of the same structure as \code{vars} declaring any
functions referenced in the expression fields of \code{PROS} or \code{STOI}.}
}}
\section{Methods}{

\describe{
\item{\code{arrangePars(x, sep = ".", warnUnused = TRUE)}}{Build a vector of parameters from list \code{x}. The list elements can
either be vectors (with length according to the number of spatial levels) or
scalars. The latter are recycled for all spatial levels. Element names are
constructed by appending the level index to the original names using the
specified separator. If there is a single level only, element names are
identical to the original names (no suffix).}

\item{\code{arrangeVars(x, sep = ".", warnUnused = TRUE)}}{Build a vector of state variables from list \code{x}. The list elements can
either be vectors (with length according to the number of spatial levels) or
scalars. The latter are recycled for all spatial levels. Element names are
constructed by appending the level index to the original names using the
specified separator. If there is a single level only, element names are
identical to the original names (no suffix).}

\item{\code{generate(lang, name = "derivs")}}{Generates code to compute the variables' derivatives with respect
to time. \bold{Arguments:} \code{name}: A string giving the name for the
generated function/routine. \bold{Returns:} The generated code as a string.}

\item{\code{initialize(vars, pars, funs, pros, stoi)}}{Initializes a rodeo object}

\item{\code{stoichiometryMatrix(values = NULL)}}{Returns the stoichiometry information as a matrix of character expressions (if
\code{values} is \code{NULL}) or numeric data (if values of variables and
parameters are specified in \code{values}).}
}}
\examples{
# see vignette
}

