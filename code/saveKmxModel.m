function saveKmxModel(model,upDATE)
% saveKmxModel
%	Save model as a .xml, .txt and .yml file. Also update complementary
%	files (boundaryMets.txt, README.md and dependencies.txt).
%
%	Input:
%	model	model structure to save (note: must be in COBRA format)
%	upDATE	true if updating the date in the README file is needed
%           (opt, default true)
%
%   Usage: saveKmxModel(model,upDATE)
%
%	Based on function saveYeastModel written by Benjamin Sanchez
%	(https://github.com/SysBioChalmers/yeast-GEM)
%	Simonas Marcisauskas, 2019-11-16 - adaptation for'
%	Kluyveromyces_marxianus-GEM
%

if nargin < 2
    upDATE = true;
end

%Get and change to the script folder, as all folders are relative to this
%folder
scriptFolder = fileparts(which(mfilename));
currentDir = cd(scriptFolder);

%Set minimal media
cd modelCuration
model = minimal_Verduyn(model);
cd ..

%Delete model.grRules (redundant and possibly conflicting with model.rules)
if isfield(model,'grRules')
    model = rmfield(model,'grRules');
end

%Update SBO terms in model
cd missingFields
model = addSBOterms(model);
cd ..

%Check if model is a valid SBML structure
writeCbModel(model,'sbml','tempModel.xml');
[~,errors] = TranslateSBML('tempModel.xml');
% if ~isempty(errors)
%     delete('tempModel.xml');
%     error('Model should be a valid SBML structure. Please fix all errors before saving.')
% end

%Update .xml, .txt and .yml models
copyfile('tempModel.xml','../modelFiles/xml/Kluyveromyces_marxianus-GEM.xml')
delete('tempModel.xml');
writeCbModel(model,'text','../modelFiles/txt/Kluyveromyces_marxianus-GEM.txt');
exportForGit(model,'Kluyveromyces_marxianus-GEM','..',{'yml'});

%Detect boundary metabolites and save them in a .txt file
fid = fopen('../modelFiles/boundaryMets.txt','wt');
for i = 1:length(model.rxns)
    pos = find(model.S(:,i) ~= 0);
    if length(pos) == 1 %Exchange rxn
        fprintf(fid,[model.mets{pos} '\t' model.metNames{pos} '\n']);
    end
end
fclose(fid);

%Update README file: date + size of model
copyfile('../README.md','backup.md')
fin  = fopen('backup.md','r');
fout = fopen('../README.md','w');
still_reading = true;
while still_reading
    inline = fgets(fin);
    if ~ischar(inline)
        still_reading = false;
    else
        if startsWith(inline,'* Last update: ') && upDATE
            inline = ['* Last update: ' datestr(datetime,'yyyy-mm-dd') newline];
        elseif startsWith(inline,'|_Kluyveromyces marxianus_|')
            inline = ['|_Kluyveromyces marxianus_|iOD907|' ...
                num2str(length(model.rxns)) '|' ...
                num2str(length(model.mets)) '|' ...
                num2str(length(model.genes)) '|' newline];
        end
        fwrite(fout,inline);
    end
end
fclose('all');
delete('backup.md');

%Convert notation "e-005" to "e-05 " in stoich. coeffs. to avoid
%inconsistencies between Windows and macOS
copyfile('../modelFiles/xml/Kluyveromyces_marxianus-GEM.xml','backup.xml')
fin  = fopen('backup.xml','r');
fout = fopen('../modelFiles/xml/Kluyveromyces_marxianus-GEM.xml','w');
still_reading = true;
while still_reading
    inline = fgets(fin);
    if ~ischar(inline)
        still_reading = false;
    else
        if ~isempty(regexp(inline,'[0-9]e-?00[0-9]','once'))
            inline = regexprep(inline,'(?<=[0-9]e-?)00(?=[0-9])','0');
        end
        fwrite(fout,inline);
    end
end
fclose('all');
delete('backup.xml');

%Switch back to original folder
cd(currentDir)

end
