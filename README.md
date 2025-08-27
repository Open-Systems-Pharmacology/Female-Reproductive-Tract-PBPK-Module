# Physiologically Based Pharmacokinetic Models for the Female Reproductive Tract

Within this repository, we distribute MoBi<sup>®</sup> modules for the female reproductive tract. The module is an extension of the whole-body physiologically based pharmacokinetic models developed in Open Systems Pharmacology. The extension module can be used to simulate transfer of medicines towards female reproductive tract organs, or to simulate pharmacokinetics of compounds after local administration..

The extension module consists of five tissue compartments (endometrium, myometrium, vagina, cervix and breasts) and two fluid compartments (uterine fluid and cervicovaginal fluid) that can be added to a PBPK base model. This module does not consider the external part of the female reproductive tract. Furthermore, ovaries and fallopian tubes are not included due to lack of data. All tissue compartments have the same sub-compartmentalization as the tissues of the base whole-body structure.

<p align="center">

<img src="FRT_Structure_V1.png" width="50%"/>

</p>

## Repository files

### Models
The folder contains MoBi<sup>®</sup> project files for the developed PBPK models. 
- **Metronidazole-Model**: Metronidazole is an antibiotic and antiprotozoal medication used to treat a range of infections, including bacterial vaginosis, trichomoniasis and endometritis. A PBPK model for IV administration of metronidazole is available from [Github](https://github.com/Open-Systems-Pharmacology/Pregnancy-Models.git) ([Dallmann 2018](#references)), and was extended for oral administration to obtain the base PBPK model. The PBPK model was applied for the female reproductive tract after intravenous, oral and vaginal administration.
- **Levonorgestrel-Model**: Levonorgestrel is a synthetic progestogen widely used in various hormonal contraceptive formulations. The base PBPK model for levonorgestrel is available from [Github](https://github.com/Open-Systems-Pharmacology/Levonorgestrel) ([Cicali 2021](#references)). The PBPK model was applied for the female reproductive tract after oral and intrauterine (IUD) administration.

### Modules
The extension modules are provided in the subfolder Modules. The following extension modules are available:
- **Female reproductive tract extension module**.
- **Administration modules** including local administration for levonorgestrel and metronidazole.

### R_FRT_Parameters
Two R scripts are available to support the parametrization of the female reproductive tract module in the absence of *in vivo* and/or *in vitro* data. ([Chen 2015](#references))

- **DiffusionParameter**: QSAR calculation of the diffusion coefficient between the fluid and tissue compartments in the female reproductive tract.
- **FractionUnionized**: calculation of the unionized fraction in cervicovaginal fluid and uterine fluid based on the Henderson-Hasselbalch equation.

### Reports

The subfolder *Reports* contains evaluation reports and the [{esqlabsR}](https://esqlabs.github.io/esqlabsR/) project to generate the reports for all model compounds.

## How to extend a base PK-Sim<sup>®</sup> PBPK model for the female reproductive tract in (MoBi<sup>®</sup>)

This section describes the workflow for extending a base PBPK model developed in PK-Sim<sup>®</sup> with the female reproductive tract module, using the Metronidazole model as an example.

### In PK-Sim<sup>®</sup>:

1. Create all building blocks for the base PBPK model and a simulation in PK-Sim<sup>®</sup>. 
2.  Send the simulation to MoBi<sup>®</sup>. For example, in the Metronidazole-Model you will find the PK-Sim<sup>®</sup> `Metronidazole PBPK base model`.

### In (MoBi<sup>®</sup>):

Extension of a PBPK model for the female reproductive tract requires the following extension module

- Female reproductive tract module, including the organs (breasts, cervix, endometrium, myometrium and vagina) and fluid (cervicovaginal and uterine fluid) compartments, passive transports and default parameter values for the female reproductive tract
- For local administration, a administration module should be created containing the user-defined administration. Examples for metronidazole (vaginal administration) and levonorgestrel (uterine device) are provided in the modules.

3.  Right-click on ‘Modules’ and then navigate to ‘Load Module...’ and select `Female reproductive tract.pkml`.
4.  Add **Initial Conditions** to the extension module. Right-click on the  extension module, select ‘Add Building Blocks..’, and select ‘Initial Conditions’. Click ‘OK’.
5.  Open the created ‘Initial Conditions’ and click on the ‘Extend’ symbol in the upper left corner.
6.  Select the molecules that should be present in the female reproductive tract physiology structure. For example, select the Compound only. If you also want to express proteins in the new organs, select the respective proteins.
7. Add Female Reproductive Tract **Parameter Values** to the extension module. Right-click on the ‘Default Parameter Values’, and select ‘Clone...’. Enter the name of the compound of interest and click ‘OK’.
8. Open the created ‘Parameter Values’ and adapt the values of the parameters to the compound of interest. The R scripts provided in the *R_FRT_Parameters* folder can be used to provide input values for the Diffusion coefficient and fraction unionized in the female reproductive tract, in the absence of *in vivo* and/or *in vitro* values.
9. Optionally, create an administration if the administration for the siumlation differs from the base PBPK simulation. For local administration in the female reproductive tract, a user-defined application is required. Examples are provided in the administration modules for metronidazole (vaginal) and levonorgestrel (intrauterine device).
10. Optionally, create an individual if the individual for the simulation differs from the base PBPK simulation. 
11. Create a  **simulation** for the female reproductive tract. First add your base PBPK module (imported from PK-Sim). Next, add the Female reproductive tract extension module, and select the created initial conditions and parameter values. Click ‘Next’.
12. Select the individual and expression profiles. Click ‘OK’. 
13. Run the simulation.


## References

**Chen 2015** Chen L, Han L, Saib O, Lian G. In silico prediction of percutaneous absorption and disposition kinetics of chemicals. Pharm Res. 2015 May;32(5):1779-93. doi: 10.1007/s11095-014-1575-0.

**Cicali 2021** Cicali B, Lingineni K, Cristofoletti R, Wendl T, Hoechel J, Wiesinger H, Chaturvedula A, Vozmediano V, Schmidt S. Quantitative Assessment of Levonorgestrel Binding Partner Interplay and Drug-Drug Interactions Using Physiologically Based Pharmacokinetic Modeling. CPT Pharmacometrics Syst Pharmacol. 2021 Jan;10(1):48-58. doi: 10.1002/psp4.12572. 

**Dallmann 2018** Dallmann A, Ince I, Coboeken K, Eissing T, Hempel G. A Physiologically Based Pharmacokinetic Model for Pregnant Women to Predict the Pharmacokinetics of Drugs Metabolized Via Several Enzymatic Pathways. Clin Pharmacokinet. 2018 Jun;57(6):749-768. doi: 10.1007/s40262-017-0594-5. PMID: 28924743.