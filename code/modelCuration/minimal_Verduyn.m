function model = minimal_Verduyn(model)
% minimal_Verduyn
% Sets minimal (Verduyn) medium for the model. The production is allowed
% for all exchange metabolites, except bicarbonate, which is regarded
% equivalent to carbon dioxide like in
% https://doi.org/10.1371/journal.pcbi.1004530

% Based on function minimal_Y6 written by Feiran Li 2018.09.05
% (https://github.com/SysBioChalmers/yeast-GEM)
% Simonas Marcisauskas, 2019-11-10 - adaptation for
% Kluyveromyces_marxianus-GEM

exchangeRxns = findExcRxns(model);
model.lb(exchangeRxns) = 0;
model.ub(exchangeRxns) = 1000;

desiredExchanges = {'r_1723'; ... % H2O exchange
                    'r_1724'; ... % H+ exchange
                    'r_1725'; ... % oxygen exchange
                    'r_1727'; ... % ammonium exchange
                    'r_1728'; ... % sulphate exchange
                    'r_1729'; ... % phosphate exchange
                    'r_1730'; ... % myo-inositol exchange
                    'r_1731'; ... % iron exchange
                    'r_1732'; ... % nicotinate exchange
                    'r_1733'; ... % pyridoxine exchange
                    'r_1734'; ... % thiamine exchange
                    'r_1735'; ... % (R)-pantothenate exchange
                    'r_1736'};    % 4-aminobenzoate exchange

blockedExchanges = {'r_1771'};    % bicarbonate exchange

glucoseExchange = {'r_1726'};     % D-glucose exchange

uptakeRxnIndexes     = findRxnIDs(model,desiredExchanges);
glucoseExchangeIndex = findRxnIDs(model,glucoseExchange);
BlockedRxnIndex      = findRxnIDs(model,blockedExchanges);

if length(find(uptakeRxnIndexes~= 0)) ~= 13
    warning('Not all exchange reactions were found.')
end

model.lb(uptakeRxnIndexes(uptakeRxnIndexes~=0)) = ...
                      [-50; ... % H2O exchange
                       -50; ... % H+ exchange
                       -20; ... % oxygen exchange
                   -1.3634; ... % ammonium exchange
                   -0.6822; ... % sulphate exchange
                  -0.39716; ... % phosphate exchange
                   -0.0025; ... % myo-inositol exchange
               -0.00019421; ... % iron exchange
               -0.00014654; ... % nicotinate exchange
               -0.00010682; ... % pyridoxine exchange
              -0.000067974; ... % thiamine exchange
               -0.00003796; ... % (R)-pantothenate exchange
              -0.000026484];    % 4-aminobenzoate exchange                   
model.lb(glucoseExchangeIndex) = -1;

model.lb(BlockedRxnIndex) = 0;
model.ub(BlockedRxnIndex) = 0;

end
