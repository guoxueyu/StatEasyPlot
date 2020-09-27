#' Use geom_line() to make a plot
#'
#' This function loads a file as a matrix and makes a plot for it.The file must be whithout a header.
#'
#' @param infile path to the input file; the ylab title; ymin of ylim; ymax of ylim
#' @return a broken line graph for your input file 
#' @export
#function for plotting one line
line_plot <- function(data,ylab_str,ymin,ymax){
  df <- read.table(data,header=F)
  names(df) <- c("sample_name","iterm_num")
  df <- df[order(df$iterm_num),]
  samples <- df$sample_name
  df$samdple_name <- factor(df$sample_name,levels=samples)
  p <- ggplot()+
      geom_line(data=df,aes(x=sample_name,y=iterm_num,group=1),color="red")+
      ylim(ymin,ymax)+
      theme_classic()+
      theme_user+
      ylab(ylab_str)+
      xlab("")+
      scale_color_nejm()
  p
}

