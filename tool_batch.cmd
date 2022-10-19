
set projname=Demo-for-Microsoft-SBOM-Tool
set CLONE_LINK="https://github.com/adriandiglio/Demo-for-Microsoft-SBOM-Tool.git"
set thispath=%CD%\%projname%
set REPO_PATH=%thispath%\%projname%
set DOCPATH=%thispath%\docs
mkdir %DOCPATH%

copy %~dp0tool_batch.cmd %DOCPATH%\%projname%_commands_log.txt
echo ' ' >> %DOCPATH%\%projname%_commands_log.txt
git clone %CLONE_LINK% %REPO_PATH% >> %DOCPATH%\%projname%_commands_log.txt
dir %thispath% /a >> %DOCPATH%\%projname%_commands_log.txt
dir %REPO_Path% /a >> %DOCPATH%\%projname%_commands_log.txt

sbom-tool.exe generate -bc %REPO_Path% -b %REPO_Path% -pn MULLER_PackageName -ps MULLER_PackageSupplier -pv MULLER_PackageVersion_0.0 -nsb http://MULLER_DEREK.sbom >> %DOCPATH%\%projname%_commands_log.txt
dir %REPO_Path% /a >> %DOCPATH%\%projname%_commands_log.txt
dir %REPO_Path%\_manifest\spdx_2.2 >> %DOCPATH%\%projname%_commands_log.txt

move %REPO_Path%\_manifest %DOCPATH%\%projname%_manifest-A >> %DOCPATH%\%projname%_commands_log.txt
