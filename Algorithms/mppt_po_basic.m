function iref = mppt_po_basic(Vpv, Ipv)
% mppt_po_basic - Basic MPPT algorithm using Perturb & Observe (P&O)
%
% Description:
%   This function implements the classic Perturb and Observe (P&O) algorithm
%   for Maximum Power Point Tracking (MPPT) in photovoltaic (PV) systems.
%   It adjusts the reference current (iref) based on power and current variations.
%
% Inputs:
%   Vpv - Instantaneous PV voltage [V]
%   Ipv - Instantaneous PV current [A]
%
% Output:
%   iref - Reference current [A] for MPPT control
%
% Author: Stavros Stratakis


    persistent Vold Pold iref_old Ipv_old;

    % Initialize persistent variables on first call
    if isempty(Vold)
        Vold = 0;
        Pold = 0;
        iref_old = 0;
        Ipv_old = 0;
    end

    % Calculate instantaneous power
    P = Vpv * Ipv;

    % Compute differences
    dP = P - Pold;
    dV = Vpv - Vold;
    dI = Ipv - Ipv_old;

    % Step size for iref adjustment
    d = 0.02;

    % MPPT logic based on power and current direction
    if dP ~= 0
        if dP > 0
            if dI > 0
                iref = iref_old + d;
            else
                iref = iref_old - d;
            end
        else
            if dI > 0
                iref = iref_old - d;
            else
                iref = iref_old + d;
            end
        end
    else
        iref = iref_old;
    end

    % Update persistent variables
    Vold = Vpv;
    Pold = P;
    iref_old = iref;
    Ipv_old = Ipv;
end
