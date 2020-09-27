#' Use geom_histogram() to make a plot
#'
#' This function loads a file as a matrix and makes a plot for it.The file must be whithout a header.
#'
#' @param infile path to the input file; the ylab title; width for his
#' @return a broken line graph for your input file

#' @export
#function for plotting histogram
histogram_plot <-function(data,ylab_str,his_width){
  df <- read.table(data,header=F)
  names(df) <- c("sample_name","iterm_num")
  df <- df[order(df$iterm_num),]
  samples <- df$sample_name
  df$sample_name <- factor(df$sample_name,levels=samples)
  p <- ggplot()+
    geom_histogram(data=df,aes(x=sample_name,y=iterm_num,group=1,fill=""),width=his_width,position = "dodge",stat = "identity",show.legend=FALSE)+
    theme_classic()+
    theme_user+
    ylab(ylab_str)+
    xlab("")+
    scale_fill_nejm()
  p
}
