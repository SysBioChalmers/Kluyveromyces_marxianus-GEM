function model = loadKmxModel
% loadKmxModel
%	Loads model from hard-coded location and adds the rxnGeneMat to the
%	structure
%
%	Usage: loadKmxModel
%
%	Based on function loadYeastModel written by Benjamin Sanchez
%	(https://github.com/SysBioChalmers/yeast-GEM)
%	Simonas Marcisauskas, 2019-11-10 - adaptation for
%	Kluyveromyces_marxianus-GEM
%

scriptFolder = fileparts(which(mfilename));
currentDir = cd(scriptFolder);
model = readCbModel('../ModelFiles/xml/kmxGEM.xml');
model = buildRxnGeneMat(model);
cd(currentDir)

end
