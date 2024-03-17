#include "settings.sqf"

if (!hasInterface) exitWith {};

if (pca_suture_medicNotif) then {

	["pca_suture_treatmentStarted",
		{ params ["_patient"];
			("pca_suture_medicNotif" call BIS_fnc_rscLayer) cutRsc ["pca_suture_medicNotification", "PLAIN",0.5,false];
			_patient setVariable ["pca_suture_medics",((_patient getVariable ["pca_suture_medics",0]) + 1)];
			/*if (lifeState ace_player == "INCAPACITATED") then 
			{
				titleText ["<t color='#FFFFFF' size = '1'>Someone is helping you!</t>", "PLAIN DOWN", 1, true, true];
			};*/
		}
	] call CBA_fnc_addEventHandler;

	["pca_suture_treatmentComplete",
		{ params ["_patient"];
			private _medics = ((_patient getVariable ["pca_suture_medics",1]) - 1);
			if (_medics < 1 && {(player getVariable ["pca_suture_medics",0]) < 1}) exitWith {
				_patient setVariable ["pca_suture_medics",nil];
				"pca_suture_medicNotif" cutFadeOut 1;
			};
			_patient setVariable ["pca_suture_medics",_medics];
		}
	] call CBA_fnc_addEventHandler;
};

// add existing mission template notif for stitching
if (missionNamespace getVariable ["enableMedicalHelpNotification",false]) then {
	["pca_suture_treatmentStarted",
		{
			if (lifeState ace_player == "INCAPACITATED") then 
			{
				titleText ["<t color='#FFFFFF' size = '1'>Someone is helping you!</t>", "PLAIN DOWN", 1, true, true];
			};
		}
	] call CBA_fnc_addEventHandler;
};