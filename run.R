#!/usr/bin/env Rscript

library("ggplot2")
library("ggthemes")

counts=read.table("data/nf_sm_science_nature.txt")
colnames(counts)=c("Date","Workflow")
pdf("counts_sm_nf_nat_sci.pdf",width=7,height=5)
ggplot(counts,aes(x=factor(Date),fill=Workflow))+geom_bar()+scale_colour_colorblind()+scale_fill_colorblind()+xlab("Date")+ylab("Nb articles")+theme_bw()
dev.off()

project=read.table("data/project_data.txt",header=T,na.strings="N/A")
svg("project_data_workflow.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=workflow))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("project_data_run_cont.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=run_cont))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("project_data_build_cont.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),fill=build_cont))+geom_bar(position = "fill")+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("% Groups")
dev.off()

svg("project_data_nb_commits.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),y=nb_commits, fill=factor(date)))+geom_violin(alpha = 0.5)+geom_point(position = position_jitter(seed = 1, width = 0.2))+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("Nb commits")+theme(legend.position = "none")
dev.off()

svg("project_data_nb_lines.svg",width=5,height=5)
ggplot(project,aes(x=factor(date),y=nb_lines, fill=factor(date)))+geom_violin(alpha = 0.5)+geom_point(position = position_jitter(seed = 1, width = 0.2))+scale_colour_colorblind()+scale_fill_colorblind()+theme_bw()+xlab("Date")+ylab("Nb lines of code")+theme(legend.position = "none")
dev.off()
