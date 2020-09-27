#' Use geom_line() && geom_text_repel() && geom_point() to make a plot
#'
#' This function loads a file as a matrix and makes a plot for it.The file must be whithout a header.
#'
#' @param infile path to the input file; the ylab title;
#' @return a plot for your input file

#' @export

#统计不同类型sv个数
sv_count <- function(data,ylab_str){
  df <- read.table(data,header=F)
  names(df) <-c("sample_name","iterm_num","type")
  df_sum <- subset(df,type=="SUM")
  df_sum <- df_sum[order(df_sum$iterm_num),]
  samples <- df_sum$sample_name
  df$sample_name <- factor(df$sample_name,levels=samples)
  types <- c("SUM","DEL","INS","DUP","INV","TRA","OTHER")
  df$type <- factor(df$type,levels=types)
  p <- ggplot(df,aes(x=sample_name,y=iterm_num,group=type,color=type))+
    geom_line()+geom_point(size=.5)+
    geom_text_repel(data=df_sum,aes(sample_name,iterm_num,label=iterm_num),size=2,show.legend=FALSE)+
    geom_point(data=df_sum,aes(sample_name,iterm_num),size=.5)+
    theme_classic()+
    theme_user+
    ylab(ylab_str)+
    xlab("")+
    scale_color_nejm()
    p
}
