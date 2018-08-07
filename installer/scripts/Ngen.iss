[Run]
Filename: {code:GetV4NetDir}ngen.exe; Parameters: "install ""{app}\{#MyAppExeName}"""; StatusMsg: {cm:NgenOptimizing}; Flags: runhidden; Check: InstallCheckV4NetExists; 

[UninstallRun]
Filename: {code:GetV4NetDir}ngen.exe; Parameters: "uninstall ""{app}\{#MyAppExeName}"""; StatusMsg: {cm:NgenRemoving}; Flags: runhidden; Check: CheckV4NetExists; 

;CustomMessage('NgenOptimizing')      {cm:NgenRemoving}
[CustomMessages]
NgenOptimizing =Optimizing performance for your system ...
pl.NgenOptimizing =Optymalizacja wydajności dla twojego systemu ...
fr.NgenOptimizing =Optimisation des performances pour votre système ...
de.NgenOptimizing =Optimierung der Leistung für Ihr System ...
hu.NgenOptimizing =Rendszerteljesítmény optimalizálása ...
sl.NgenOptimizing =Optimizacija zmogljivosti za vaš sistem ...
nl.NgenOptimizing =Optimaliseren prestaties voor uw systeem ...
es.NgenOptimizing =Optimizando el rendimiento de su sistema ...
bpt.NgenOptimizing =Otimizando o desempenho p/seu sistema ...

NgenRemoving =Removing native images and dependencies ...
pl.NgenRemoving =Usuwanie danych z pamięci podręcznej ...
fr.NgenRemoving =Suppression des données en cache ...
de.NgenRemoving =Entfernen zwischengespeicherter Daten ...
hu.NgenRemoving =Natív képek és függõségek eltávolítása ... 
sl.NgenRemoving =Odstranjevanje avtohtonih slik in odvisnosti ...
nl.NgenRemoving =Verwijderen systeemeigen images en afhankelijkheden ...
es.NgenRemoving =Eliminando datos almacenados en caché ...
bpt.NgenRemoving =Removendo imagens e dependências nativas ...

[Code]
function CheckV4NetExists() : boolean;
begin
  if RegKeyExists(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full') then
  Result := True
  else
  Result := False;
end;
function InstallCheckV4NetExists() : boolean;
begin
  if CheckV4NetExists then 
  begin
    if IsNotPortable then
    Result := True
    else
    Result := False;   
  end 
  else
  Result := False;
end;
function GetV4NetDir(version: string) : string;
var regkey, regval  : string;
begin

    // in case the target is 3.5, replace 'v4' with 'v3.5'
    // for other info, check out this link 
    // http://stackoverflow.com/questions/199080/how-to-detect-what-net-framework-versions-and-service-packs-are-installed
    regkey := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full'

    RegQueryStringValue(HKLM, regkey, 'InstallPath', regval);

    result := regval;
end;