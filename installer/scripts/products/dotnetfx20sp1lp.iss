//http://www.microsoft.com/downloads/details.aspx?FamilyID=1cc39ffe-a2aa-4548-91b3-855a2de99304

[CustomMessages]
de.dotnetfx20sp1lp_title=.NET Framework 2.0 SP1 Sprachpaket: Deutsch
es.dotnetfx20sp1lp_title=.NET Framework 2.0 SP1 paquete de idioma: Español

de.dotnetfx20sp1lp_size=3,4 MB
es.dotnetfx20sp1lp_size=3,3 MB

de.dotnetfx20sp1lp_size_x64=4,9 MB
es.dotnetfx20sp1lp_size_x64=4,8 MB

;http://www.microsoft.com/globaldev/reference/lcid-all.mspx
de.dotnetfx20sp1lp_lcid=1031
es.dotnetfx20sp1lp_lcid=3082

de.dotnetfx20sp1lp_url=http://download.microsoft.com/download/8/a/a/8aab7e6a-5e58-4e83-be99-f5fb49fe811e/NetFx20SP1_x86de.exe
de.dotnetfx20sp1lp_url_x64=http://download.microsoft.com/download/1/4/2/1425872f-c564-4ab2-8c9e-344afdaecd44/NetFx20SP1_x64de.exe
de.dotnetfx20sp1lp_url_ia64=http://download.microsoft.com/download/a/0/b/a0bef431-19d8-433c-9f42-6e2824a8cb90/NetFx20SP1_ia64de.exe
es.dotnetfx20sp1lp_url=http://download.microsoft.com/download/f/6/1/f61563a2-5545-4cba-8e6f-afcf2fb77737/NetFx20SP1_x86es.exe
es.dotnetfx20sp1lp_url_x64=http://download.microsoft.com/download/3/a/5/3a5c5b7f-fcbe-49ee-bc72-77e9eeaf5896/NetFx20SP1_x64es.exe


[Code]
procedure dotnetfx20sp1lp();
begin
	if (ActiveLanguage() <> 'en') then begin
		if (netfxspversion(NetFx20, CustomMessage('dotnetfx20sp1lp_lcid')) < 1) then
			AddProduct('dotnetfx20sp1' + GetArchitectureString() + '_' + ActiveLanguage() + '.exe',
				'/passive /norestart /lang:ENU',
				CustomMessage('dotnetfx20sp1lp_title'),
				CustomMessage('dotnetfx20sp1lp_size' + GetArchitectureString()),
				CustomMessage('dotnetfx20sp1lp_url' + GetArchitectureString()),
				false, false);
	end;
end;
