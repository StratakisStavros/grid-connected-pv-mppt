function iref = mppt_po_losses(Vpv, Ipv)
% mppt_po_losses - MPPT algorithm using Perturb & Observe with converter loss compensation
%
% Description:
%   This function implements a modified Perturb and Observe (P&O) algorithm
%   for Maximum Power Point Tracking (MPPT) in photovoltaic (PV) systems.
%   It includes an approximation of power losses due to the conduction of the
%   MOSFET (transistor), diode, and cabling resistance in a Boost converter topology.
%
%   The total power loss is simplified as:
%       Ploss_total ≈ [Ron_tr * d + Req + Ron_diode * (1 - d)] * Ipv^2
%   where:
%       - d is the duty cycle
%       - Ron_tr is the on-state resistance of the transistor
%       - Ron_diode is the equivalent resistance of the diode
%       - Req is the combined series resistance of cables and inductor
%
%   The algorithm subtracts these estimated losses from the measured PV power
%   to compute a more realistic tracking target (Ptrue).
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

    % Initialize persistent variables
    if isempty(Vold)
        Vold = 0;
        Pold = 0;
        iref_old = 0;
        Ipv_old = 0;
    end

    % MPPT tuning step
    d = 0.02;

    % Simplified converter loss estimation
    Ron_tr = 0.001;      % transistor on-resistance [Ohm]
    Ron_diode = 0.001;   % diode resistance [Ohm]
    Req = 1;             % total series resistance of cables and inductor [Ohm]

    % Calculate total power including losses (Ptrue)
    Ploss = (Ron_tr * d + Req + Ron_diode * (1 - d)) * Ipv^2;
    P = Vpv * Ipv - Ploss;

    % Compute variations
    dP = P - Pold;
    dV = Vpv - Vold;
    dI = Ipv - Ipv_old;

    % P&O MPPT logic with loss-aware tracking
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

    % Update states
    Vold = Vpv;
    Pold = P;
    iref_old = iref;
    Ipv_old = Ipv;
end
