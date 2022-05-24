#' @title Manhattan plot
#' @description Produces a Manhattan plot from a regression
#' @param x A regression
#' @return A Manhattan plot with each regressor on the x-axis and their -log10(P-values) on the y-axis. 
#' @export
#' 
Manhattan_plot <- function(x) {
  ggplot2::ggplot(x, aes(x=1:length(p.value), y=-log10(p.value), size=-log10(p.value))) + 
    ggplot2::geom_point(color="blue") + 
    ggplot2::ylim(0,15) +
    ggplot2::geom_hline(yintercept=-log10(5e-7), linetype=2) +
    ggplot2::xlab("SNP") + 
    ggplot2::ylab("-log10(P-value)")  
}