input <- commandArgs(trailingOnly=T)

lrt = function(null, alternative) {
  return (-2*(null-alternative))
}

result = lrt(as.numeric(input[1]), as.numeric(input[2]))
pval = pchisq(result, 1, lower.tail = F)

print (result)
print (pval)
