function model = loadKmxModel
% loadKmxModel
%	Loads model from hard-coded location and adds the rxnGeneMat to the
%	structure
%
%	Usage: model = loadKmxModel
%
%	Based on function loadYeastModel written by Benjamin Sanchez
%	(https://github.com/SysBioChalmers/yeast-GEM)
%	Simonas Marcisauskas, 2019-11-16 - adaptation for
%	Kluyveromyces_marxianus-GEM
%

scriptFolder = fileparts(which(mfilename));
currentDir = cd(scriptFolder);
model = readCbModel('../modelFiles/xml/Kluyveromyces_marxianus-GEM.xml');
model = buildRxnGeneMat(model);
cd(currentDir)

end
