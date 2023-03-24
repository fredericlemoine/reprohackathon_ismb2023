process fig1 {
publishDir "figures", mode: 'copy'
label 'R'

input:
path nfsmdata

output:
path "fig.1.pdf"

script:
"""
#!/usr/bin/env Rscript
library("ggplot2")
library("ggthemes")

counts=read.table("${nfsmdata}")
colnames(counts)=c("Date","Workflow")
pdf("fig.1.pdf",width=7,height=5)
ggplot(counts,aes(x=factor(Date),fill=Workflow))+geom_bar()+scale_colour_colorblind()+scale_fill_colorblind()+xlab("Date")+ylab("Nb articles")+theme_bw()
dev.off()
"""
}

process fig4_5 {
publishDir "figures", mode: 'copy'

label 'R'

input:
path group_data

output:
path "*.svg"

script:
"""
#!/usr/bin/env Rscript
library("ggplot2")
library("ggthemes")

project=read.table("${group_data}",header=T,na.strings="N/A")
svg("fig.4.A.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=workflow))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("fig.4.B.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=run_cont))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("fig.4.C.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=build_cont))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("fig.5.A.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),y=nb_commits, fill=factor(date)))+geom_violin(alpha = 0.5)+geom_point(position = position_jitter(seed = 1, width = 0.2))+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("Nb commits")+theme(legend.position = "none")
dev.off()

svg("fig.5.B.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),y=nb_lines, fill=factor(date)))+geom_violin(alpha = 0.5)+geom_point(position = position_jitter(seed = 1, width = 0.2))+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("Nb lines of code")+theme(legend.position = "none")
dev.off()
"""
}

workflow {
nfsmdata=file("data/nf_sm_science_nature.txt")
group_data=file("data/project_data.txt")
fig1(nfsmdata)
fig4_5(group_data)
}
