# Write a function to compute diversity from SFS
diversity_from_SFS = function (SFS, num, total_sites) {
  # SFS is a list. For example: SFS = c(1516, 1121, 997, 865, 344)
  # num is the number of bins in the folded SFS. For example, if you have 5 individuals, num = 5
  # total_site is the number of callable sites
  numerator = c()
  for (i in seq(1,num)) {
    a = 2*(i/(2*num))*(1-(i/(2*num)))*SFS[i]
    numerator = c(numerator, a)
  }
  pi = (sum(numerator)/total_sites)
  return (pi)
}

#### GERMAN SHEPHERD GS ###

# Autosomes
A_GS_SFS_emp = read.csv(input[1], header = FALSE)
A_GS_SFS_sim = read.table(input[2], header = TRUE)

A_GS_SFS_emp_counts = c(A_GS_SFS_emp[1,2], A_GS_SFS_emp[2,2], A_GS_SFS_emp[3,2], A_GS_SFS_emp[4,2])
A_GS_SFS_sim_counts = c(mean(A_GS_SFS_sim$d0_1), mean(A_GS_SFS_sim$d0_2), mean(A_GS_SFS_sim$d0_3), mean(A_GS_SFS_sim$d0_4))

# X chromosome
X_GS_SFS_emp = read.csv(input[3], header = FALSE)
X_GS_SFS_sim_C_null = read.table(input[4], header = TRUE)
X_GS_SFS_sim_C_best = read.table(input[5], header = TRUE)

X_GS_SFS_emp_counts = c(X_GS_SFS_emp[1,2], X_GS_SFS_emp[2,2], X_GS_SFS_emp[3,2], X_GS_SFS_emp[4,2])
X_GS_SFS_sim_C_null_counts = c(mean(X_GS_SFS_sim_C_null$d0_1), mean(X_GS_SFS_sim_C_null$d0_2), mean(X_GS_SFS_sim_C_null$d0_3), mean(X_GS_SFS_sim_C_null$d0_4))
X_GS_SFS_sim_C_best_counts = c(mean(X_GS_SFS_sim_C_best$d0_1), mean(X_GS_SFS_sim_C_best$d0_2), mean(X_GS_SFS_sim_C_best$d0_3), mean(X_GS_SFS_sim_C_best$d0_4))
  
# Compute diversity
A_GS_emp_diversity = diversity_from_SFS(A_GS_SFS_emp_counts, 4, 1353692) #Change the total number of sites here
A_GS_sim_diversity = diversity_from_SFS(A_GS_SFS_sim_counts, 4, 1353692)

X_GS_emp_diversity = diversity_from_SFS(X_GS_SFS_emp_counts, 4, 68831) #Change the total number of sites here
X_GS_sim_C_null_diversity = diversity_from_SFS(X_GS_SFS_sim_C_null_counts, 4, 68831)
X_GS_sim_C_best_diversity = diversity_from_SFS(X_GS_SFS_sim_C_best_counts, 4, 68831)

# Compute ratio

X_A_ratio_GS_emp = X_GS_emp_diversity/A_GS_emp_diversity
X_A_ratio_GS_C_null = X_GS_sim_C_null_diversity/A_GS_sim_diversity
X_A_ratio_GS_C_best = X_GS_sim_C_best_diversity/A_GS_sim_diversity

# print
print (X_GS_emp_diversity)
print (A_GS_emp_diversity)
print (X_A_ratio_GS_emp)

print (X_GS_sim_C_null_diversity)
print (A_GS_sim_diversity)
print (X_A_ratio_GS_C_null)

print (X_GS_sim_C_best_diversity)
print (A_GS_sim_diversity)
print (X_A_ratio_GS_C_best)