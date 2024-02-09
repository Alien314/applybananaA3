class CfgPatches {
  class pca_resync {
	ammo[] = {};
	magazines[] = {};
    units[] = {"pca_moduleResync","pca_moduleHeal","pca_moduleRename","pca_moduleMoveArsenal","pca_moduleToggleGroupMarker"};//
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
        displayName = "Toggle ORBAT Marker Visibility of Unit's Group";
		function = "pca_resync_fnc_moduleToggleGroupMarker";
		icon = "\A3\ui_f\data\Map\Markers\NATO\b_inf.paa";
        isGlobal = 0;
	};
    class pca_moduleMoveArsenal : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Move Arsenal Location for Unit/All";
        function = "pca_resync_fnc_moduleMoveArsenal";
        icon = "\A3\ui_f\data\gui\rsc\RscDisplayArsenal\spaceGarage_ca.paa";
    };
	class pca_moduleResync : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Re-Sync Player/Crew/All";
		function = "pca_resync_fnc_moduleResync";
		icon = "\A3\ui_f\data\gui\cfg\Hints\Adjust_ca.paa";
        isGlobal = 0;
	};
	class pca_moduleRename : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Rename Unit's Group";
		function = "pca_resync_fnc_moduleRename";
		icon = "\A3\ui_f\data\gui\cfg\Hints\UnitType_CA.paa";
        isGlobal = 0;
	};
	class pca_moduleHeal : pca_moduleBase {
        curatorCanAttach = 1;
        displayName = "Heal Player/Crew";
		function = "pca_resync_fnc_moduleHeal";
		icon = "\A3\ui_f\data\Map\VehicleIcons\pictureHeal_ca.paa";
        isGlobal = 0;
	};
};