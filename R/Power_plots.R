#' Create power plots from GWAS, GWAX and LTFH data
#' 
#' This function is used to calculate and plot the power for each of the models GWAS, GWAX and LTFH.
#' The function is only designed to plot all three of the plots against each other, and not any subsets.  
#' 
#' @param Gwas_data A list with exactly three entrances, with the GWAS-data obtained from each model (GWAS, GWAX and LTFH), where the data from GWAS has to be the first entrance, the data from GWAX has to be the second entrance and the data from LTFH has to be on the last entrance. 
#' @param a Significance level used to determine causal SNPs.
#' @return A ggplot object with power plots from GWAS, GWAX and LTFH, to get a visual comparison of the prediction power for each model. 
#' @export
#' 

Power_plots <- function(Gwas_data, a){
   
   if (!(length(Gwas_data) == 3)) stop("Needs GWAS_Data from all three analysis in list format")
  
    Gwas <- Gwas_data[[1]]
    Gwax <- Gwas_data[[2]]
    Ltfh <- Gwas_data[[3]]
    
    # Calculate correct input data, causal SNPs
    T1 <- Gwas %>% dplyr::mutate(causal_snp = p.value < a) %>%
      dplyr::arrange(abs(estim)) %>%
      dplyr::mutate(cpower = cumsum(causal_snp)) %>%
      dplyr::mutate(Method = "GWAS")
    
    T2 <- Gwax %>% dplyr::mutate(causal_snp = p.value < a) %>%
      dplyr::arrange(abs(estim)) %>%
      dplyr::mutate (cpower = cumsum(causal_snp)) %>%
      dplyr::mutate (Method = "GWAX")
    
    T3 <- Ltfh %>% dplyr::mutate(causal_snp = p.value < a) %>%
      dplyr::arrange(abs(estim)) %>%
      dplyr::mutate(cpower = cumsum(causal_snp)) %>%
      dplyr::mutate(Method = "LT-FH")
    
    # Plot powers
    ggplot2::ggplot(rbind(T1, T2, T3)) + 
      ggplot2::geom_line(ggplot2::aes(x = estim, y = cpower, group = Method, colour = Method)) +
      ggplot2::xlab("Estimated Effect Size") +
      ggplot2::ylab("CPower (Cumulative number of SNPs found Causal)") 
}
