% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/openRds.R
\name{OpenRds}
\alias{OpenRds}
\title{Open a .rds file}
\usage{
OpenRds(path)
}
\arguments{
\item{path}{Path to file (DO NOT INCLUDE FILE EXTENSION).}
}
\value{
The rds object saved in a .rds file.
}
\description{
This function is used to open a saved .rds file. If the path does not exist
the function returns a error message.
}
