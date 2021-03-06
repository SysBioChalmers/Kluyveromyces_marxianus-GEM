# Benjamin J. Sanchez
# Simonas Marcisauskas, 2019-11-16 - adaptation for Kluyveromyces_marxianus-GEM

# -*- coding: utf-8 -*-
import cobra

# Load model
model = cobra.io.read_sbml_model('../modelFiles/xml/Kluyveromyces_marxianus-GEM.xml')

# Correct metabolite ids:
for met in model.metabolites:
    met.id = met.id.replace('__91__', '_')
    met.id = met.id.replace('__93__', '')
