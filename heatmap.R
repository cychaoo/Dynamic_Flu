library(ggplot2)
library(readxl)
library(dplyr)
setwd("D:/kfcteam-cy/dynamic biomarkers/with medical students/2471 Flu")
symptom_genexpert <- read_xlsx("output data/2471 CEIRS dynamic doi proportion summary 0714.xlsx",sheet ="H3")


vars_a = c("Cough","Cough up sputum","Rhinorrhea","Body aches","Shortness of breath","Sore throat","Fatigue","Chills","Headache","Wheezing","Chest pain","Sinus pain","Loss of appetite","Nausea","Stomach pain","Diarrhea")
df = symptom_genexpert  
df <- filter(symptom_genexpert, variable %in% vars_a)


# 先在excel上排序
# sort by odds ratio 
# overall
df$variable <- factor(df$variable, levels = rev(c("Cough","Fatigue","Body aches","Chills","Headache","Loss of appetite","Rhinorrhea","Sore throat","Cough up sputum","Shortness of breath","Nausea","Chest pain","Wheezing","Stomach pain","Sinus pain","Diarrhea"))) # reorder


O <- ggplot(df, aes(x=day, y=variable))+ geom_tile(aes(fill = proportion)) + scale_fill_gradient2(low = "darkgreen",high = "red",name = "Proportion",midpoint = 0.5)
O

O + theme_grey(base_size = 12) + scale_x_discrete(expand = c(0, 0),limits=c("1","2","3","4","5"),labels=c("1-2", "3","4-5",">5","overall")) + scale_y_discrete(expand = c(0, 0)) + geom_text(aes(label = paste(round(proportion,2))),size=3.5) +labs(x="Day of Illness",y="")