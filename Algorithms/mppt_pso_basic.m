function I_pso = mppt_pso_basic(Vpv, Ipv, Ppv, n, Isc, Control)
% mppt_pso_basic - Particle Swarm Optimization (PSO) based MPPT algorithm
%
% Description:
%   This function implements a basic Particle Swarm Optimization (PSO) algorithm
%   to track the Maximum Power Point (MPP) of a photovoltaic (PV) system.
%
%   Each particle represents a candidate current value (I), and the swarm evolves
%   over iterations based on both individual best experiences (pbest) and the global
%   best experience (gbest). The algorithm updates positions and velocities to
%   converge toward the global MPP.
%
% Inputs:
%   Vpv     - PV voltage [V]
%   Ipv     - PV current [A]
%   Ppv     - Measured PV power [W]
%   n       - Number of particles in the swarm
%   Isc     - Short-circuit current of the PV panel [A]
%   Control - Initialization trigger (1 = reset/init, 0 = operate)
%
% Output:
%   I_pso   - Reference current to be applied at the current iteration
%
% Author: Stavros Stratakis

    persistent u Icurrent p pbest I v counter gbest;

    if Control == 1
        I_pso = 37;
        counter = 0;
        Icurrent = 0.7 * Isc;
        gbest = Icurrent;
        p = -1e8 * ones(n,1);
        v = zeros(n,1);
        pbest = zeros(n,1);
        u = 0;
        I = 15 + rand(n,1) .* (Isc - 15); % Initialize particle positions
        return;
    else
        if isempty(counter), counter = 0; end
        if isempty(Icurrent), Icurrent = 0.7 * Isc; end
        if isempty(gbest), gbest = Icurrent; end
        if isempty(p), p = -1e8 * ones(n,1); end
        if isempty(v), v = zeros(n,1); end
        if isempty(pbest), pbest = zeros(n,1); end
        if isempty(u), u = 0; end
        if isempty(I), I = 15 + rand(n,1) .* (Isc - 15); end

        if u >= 1 && u <= n
            if Ppv > p(u)
                p(u) = Ppv;
                pbest(u) = Icurrent;
            end
        end

        u = u + 1;

        if u == n + 2
            u = 1;
        end

        if u >= 1 && u <= n
            I_pso = I(u);
            Icurrent = I_pso;
            counter = 1;
            return;
        elseif u == n + 1
            [~, i] = max(p);
            gbest = pbest(i);
            I_pso = gbest;
            Icurrent = I_pso;
            counter = 1;
            for j = 1:n
                v(j) = updatevelocity(v(j), pbest(j), I(j), gbest);
                I(j) = updateI(I(j), v(j));
            end
            return;
        else
            I_pso = 30;
        end
    end
end

function vfinal = updatevelocity(vel, pobest, I, gwbest)
    w = 0.9;
    c1 = 1;
    c2 = 1;
    vfinal = w * vel + c1 * (pobest - I) + c2 * (gwbest - I);
end

function Ifinal = updateI(I, vel)
    Ifinal = I + vel;
end
