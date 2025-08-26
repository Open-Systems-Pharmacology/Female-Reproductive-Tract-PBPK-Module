################################
# Authors:     Sophie Fischer, Nina Nauwelaerts
# Property:     ESQlabs GmbH
# Last updated: 19.06.2025
###############################

# Chen 2015---------------------------------------------------------------------

De_calculation <- function(MW, fu, Kmw){
  De = 10^(-8.15-0.655*log10(MW))/(0.68 + (0.32/fu) + 0.025*Kmw) 
  return(De)
} #[m^2/s] Eq(10)

Kmw_calculation <- function(LogKow){
  Kmw = 0.9/1 * (10^(LogKow))^0.69 
  return(Kmw)
} #Eq (2)

## Levonorgestrel---------------------------------------------------------------

MW_LNG = 312.4
LogKow_LNG = 3.55
fu_LNG = 1.0 # fu plasma

Kmw_LNG <- Kmw_calculation(LogKow_LNG)
De_LNG <- De_calculation(MW=MW_LNG, fu=fu_LNG, Kmw=Kmw_LNG)

print(format(De_LNG * 10000, scientific = TRUE, digits = 2)) #[cm^2/sec]

## Metronidazole----------------------------------------------------------------

MW_MET = 171
LogKow_MET = -0.02 #
fu_MET =  0.89 # fu plasma
Kmw_MET <- Kmw_calculation(LogKow_MET)
De_MET <- De_calculation(MW=MW_MET, fu=fu_MET, Kmw=Kmw_MET)

print(format(De_MET * 10000, scientific = TRUE, digits = 2)) #[cm^2/sec]
