// Add below to this file in your mission folder
if (enableBanana && {
    ace_advanced_fatigue_enabled && {
    !isClass(configFile >> "ace_medical_treatment_actions" >> "AdministerBanana")}}
) then
{
	private _action =
	[
		"ab_banamina","Administer Banana","\z\ace\addons\common\data\icon_banana_ca.paa",
		ab_fnc_banamina,
		{ params["_target", "_player"];
			isPlayer _target && {!(_target getVariable ["ab_boostActive", false]) && {[_player, "ACE_Banana"] call ace_common_fnc_hasItem}}
		},
		{},
		[],
		[0,0,0],
		3,
		[false, true, false, false, true],
        {}
	] call ace_interact_menu_fnc_createAction;

	["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;
	["CAManBase", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};