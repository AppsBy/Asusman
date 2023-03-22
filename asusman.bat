@ECHO OFF

(

GOTO:MAIN

:Timer
	timeout 3
EXIT /B 0

:SetServicesToManual
	sc config "ArmouryCrateControlInterface" start= demand
	sc config "ArmouryCrateService" start= demand
	sc config "AsusAppService" start= demand
	sc config "ArmouryCrateService" start= demand
	sc config "LightingService" start= demand
	sc config "ASUSLinkNear" start= demand
	sc config "ASUSLinkRemote" start= demand
	sc config "AsusMultiAntennaSvc" start= demand
	sc config "ASUSOptimization" start= demand
	sc config "ASUSSoftwareManager" start= demand
	sc config "ASUSSwitch" start= demand
	sc config "ASUSSystemAnalysis" start= demand
	sc config "ASUSSystemDiagnosis" start= demand
	sc config "asus" start= demand
	sc config "asusm" start= demand
	sc config "AsusCertService" start= demand
	EXIT /B 0

:SetServicesToDisabled
	sc config "ArmouryCrateControlInterface" start= disabled
	sc config "ArmouryCrateService" start= disabled
	sc config "AsusAppService" start= disabled
	sc config "ArmouryCrateService" start= disabled
	sc config "LightingService" start= disabled
	sc config "ASUSLinkNear" start= disabled
	sc config "ASUSLinkRemote" start= disabled
	sc config "AsusMultiAntennaSvc" start= disabled
	sc config "ASUSOptimization" start= disabled
	sc config "ASUSSoftwareManager" start= disabled
	sc config "ASUSSwitch" start= disabled
	sc config "ASUSSystemAnalysis" start= disabled
	sc config "ASUSSystemDiagnosis" start= disabled
	sc config "asus" start= disabled
	sc config "asusm" start= disabled
	sc config "AsusCertService" start= disabled
	EXIT /B 0

:SetServicesToDefault
	sc config "ArmouryCrateControlInterface" start= auto
	sc config "ArmouryCrateService" start= auto
	sc config "AsusAppService" start= auto
	sc config "ArmouryCrateService" start= auto
	sc config "LightingService" start= auto
	sc config "ASUSLinkNear" start= auto
	sc config "ASUSLinkRemote" start= auto
	sc config "AsusMultiAntennaSvc" start= auto
	sc config "ASUSOptimization" start= auto
	sc config "ASUSSoftwareManager" start= auto
	sc config "ASUSSwitch" start= auto
	sc config "ASUSSystemAnalysis" start= auto
	sc config "ASUSSystemDiagnosis" start= auto
	sc config "asus" start= auto
	sc config "asusm" start= auto
	sc config "AsusCertService" start= auto
	EXIT /B 0

:TurnOffAsusServices
	net stop "ArmouryCrateControlInterface"
	net stop "ArmouryCrateService"
	net stop "AsusAppService"
	net stop "LightingService"
	net stop "ASUSLinkNear"
	net stop "ASUSLinkRemote"
	net stop "AsusMultiAntennaSvc"
	net stop "ASUSOptimization"
	net stop "ASUSSoftwareManager"
	net stop "ASUSSwitch"
	net stop "ASUSSystemAnalysis"
	net stop "ASUSSystemDiagnosis"
 	::"ASUS Update Service (asus)"
	net stop "asus"
 	::"ASUS Update Service (asusm)"
	net stop "asusm"
	net stop "AsusCertService"
	EXIT /B 0

:TurnOnAsusServices
	net start "ArmouryCrateControlInterface"
	net start "ArmouryCrateService"
	net start "AsusAppService"
	net start "LightingService"
	net start "ASUSLinkNear"
	net start "ASUSLinkRemote"
	net start "AsusMultiAntennaSvc"
	net start "ASUSOptimization"
	net start "ASUSSoftwareManager"
	net start "ASUSSwitch"
	net start "ASUSSystemAnalysis"
	net start "ASUSSystemDiagnosis"
	::"ASUS Update Service (asus)"
	net start "asus"
	::"ASUS Update Service (asusm)"	
	net start "asusm"
	net start "AsusCertService"
	EXIT /B 0

:TurnLightsServiceOnly
	echo "Only Light Services will Turn On"
	call:Timer
	call:TurnOffAsusServices
	call:SetServicesToDisabled
	sc config "LightingService" start= demand
	net start "LightingService"
	EXIT /B 0

:KillProcesses
	taskkill /F /IM AcPowerNotification.exe 
	taskkill /F /IM ArmouryCrate.DenoiseAI.exe
	taskkill /F /IM ArmourySocketServer.exe
	taskkill /F /IM ArmourySwAgent.exe
	taskkill /F /IM ASUSSmartDisplayControl.exe
	taskkill /F /IM asus_framework.exe
	taskkill /F /IM AsusSoftwareManager.exe
	taskkill /F /IM AsusSoftwareManagerAgent.exe
	EXIT /B 0

:MAIN
	If %1 == 0 (call:TurnOffAsusServices & call:SetServicesToManual)
	If %1 == "off" (call:TurnOffAsusServices & call:SetServicesToManual)

	If %1 == 1 (call:SetServicesToManual & call:TurnOnAsusServices)
	If %1 == "on" (call:SetServicesToManual & call:TurnOnAsusServices)

	If %1 == 2 (call:TurnLightsServiceOnly)
	If %1 == "lightonly" (call:TurnLightsServiceOnly)

	If %1 == enable (echo "Enabling Asus Services..." & call:Timer & call:SetServicesToManual)
	If %1 == default (call:SetServicesToDefault)
	If %1 == disable (echo "Disabling Asus Services..." & call:Timer & call:SetServicesToDisabled)

	call:KillProcesses

) > NUL


