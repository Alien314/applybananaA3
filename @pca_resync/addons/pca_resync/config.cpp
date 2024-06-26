class CfgPatches {
  class pca_resync {
	ammo[] = {};
	magazines[] = {};
    units[] = {"pca_moduleResync","pca_moduleHeal","pca_moduleRename","pca_moduleMoveArsenal","pca_moduleToggleGroupMarker","pca_moduleUnlock"};//
    weapons[] = {};
    requiredVersion = 0.1;
    author = "Alien314";
    name = "PCA Resync";
    requiredAddons[]=
		{
		};
	};
};

class Extended_PostInit_EventHandlers
{
	class pca_resync
	{
		init="call compileScript ['pca\addons\resync\XEH_postInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers
{
	class pca_resync
	{
		init="call compileScript ['pca\addons\resync\XEH_preInit.sqf']";
	};
};
class Extended_PreStart_EventHandlers
{
	class pca_resync
	{
		init="call compileScript ['pca\addons\resync\XEH_preStart.sqf']";
	};
};

class CfgFactionClasses {
    class PCA {
        displayName = "PCA";
        priority = 2;
        side = 7;
    };
};

class CfgMarkers {	
	class flag_NATO;
	class flag_CA : flag_NATO
	{
		icon = "pca\addons\resync\data\canadaFlag_ca.paa";
		name = "CanadaHeightfixed";
		texture = "pca\addons\resync\data\canadaFlag_ca.paa";
	};
};

class CfgVehicles
{
    class Module_F;
    class pca_moduleBase : Module_F {
        author = "Alien314";
        category = "PCA";
		curatorCost = 0;
        function = "";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        scope = 1;
        scopeCurator = 2;
    };
	class pca_moduleToggleGroupMarker : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Toggle ORBAT Visibility (Unit)";
		function = "pca_resync_fnc_moduleToggleGroupMarker";
		icon = "\A3\ui_f\data\Map\Markers\NATO\b_inf.paa";
        isGlobal = 0;
	};
    class pca_moduleMoveArsenal : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Move Arsenal (Unit/All)";
        function = "pca_resync_fnc_moduleMoveArsenal";
        icon = "\A3\ui_f\data\gui\rsc\RscDisplayArsenal\spaceGarage_ca.paa";
    };
	class pca_moduleResync : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Re-Sync Player/Crew";
		function = "pca_resync_fnc_moduleResync";
		icon = "\A3\ui_f\data\gui\cfg\Hints\Adjust_ca.paa";
        isGlobal = 0;
	};
	class pca_moduleRename : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Add/Rename ORBAT (Unit)";
		function = "pca_resync_fnc_moduleRename";
		icon = "\A3\ui_f\data\gui\cfg\Hints\UnitType_CA.paa";
        isGlobal = 0;
	};
	class pca_moduleHeal : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Heal (Unit/Crew/All)";
		function = "pca_resync_fnc_moduleHeal";
		icon = "\A3\ui_f\data\Map\VehicleIcons\pictureHeal_ca.paa";
        isGlobal = 0;
	};
	class pca_moduleUnlock : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Un/Lock Vehicle (Vehicle)";
		function = "pca_resync_fnc_moduleUnlock";
		icon = "\A3\ui_f\data\igui\cfg\actions\getincargo_ca.paa";
        isGlobal = 0;
	};

	class FlagCarrier;
	class Flag_CA_F : FlagCarrier
	{
		_generalMacro = "Flag_CA_F";
		author = "Canada";
		displayName = "Flag (Canada)";
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\FlagPole_F.jpg";
		hiddenSelectionsMaterials[] = {"\A3\Structures_F\Mil\Flags\Data\Mast_mil.rvmat"};
		hiddenSelectionsTextures[] = {"\A3\Structures_F\Mil\Flags\Data\Mast_mil_CO.paa"};
		scope = 2;
		scopeCurator = 2;
		class EventHandlers
		{
			init = "(_this select 0) setFlagTexture ""pca\addons\resync\data\canadaFlag_ca.paa""";
		};
	};
};