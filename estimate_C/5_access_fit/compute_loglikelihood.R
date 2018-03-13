
######################
# POISSON (USE COUNTS)
######################

LhoodCalcPoisson <- function(model_SFS_count,obs_SNP_counts,numHaps){
  llSum=0
  for (i in seq(1,numHaps)){
    llSum = as.numeric(llSum + (as.numeric(obs_SNP_counts[i])*log(as.numeric(model_SFS_count[i]))))
  }
  ll = -sum(as.numeric(model_SFS_count)) + llSum
  return(ll)
}

#################
# German shepherd
#################

# Autosomes
# Usage: Rscript compute_loglikelihood.R /path/to/A/empirical/ /path/to/A/sim
input = commandArgs(trailingOnly=T)
A_GS_SFS_emp = read.csv(input[1], header = FALSE)
A_GS_SFS_sim = read.table(input[2],header = TRUE)

emp_counts = c(A_GS_SFS_emp[1, 2], A_GS_SFS_emp[2, 2], A_GS_SFS_emp[3, 2], A_GS_SFS_emp[4, 2])

sim_counts = c(mean(A_GS_SFS_sim$d0_1), mean(A_GS_SFS_sim$d0_2), mean(A_GS_SFS_sim$d0_3), mean(A_GS_SFS_sim$d0_4))

emp_ll = LhoodCalcPoisson(emp_counts, emp_counts, 4)

sim_ll = LhoodCalcPoisson(sim_counts, emp_counts, 4)

delta = sim_ll - emp_ll

print (emp_ll)
print (sim_ll)
print (delta)


# nonPAR X chromosome
# Run this in the terminal for all of the values of C
# Usage: Rscript compute_loglikelihood.R /path/to/directory/ /filename/of/X/empirical/ /filename/of/X/sim/ /outfile/end/in/csv/ /value/of/C/

input = commandArgs(trailingOnly=T)

# Setting directory
setwd(input[1])

# Load files
X_GS_SFS_emp = read.csv(input[2], header = FALSE)
X_GS_SFS_sim = read.table(input[3], header = TRUE)

emp_counts = c(X_GS_SFS_emp[1, 2], X_GS_SFS_emp[2, 2], X_GS_SFS_emp[3, 2], X_GS_SFS_emp[4, 2])

sim_counts = c(mean(X_GS_SFS_sim$d0_1), mean(X_GS_SFS_sim$d0_2), mean(X_GS_SFS_sim$d0_3), mean(X_GS_SFS_sim$d0_4))

emp_ll = LhoodCalcPoisson(emp_counts, emp_counts, 4)

sim_ll = LhoodCalcPoisson(sim_counts, emp_counts, 4)

delta = emp_ll - sim_ll

scale = input[5]

toreturn = cbind(scale, emp_ll, sim_ll, delta)

write.table(toreturn, input[4], row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",", append = TRUE)















