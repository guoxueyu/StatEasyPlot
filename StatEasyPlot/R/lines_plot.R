#' Use geom_line() to make a plot
#'
#' This function loads a file as a matrix and makes a plot for it.The file must be whithout a header.
#'
#' @param infile path to the input file; the ylab title; the type name used for ordering
#' @return a broken line graph for your input file

#' @export
#function for plotting multiple lines
lines_plot <- function(data,ylab_str,order_type){
  print(paste("order_type",order_type,sep="\t"))
  df <- read.table(data,header=F)
  names(df) <- c("sample_name","iterm_num","iterm_type")
  df_order <- subset(df,iterm_type == order_type)
  df_order <- df_order[order(df_order$iterm_num),]
  samples <- df_order$sample_name
  df$sample_name <- factor(df$sample_name,levels=samples)
  p <- ggplot()+
    geom_line(data=df,aes(x=sample_name,y=iterm_num,group=iterm_type,color=iterm_type))+
    theme_classic()+
    theme_user+
    ylab(ylab_str)+
    xlab("")+
    scale_color_nejm()
  p
}

