#if __has_include("\z\ace\addons\nomedical\script_component.hpp")

#else
class CfgPatches {
	class pca_suture {
		ammo[] = {};
		magazines[] = {};
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		name = "PCA Suture";
		requiredAddons[]=
		{ 
			"ace_medical_treatment"
		};
	};
};

class Extended_PostInit_EventHandlers
{
	class pca_suture
	{
		init="call compileScript ['pca\addons\suture\XEH_postInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers
{
	class pca_suture
	{
		init="call compileScript ['pca\addons\suture\XEH_preInit.sqf']";
	};
};

class Extended_PreStart_EventHandlers
{
	class pca_suture
	{
		init="call compileScript ['pca\addons\suture\XEH_preStart.sqf']";
	};
};

#define QUOTE(var1) #var1
#define GUI_GRID_WAbs			((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs			(GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W			(GUI_GRID_WAbs / 40)
#define GUI_GRID_H			(GUI_GRID_HAbs / 25)

class CfgUIGrids {
	class IGUI {
		class Presets {
			class Arma3 {
				class Variables {
					pca_suture_medicNotification[] = {
						{
							QUOTE((safeZoneX + ((46) * GUI_GRID_W))),
							QUOTE((safeZoneY + ((0.6) * GUI_GRID_H))),
							"((safeZoneW / 15)/1.2)",
							"(safeZoneW / 15)"
						},
						QUOTE(GUI_GRID_W),
						QUOTE(GUI_GRID_H)
					};
				};
			};
		};
		class Variables {
			class pca_suture_medicNotification	{
				displayName = "PCA Medic Notification";
				description = "Displays while stitching or being stitched.";
				preview = "pca\addons\suture\ui\medicNotif_big_ca.paa";
				saveToProfile[] = {0,1};
				canResize = 1;
			};
		};
	};
};

class RscPicture;
class RscTitles {
	class pca_suture_medicNotification {
		duration = 1e+011;
		fadeIn = 1;
		fadeOut = 0;
		idd = -1;
		movingEnable = 1;
		name = "pca_suture_medicNotification";
		onLoad = "uiNamespace setVariable ['pca_suture_medicNotifDisplay', _this select 0]";
		onUnload = "uiNamespace setVariable ['pca_suture_medicNotifDisplay', displayNull]";
		class controls {
			class MedicNotifImage : RscPicture {
				access = 1;
				idc = -1;
				font = "RobotoCondensed";
				h = "((profileNamespace getVariable ['IGUI_pca_suture_medicNotification_H', (safeZoneW / 15)]) max 0.05)";
				text = "pca\addons\suture\ui\medicNotif_big_ca.paa";
				w = "((profileNamespace getVariable ['IGUI_pca_suture_medicNotification_W', ((safeZoneW / 15)/1.2)]) max 0.05)";
				x = "(profileNamespace getVariable ['IGUI_pca_suture_medicNotification_X', 0])";
				y = "(profileNamespace getVariable ['IGUI_pca_suture_medicNotification_Y', 0])";
				shadow = 1;
			};
		};
	};
};

class ace_medical_treatment_actions {
	class BasicBandage;
	class FieldDressing;
	class SurgicalKit: FieldDressing {		
		callbackStart = "pca_suture_fnc_sutureStart";
		callbackFailure = "pca_suture_fnc_clearCache";
		callbackSuccess = "pca_suture_fnc_clearCache";
	};
	class Suture : SurgicalKit {
		displayName = "Use Suture";
		picture = "\z\ace\addons\medical_treatment\ui\suture_ca.paa";
		items[] = {"ACE_suture"};
		medicRequired = "pca_suture_medicReq";
		condition = "pca_suture_fnc_canSuture";
	};
	class Diagnose: BasicBandage {
		callbackSuccess = "pca_suture_fnc_diagnose";
	};
    class CheckPulse: Diagnose {
        callbackSuccess = "pca_suture_fnc_checkPulse";
    };
    class CheckBloodPressure: CheckPulse {
        callbackSuccess = "pca_suture_fnc_checkBloodPressure";
    };
    class CheckResponse: CheckPulse {
        callbackSuccess = "pca_suture_fnc_checkResponse";
    };
};

/*
class PCA_Suture {
	class Triage_Statemachine {

		list = "[player]";
		skipNull = 0;

		class Awake {
			onState = "";
			onStateEntered = "if (pca_suture_autoWake isEqualTo 1) then {_x setVariable ['ace_medical_triageLevel', nil, true];};";
			onStateLeaving = "";

			class Death {
				targetState = "Dead";
				condition = "!alive _x";
				onTransition = "";
			};

			class Uncon {
				targetState = "Unconscious";
				condition = "_x getVariable ['ace_isUnconscious',false]";
			};
		};

		class Dead {
			class Respawn {
				targetState = "Awake";
				condition = "player isKindOf 'Man'";
				onTransition = "[triageMachine, [player]] call CBA_statemachine_fnc_updateList;";
			};
		};

		class Unconscious {
			class Wake {
				targetState = "Awake";
				condition = "!(_x getVariable ['ace_isUnconscious',false])";
			};

			class Death {
				targetState = "Dead";
				condition = "!alive _x";
			};
		};
	};
};//*/
#endif