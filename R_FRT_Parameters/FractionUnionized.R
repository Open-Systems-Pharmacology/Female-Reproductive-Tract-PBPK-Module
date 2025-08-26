################################
# Authors:     Sophie Fischer, Nina Nauwelaerts
# Property:     ESQlabs GmbH
# Last updated: 19.06.2025
################################


# Calculation of fraction unionized using the Henderson-Hasselbalch equation

Calc_funionized <- function(pKa1, pKa2, type, pH){
  if (type == "acid") {
    return(1/(1+10^(pH-pKa1)))  # Acid formula
  } else if (type == "base") {
    return(1/(1+10^(pKa1-pH))) # Base formula
  } else if (type == "ampholyte") {
    if (is.null(pKa2)) {
      stop("For ampholytes, both pKa1 (acidic) and pKa2 (basic) must be provided.")
    }
    return(1/(1+10^(pKa2-pKa1)+10^(pH-pKa1)+10^(pKa2-pH)))  # Ampholyte formula
  } else {
    stop("Invalid type. Choose 'acid', 'base', or 'ampholyte'.")
  }
}

# pka1: acid dissociation constant for the first ionization step
# pka2: acid dissociation constant for the second ionization step 
# (set pka2 to NULL for type 'acid', 'base')
# type: 'acid', 'base', or 'ampholyte'
# pH of the compartment

### pH values-------------------------------------------------------------------
pH_UterineFluid = 7.4
pH_CervicovaginalFluid = 5.0

### Levonorgestrel--------------------------------------------------------------
LND_pka1 = 13.5
LND_pka2 = NULL
LND_type = "acid"

f_unionized_UterineFluid <- Calc_funionized(pKa1 = LND_pka1,
                                            pKa2 = LND_pka2,
                                            type=LND_type, 
                                            pH = pH_UterineFluid)
print(round(f_unionized_UterineFluid, 2))


f_unionized_CervicovaginalFluid <- Calc_funionized(pKa1 = LND_pka1, 
                                                   pKa2 = LND_pka2,
                                                   type=LND_type, 
                                                   pH = pH_CervicovaginalFluid)
print(round(f_unionized_CervicovaginalFluid, 2))

### Metronidazole---------------------------------------------------------------

MET_pka1 = 2.49
MET_pka2 = NULL
MET_type = "base"

f_unionized_UterineFluid <- Calc_funionized(pKa1 = MET_pka1, 
                                            pKa2 = MET_pka2,
                                            type=MET_type, 
                                            pH = pH_UterineFluid)
print(round(f_unionized_UterineFluid, 2))

f_unionized_CervicovaginalFluidF <- Calc_funionized(pKa1 = MET_pka1, 
                                                    pKa2 = MET_pka2,
                                                    type=MET_type, 
                                                    pH = pH_CervicovaginalFluid)
print(round(f_unionized_CervicovaginalFluid, 2))

