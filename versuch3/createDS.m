% Methode zum Erstellen der Geometriematrizen DS und DSt
%
% Eingabe
% msh           Struktur, die von cartMesh erzeugt wird. Benutzen Sie
%               hierfür die bereitgestellte Methode.
%
% Rueckgabe
% DS            DS-Matrix
% DSt           DSt-Matrix

function [ DS, DSt ] = createDS( msh )

%% nx, ny, nz und np aus msh struct holen
nx = msh.nx;
ny = msh.ny;
nz = msh.nz;
np = msh.np;


%% Erstellen der Matrix DS
% Überlegen Sie sich, wie Sie die von Matlab bereitgestellte Methode diff
% geschickt verwenden können. Achten Sie auch auf die Geisterkanten

% Gitterabstände/Schrittweiten entlang der x-Achse
dx = [diff(msh.xmesh), 0]

% Gitterabstände/Schrittweiten entlang der y-Achse
dy = [diff(msh.ymesh), 0];

% Gitterabstände/Schrittweiten entlang der z-Achse
dz = [diff(msh.zmesh), 0];

% Diagonalvektor erstellen (erst alle x-Kante, dann alle y-Kanten und dann alle z-Kanten)
% Ist aufgrund der schwierigen Implementation schon gegeben. 
% Versuchen sie sich aber klar zu machen, 
% was die 3 komplizierten reshape und repmat Konstrukte eigentlich tun.
DSdiag = [repmat(dx, 1, ny*nz), ...
		repmat(reshape(repmat(dy, nx, 1), 1, nx*ny), 1, nz),...
		reshape(repmat(dz, nx*ny, 1), 1, np)];

% aus dem Diagonalvektor für DS die matrix erstellen (Befehl spdiags verwenden)
DS = spdiags(DSdiag',0,3*np,3*np);

spy(DS)
%% Das Gleiche nochmal für die Matrix DSt

% Gitterabstände/Schrittweiten entlang der x-Achse
dxt = ([0, dx(1:end-1)] + dx)/2;

% Gitterabstände/Schrittweiten entlang der y-Achse
dyt = ([0, dy(1:end-1)] + dy)/2;

% Gitterabstände/Schrittweiten entlang der z-Achse
dzt = ([0, dz(1:end-1)] + dz)/2;

% Diagonalvektor erstellen (erst alle x-Kante, dann alle y-Kanten und dann alle z-Kanten)
DStdiag = [repmat(dxt, 1, ny*nz), ...
		repmat(reshape(repmat(dyt, nx, 1), 1, nx*ny), 1, nz),...
		reshape(repmat(dzt, nx*ny, 1), 1, np)];

% aus dem Diagonalvektor für DS die matrix erstellen (Befehl spdiags verwenden)
DSt = spdiags(DStdiag',0,3*np,3*np);

end