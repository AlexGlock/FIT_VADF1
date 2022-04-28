% Aufgabe 10

% Skript, das die diskreten Felder a) und b) mithilfe eines Vektor-
% feldes visualisiert.
% Verwendet werden die Methoden aus den vorherigen Aufgabe.

%% Aufgabe 9
% Beispielgitter erzeugen (3D)
xmesh = [1, 4, 7];
ymesh = [1, 3, 7, 8];
zmesh = [1, 2, 5, 6, 8];

%% msh struct berechnen
msh = cartMesh(xmesh, ymesh, zmesh);
xmin = xmesh(1);
xmax = xmesh(end);

%% anonymous function der beiden gegebenen Felder bestimmen
f1 = @(x,y,z) [5/2 -1.3 2];
f2 = @(x,y,z) [0 3*sin(pi*(x-xmin)/(xmax-xmin)) 0];

%% Bogengroesse der beiden Felder mithilfe von impField bestimmen
fbow1 = impField( msh, f1 );
fbow2 = impField( msh, f2 );

%% diskretes Feld fbow mithilfe von plotArrowfield plotten
figure;
plotEdgeVoltage(msh, fbow1);
figure;
plotEdgeVoltage(msh, fbow2);
