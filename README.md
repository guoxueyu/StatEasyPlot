# StatEasyPlot
use geoms form ggplot2 to make some plots

## Overview
StatEasyPlot uses [ggplot2] [ggrepel] and [ggsci] to make plots:
- `line_plot()`
- `lines_plot()`
- `histogram_plot()`
- `oneline_histogram_plot()`
- `sv_count()`

[ggplot2]: http://ggplot2.tidyverse.org/
[ggrepel]: https://github.com/slowkow/ggrepel
[ggsci]:https://github.com/nanxstats/ggsci


## Installation
The [latest development version][github] may have new features, and you can get
it from GitHub:
```{r install-github, echo=TRUE, eval=FALSE}
# Use the devtools package
# install.packages("devtools")
devtools::install_github("guoxueyu/StatEasyPlot")
```

[github]: https://github.com/guoxueyu/StatEasyPlot

## Usage
See the [Examples] part to learn more about how to use ggrepel in your project.

## Examples
### How to use line_plot() function
The input file of this function has no header and contains two columns, as shown below

|Column one(string)  | Column two(numeric)
|------------------- | ----------
|samplename1         | 10
|samplename2         | 20
|...				 | ...

line_plot <- function(data,ylab_str,ymin,ymax){
	'''
	p
}
p <- line_plot("path/to/your/input","the ylab title",0,25)


### How to use lines_plot() function
The input file of this function has no header and contains three columns, as shown below

|Column one(string)  | Column two(numeric) |Column three(string)
|------------------- | --------------------|---------------------
|samplename1         | 10                  |type1
|samplename2         | 20				   |type2
|...                 | ...				   |...


lines_plot <- function(data,ylab_str,order_type){
	'''
	p
}

p <- lines_plot("path/to/your/input","the ylab title","type name used for ordering")

### How to use histogram_plot() function
The input file of this function has no header and contains two columns, as shown below

|Column one(string)  | Column two(numeric)
|------------------- | ----------
|samplename1         | 10
|samplename2         | 20
|...                 | ...

histogram_plot <-function(data,ylab_str,his_width){
	'''
	p
}

p <- histogram_plot("path/to/your/input","the ylab title",0.2)

### How to use oneline_histogram_plot() function

The input file of this function has no header and contains three columns, as shown below

|Column one(string)  | Column two(numeric) |Column three(string)
|------------------- | --------------------|---------------------
|samplename1         | 10                  |type1
|samplename2         | 20                  |type2
|...                 | ...                 |...

oneline_histogram_plot <- function(data,ylab_str,line_type,histogram_type,order_type,ymin,ymax){
	'''
	p
}

p <- oneline_histogram_plot("path/to/your/input","the ylab title","the type name for geom_line()","the type name for geom_histogram()","the type name for ordering",ymin,ymax)

### How to use sv_count() function
|Column one(string)  | Column two(numeric) |Column three(string)
|------------------	 | ------------------  |---------------------
|sample1			 |7942				   |DEL
|sample1	         |1511	               |DUP
|sample1	         |8862	               |INS
|sample1	         |652	               |INV
|sample1	         |164	               |TRA
|sample1	         |237	               |OTHER
|sample2	         |18368	               |SUM
|sample2             |7242                 |DEL
|sample2             |1111                 |DUP
|sample2             |8162                 |INS
|sample2             |612                  |INV
|sample2             |114                  |TRA
|sample2             |217                  |OTHER
|sample2             |11368                |SUM

sv_count <- function(data,ylab_str){
	'''
	p
}

p <- sv_count("path/to/your/input","sv number")
