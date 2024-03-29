#' Perform GWAS with proxy information on family case-control status (GWAX)
#' 
#' This function uses proxy information on case-control status along with genotype data to find the likelihood that 
#' SNPs are causal. Information on parent case-control status must be included. 
#' 
#' @param rds.obj A list object with an FBM.code256 and accompanying FAM and MAP tibbles. Must contain case-control status for
#' parents in FAM. 
#' @return A list containing GWAS data and a vector of proxy status for each genotype.
#' @export 
#' 

GWAX <- function(rds.obj) {
  
  p1_Status <- rds.obj$FAM$p1_Status
  p2_Status <- rds.obj$FAM$p2_Status
  child_status <- rds.obj$FAM$Status
  FBM <- rds.obj$genotypes
  
  #Creates a vector of the proxy statuses for the child
  x <- (child_status == 1 | p1_Status == 1 | p2_Status == 1) + 0
  
  return(list(GWAS_Data = GWAS(rds.obj, x), Proxy_Status = x))
}

