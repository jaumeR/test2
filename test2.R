# Prueba de commit Jaime.


library(Deducer)
#import data from csv (update this file!)
PB <-read.csv("PB_git.csv", header=TRUE,  stringsAsFactors=FALSE)


# This script includes code for:

  # Descriptive tables with mean and SD for RV data By Beads_silk Grouping.
  # 3-group comparisons: AOV, AOV with unequal variances and K-W.
  # Exports 2 .csv files with the output.


#1. Load the PB dataframe that includes the observations needed for the analysis:
  # Final timepoints for RV data.


#Table 2 Beads Paper.


#Frequencies by groups. # 2-Way Frequency Table 

attach(PB)
mytable <- table(Beads_silk,Silk_tmp) # A will be rows, B will be columns 
mytable # print table 


#Define subset timepoints Baseline+ Final:

PB_8 <- subset (PB, Silk_tmp ==8)

# Define subsets for each group.

PB_8_s <- subset (PB_8, Beads_silk ==0)
PB_8_pb1 <- subset (PB_8, Beads_silk ==1)
PB_8_pb2 <- subset (PB_8, Beads_silk ==2)

  #RV tables.

RV_s <- descriptive.table (vars=d(MPAPpre, RVtoLV),
        data=PB_8_s,func.names =c("Valid N","Mean","St. Deviation"))

RV_s <- data.frame (RV_s)

colnames (RV_s) <- c("N", "Mean", "St Dev")
RV_s
  
#PB1 hemodynamics table.

hem_pb1 <- descriptive.table (vars=d(BW, HR_pre, Mean_AoP, PwP_pre, MPAPpre, 
        TPG.PRE,  RA_pre, CI_surface,  
        SVI_m2,  SVRI_m2, PVRi_m2, Capacit_ind),
                           data=PB_8_pb1,func.names =c("Valid N","Mean","St. Deviation"))

hem_pb1 <- data.frame (hem_pb1)

colnames (hem_pb1) <- c("N", "Mean", "St Dev")


  #PB2 hemodynamics table.

hem_pb2 <- descriptive.table (vars=d(BW, HR_pre, Mean_AoP, PwP_pre, MPAPpre, 
        TPG.PRE,  RA_pre, CI_surface,  
        SVI_m2,  SVRI_m2, PVRi_m2, Capacit_ind),
                   data=PB_8_pb2,func.names =c("Valid N","Mean","St. Deviation"))

hem_pb2 <- data.frame (hem_pb2)

colnames (hem_pb2) <- c("N", "Mean", "St Dev")

#Bind summary tables into 1.

hem_PBmod_short <- cbind(hem_s, hem_pb1, hem_pb2)

write.table(hem_PBmod_short,file="Table 1 short PBmod.csv",sep=",",row.names=T, col.names = NA)
