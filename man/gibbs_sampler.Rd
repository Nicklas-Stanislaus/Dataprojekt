% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gibbs_sampler.R
\name{gibbs_sampler}
\alias{gibbs_sampler}
\title{Gibbs sample posterior mean genetic liabilities}
\usage{
gibbs_sampler(config, burn_in, cov_mat, prevalence)
}
\arguments{
\item{config}{Vector of configuration, with 1 when case and 0 when not case. First position specifies
case-control status of target individual, second position that of parent 1, third of parent 2,
and the rest that of siblings. Fx. a configuration vector for when individual has case, parent 1 has case
parent 2 does NOT have case and 1 sibling has case is c(1,1,0,1).}

\item{burn_in}{An integer that specifies the burn-in period before sampling for the mean.}

\item{cov_mat}{Co-variance matrix modeling the liabilities.}

\item{prevalence}{Integer specifying the likelihood of having the disease in the population.}
}
\value{
The posterior mean genetic liability of the configuration.
}
\description{
This function is used as a helper function for the LT-FH function. It calculates the
posterior mean genetic liability for individuals with a given
configuration (case-control status of individual,
parents and siblings) when a co-variance matrix modeling the
liabilities and prevalence of disease is given.
}
