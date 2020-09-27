#' Use geom_line() and geom_histogram() to make a plot
#'
#' This function loads a file as a matrix and makes a plot for it.The file must be whithout a header.
#'
#' @param infile path to the input file; the ylab title; the type name used in geom_line(); the type name used in geom_histogram(); the type name used for orderring ; ymin of ylim; ymax of ylim
#' @return a broken line graph for your input file

#' @export

#function for plotting one line and histogram
oneline_histogram_plot <- function(data,ylab_str,line_type,histogram_type,order_type,ymin,ymax){
  df <- read.table(data,header=F)
  names(df) <-c("sample_name","iterm_num","type")
  df_order <- subset(df,type==order_type)
  df_order <- df_order[order(df_order$iterm_num),]
  samples <- df_order$sample_name
  df$sample_name <- factor(df$sample_name,levels=samples)
  df_line <- subset(df,type==line_type)
  df_his <- subset(df,type==histogram_type)
  p <- ggplot()+
    geom_histogram(data=df_his,aes(x=sample_name,y=iterm_num,group=type,fill=type),width=0.2,stat = "identity")+
    geom_line(data=df_line,aes(x=sample_name,y=iterm_num,color=type,group=1))+
    ylab(ylab_str)+
    xlab("")+
    scale_y_continuous(limits=c(ymin,ymax))+ #expand=c(0,0),
    theme_classic()+
    theme_user+
    scale_color_nejm()+
    scale_fill_nejm()+
    guides(
      guide_legend(order=1)
    )
  p
}
