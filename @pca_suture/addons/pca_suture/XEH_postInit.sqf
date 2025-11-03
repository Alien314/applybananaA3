#include "settings.sqf"

if (!hasInterface) exitWith {};

if (pca_suture_medicNotif) then {

	["pca_suture_treatmentStarted",
		{ params ["_patient"];
			("pca_suture_medicNotif" call BIS_fnc_rscLayer) cutRsc ["pca_suture_medicNotification", "PLAIN",0.5,false];
			_patient setVariable ["pca_suture_medics",((_patient getVariable ["pca_suture_medics",0]) + 1)];
		}
	] call CBA_fnc_addEventHandler;

	["pca_suture_treatmentComplete",
		{ params ["_patient","_medic"];
			private _medics = ((_patient getVariable ["pca_suture_medics",1]) - 1);
			private _self = (_medic getVariable ["pca_suture_medics",0]);
			if (_medic isEqualTo _patient) then {_self = _self - 1};
			if (_medics < 1 && {_self < 1}) exitWith {
				_patient setVariable ["pca_suture_medics",nil];
				"pca_suture_medicNotif" cutFadeOut 1;
			};
			_patient setVariable ["pca_suture_medics",_medics];
		}
	] call CBA_fnc_addEventHandler;
};

// add existing mission template notif for stitching
private _msnHelp = (missionNamespace getVariable ["enableMedicalHelpNotification",nil]);
if (!isNil '_msnHelp') then {
	if !(_msnHelp) exitWith {};
	["pca_suture_treatmentStarted",
		{
			if (lifeState ace_player == "INCAPACITATED") then 
			{
				titleText ["<t color='#FFFFFF' size = '1'>Someone is helping you!</t>", "PLAIN DOWN", 1, true, true];
			};
		}
	] call CBA_fnc_addEventHandler;
} else {
	if !(pca_suture_helpNotif) exitWith {};
	["pca_suture_treatmentStarted",
		{
			if (lifeState ace_player == "INCAPACITATED") then 
			{
				titleText ["<t color='#FFFFFF' size = '1'>Someone is helping you!</t>", "PLAIN DOWN", 1, true, true];
			};
		}
	] call CBA_fnc_addEventHandler;

	{
		["ace_medical_treatment_" + _x, 
			{
				if (lifeState ace_player == "INCAPACITATED") then 
				{
					titleText ["<t color='#FFFFFF' size = '1'>Someone is helping you!</t>", "PLAIN DOWN", 1, true, true];
				};
			}
		] call CBA_fnc_addEventHandler;
	} forEach ["bandageLocal", "cprLocal", "ivBagLocal", "medicationLocal", "splintLocal", "tourniquetLocal"];
};

if (pca_suture_autoWake) then { // > 0
	//if (pca_suture_autoWake > 1) exitWith {
		["ace_unconscious",
			{ params ["_patient"]; //,"_sleeb"
				//if !(local _patient) exitWith {};
				//if (!_sleeb && {pca_suture_autoWake}) then { 
				_patient setVariable ["ace_medical_triageLevel", nil]; //, true
				//};
			}
		] call CBA_fnc_addEventHandler;
	//};

	/*if (isDedicated) exitWith {};
	0 spawn { waitUntil {!isNull player};
		triageMachine = [configFile >> "PCA_Suture" >> "Triage_Statemachine"] call CBA_statemachine_fnc_createFromConfig;
	};*/
};

if (pca_suture_autoDeath) then {
	['CAManBase', 'Killed', { params ['_patient'];
		_patient setVariable ["ace_medical_triageLevel", 4, true];
	}] call CBA_fnc_addClassEventHandler;
};

if (pca_suture_autoMenu) then { 
	["ace_medicalMenuOpened",
		{ params ["_medic","_patient"];
			if (pca_suture_autoMenu) then { _this call pca_suture_fnc_autoTriage; };
		}
	] call CBA_fnc_addEventHandler;
};