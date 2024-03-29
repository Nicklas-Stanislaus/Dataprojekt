#' Generator of genotypes for children
#' 
#' This function is an internal helper function used to calculate the genotypes of 
#' children given the parents genotypes. 
#' 
#' @param p1 Matrix of genotypes where each row is the genotype of an individual.
#' @param p2 Matrix of genotypes where each row is the genotype of an individual.
#' @return The function returns a matrix of childrens genotypes where each row is a childs genotype calculated 
#' based on the row on p1 and p2 at the same index.
#' 
#' @details 
#' The genotypes for a child are calculated by finding the average genotypes of the parents, and
#' randomly rounding non-intergers. SNPs where both parents have 1 are sampled from {0,1, 2}. 
#' @keywords internal
#' @export

child_gen = function(p1, p2){
  if ((ncol(p1) != ncol(p2)) || (nrow(p1) != nrow(p2))) stop("p1 and p2 must have the same dimensions")
  
  #Finds the positions at which both parents have 1
  ph1 = which(p1 == 1, arr.ind = T) %>% dplyr::as_tibble()
  ph2 = which(p2 == 1, arr.ind = T) %>% dplyr::as_tibble()
  ind_11 = dplyr::bind_rows(dplyr::inner_join(ph1, ph2, by = c("row", "col")), 
                            dplyr::inner_join(ph1, ph2, by = c("row", "col"))) %>% dplyr::distinct()
  
  #calculates the avg genotypes for the parents 
  temp <- (p1 + p2) / 2
  
  # samples from 0,1 on positions where avg 0.5
  temp[temp == 0.5] <- sample(0:1,length(temp[temp == 0.5]), replace = TRUE)
  
  # samples from 1,2 on positions where avg 1.5
  temp[temp == 1.5] <- sample(1:2,length(temp[temp == 1.5]), replace = TRUE)
  
  # samples from 0,1,2 on positions where both parents have 1
  temp[as.matrix(ind_11)] <- sample(0:2, size = nrow(ind_11), replace = T)  
  return(temp)
}

