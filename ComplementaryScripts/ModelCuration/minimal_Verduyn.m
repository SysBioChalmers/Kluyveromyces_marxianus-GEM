function model = minimal_Verduyn(model)
% change Y6 model media to minimal (Verduyn) medium
% Bicarbonate production is blocked to get rid of conflict due to bicarbonate and carbon dioxide
% are regarded as equivalent
% the function is from:https://doi.org/10.1371/journal.pcbi.1004530

% start with a clean slate: set all exchange reactions to upper bound = 1000
% and lower bound = 0 (ie, unconstrained excretion, no uptake)

% Based on function minimal_Y6 written by Feiran Li 2018.09.05 (https://github.com/SysBioChalmers/yeast-GEM)
% Simonas Marcisauskas - adaptation for Kluyveromyces_marxianus-GEM

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

if length(find(uptakeRxnIndexes~= 0)) ~= 15
    warning('Not all exchange reactions were found.')
end

model.lb(uptakeRxnIndexes(uptakeRxnIndexes~=0))     = -1000;
model.lb(glucoseExchangeIndex) = -1;

model.lb(BlockedRxnIndex) = 0;
model.ub(BlockedRxnIndex) = 0;

end
