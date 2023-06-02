class CfgPatches {
    class ab_banana {
        name = "Apply Banana";
        units[] = {};
        weapons[] = {};
        requiredVersion = "0.1";
        requiredAddons[] = {"cba_main","ace_medical_treatment","ace_advanced_fatigue"};
        author = "Alien314, Banzerschreck"; // Thanks for the idea Banzer
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

class Extended_PostInit_EventHandlers
{
	class ab_banana
	{
		init="call compileScript ['z\ab\addons\applybanana\XEH_postInit.sqf']";
	};
};

class ace_medical_treatment_actions {
	/*class ApplyTourniquet;
	// Temporary head tourniquet
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
	};*/

	class Morphine;
	// Adrenaline/Stam restore effect
	class AdministerBanana : Morphine {
		displayName = "Administer Banana";
        displayNameProgress = "Administering Banana...";
        allowedSelections[] = {"Head"};
        icon = "\z\ace\addons\common\data\icon_banana_ca.paa";
        items[] = {"ACE_Banana"};
        condition = "ace_advanced_fatigue_enabled"; // && {isPlayer (_this select 1)}
        callbackSuccess = "ab_applybanana_fnc_banamina";
        //callbackSuccess = "(mod prefix)_fnc_banamina";
        //sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        litter[] = {{"ACE_Banana"}};
        //litter[] = {"ab_bananaPeel"};
    };

	/*/ New item treatment
	class Adrenaline : Morphine {
		displayName = "Inject Adrenaline";
        displayNameProgress = "Administering Adrenaline...";
        // icon = "(mod prefix)\data\icon_adrenaline_ca.paa";
        //items[] = {"(mod prefix)_adrenaline"};
        condition = "ace_advanced_fatigue_enabled"; // && {isPlayer (_this select 1)}
        callbackSuccess = "(mod prefix)_fnc_banamina";
    };
    //*/
};

/*/ New item
class CfgWeapons {
	class ACE_morphine;

	class (mod prefix)_adrenaline : ACE_morphine {
		displayName = "Adrenaline Autoinjector";
        //picture = (mod path)ui\adrenaline_ca.paa);
        //model = (mod path)data\morphine.p3d);
        descriptionShort = "Reduces the felt effects of fatigue temporarily.";
        descriptionUse = "Temporarily reduces felt effects of fatigue, allowing user to ignore strain.";
	};
};//*/