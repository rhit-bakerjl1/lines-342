% Function which outputs coefficients for an optimal regression output 
% Columns of A are x1, x2, etc.
function [coeffs, A_found, R_sq] = func_fwd_regression(A, y) 

    inds    = 1:width(A);
    coeffs      = zeros(1, width(A)+1);
    foundVars   = zeros(1, width(A));
    stop    = 0;

    while (~stop) 
        p_vals  = zeros(1, length(inds(~foundVars)));
        F_vals  = ones(1, length(inds(~foundVars)))*realmin;
        curr_inds   = inds(~foundVars);
        maxF    = intmin;
        col_best = 0;
        for newCol = 1:length(curr_inds)
            colInd  = curr_inds(newCol);
            if (~exist("A_found", 'var'))
                A_found = A(:,colInd);
            else
                A_found = [A_found, A(:,colInd)];
            end
            mdl     = fitlm(A_found, y);
            mdl_table   = mdl.Coefficients;
            mdl_arr     = table2array(mdl_table);
            newCoeffs   = mdl_arr(:,1);
            if (~exist('y_est', 'var'))
                y_est = mean(y)*ones(size(y));
            end
            y_new_est   = [ones(size(y)), A_found]*newCoeffs;
            F_vals(newCol)  = (sum((y_est-y).^2) - sum((y_new_est-y).^2))*(length(y)-width(A_found)-2)/sum((y_est-y).^2);
            if (F_vals(newCol) > maxF) 
                maxF    = F_vals(newCol);
                col_best    = newCol;
            end
            p_vals(newCol)  = 1-fcdf(F_vals(newCol), 1, length(y)-width(A_found)-2);
            if (width(A_found) == 1) 
                clear A_found;
            else
                A_found     = A_found(:,1:end-1);
            end
        end
        % Analyze our fits
        % [~, col_best] = max(F_vals);
        if (min(p_vals) > 0.1)
            stop = 1;
        else 
            if (~exist('A_found', 'var'))
                A_found = A(:,curr_inds(col_best));
            else
                A_found = [A_found, A(:,curr_inds(col_best))];
            end
            foundVars(curr_inds(col_best))     = 1;
            mdl     = fitlm(A_found, y);
            mdl_table   = mdl.Coefficients;
            mdl_arr     = table2array(mdl_table);
            newCoeffs   = mdl_arr(:,1);
            y_est   = [ones(size(y)), A_found]*newCoeffs;
        end
        
    end

    mdl     = fitlm(A(:,logical(foundVars)), y);
    mdl_table   = mdl.Coefficients;
    mdl_arr = table2array(mdl_table);
    coeffs(logical([1,foundVars]))  = mdl_arr(:,1);
    R_sq    = mdl.Rsquared.Ordinary;

end