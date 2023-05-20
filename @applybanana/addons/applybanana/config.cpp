class CfgPatches {
    class ab_banana {
        name = "Apply Banana";
        units[] = {};
        weapons[] = {};
        requiredVersion = "0.1";
        requiredAddons[] = {"cba_main","ace_medical_treatment","ace_advanced_fatigue"};
        author = "Alien314, Banzerschreck";
        url = "";
        authorUrl = "";
    };
};

class Extended_PreInit_EventHandlers
{
	class ab_banana
	{
		init="call compileScript ['z\ab\addons\applybanana\XEH_preInit.sqf']";
	};
};

class ace_medical_treatment_actions {
	class ApplyTourniquet;

	class ApplyBanana : ApplyTourniquet {
		displayName = "Apply Banana";
        displayNameProgress = "Applying Banana...";
        allowedSelections[] = {"Head"};
        icon = "\z\ace\addons\common\data\icon_banana_ca.paa";
        items[] = {"ACE_Banana"};
        callbackSuccess = "ab_applybanana_fnc_banTour";
        allowedUnderwater = 0;
        litter[] = {{"ACE_Banana"}};
        //litter[] = {"ab_bananaPeel"};
	};

	class Morphine;

	class AdministerBanana : Morphine {
		displayName = "Administer Banana";
        displayNameProgress = "Administering Banana...";
        allowedSelections[] = {"Head"};
        icon = "\z\ace\addons\common\data\icon_banana_ca.paa";
        items[] = {"ACE_Banana"};
        condition = "ace_advanced_fatigue_enabled";
        callbackSuccess = "ab_applybanana_fnc_banamina";
        //callbackSuccess = "(mod prefix)_fnc_banamina";
        //sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        litter[] = {{"ACE_Banana"}};
        //litter[] = {"ab_bananaPeel"};
    };
};