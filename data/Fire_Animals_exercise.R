rm(list=ls()) ## clear R memory ###
require("ggplot2")
require("tidyverse")
require("PASWR")
require("mra")
#install.packages('mra')

########################################################################################
############################Import Data#################################################
########################################################################################

################
## Unburned: ###
################

#peromyscus:
PM.unburned <- read.csv("PM_unburned.csv", header=T)
PM.unburned
PM.unburned$X <- NULL

PM.unburned <- data.matrix(PM.unburned)
PM.unburned

PMPop.unburned <- F.huggins.estim(capture = ~1, recapture = NULL, PM.unburned)
PMPop.unburned # 12.8397, se=1.142
  #calculate the SD from the se (se * sqrt(n)) for later use in t-tests comparing means
  1.142*sqrt(12) # = 3.956004 #SD
  
#N. fuscipes and S. occidentalis:


  
  
################
#### Burned: ###
################

PM.burned <- read.csv("PM_burned.csv")
PM.burned
PM.burned$X <- NULL

PM.burned <- data.matrix(PM.burned)
PM.burned

PMPop.burned <- F.huggins.estim(capture = ~1, recapture = NULL, PM.burned)
PMPop.burned # 11.5019, se=1.7525
  #calculate the SD from the se (se * sqrt(n)) for later use in t-tests comparing means
  1.7525*sqrt(10) # = 5.541892

#N. fuscipes and S. occidentalis:

  
#################################################
# compare populations between burned and unburned:
#################################################
  
############### compare P. maniculatus populations between unburned (x) and burned (y)
PMt.test <- tsum.test(mean.x=12.8397, s.x=3.956004, n.x=9, mean.y=11.5019, s.y=5.541892, n.y=9, alternative="two.sided", mu=0, var.equal=T, conf.level=0.95)
PMt.test # No, not significantly different n.x=9, n.y=9: 3 grids trapped for 3 nights each

################ compare N. fuscipes populations between unburned (x) and burned (y)
#HINT: set mean = 0, SD = 0 and sample size (n) = 9 (for three trapping grids sampled, 3 nights each), for the burned sites where no animals were captured (in order to estimate differences with the t-test approach)

################ compare S. occidentalis populations between unburned (x) and burned (y)


