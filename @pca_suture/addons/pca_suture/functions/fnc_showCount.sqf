if (!pca_suture_notify || {lifeState ace_player == "INCAPACITATED"}) exitWith {};

private _counts = ([["ACE_suture"]] call ace_medical_gui_fnc_countTreatmentItems);

private _message = [
	[getText (configFile >> "CfgWeapons" >> "ACE_suture" >> "picture"), 4],
	[format ["%1s remaining: %2", getText (configFile >> "CfgWeapons" >> "ACE_suture" >> "displayName"), (_counts select 0)]]
];

private _patCount = (_counts select 1);
if (!isNil "_patCount" && {_patCount > 0}) then {
	_message append [format ["Patient has: %1", _patCount]]
};

private _vicCount = (_counts select 2);
if (!isNil "_vicCount" && {_vicCount > 0}) then {
	_message append [format ["Vehicle has: %1", _vicCount]]
};

_message append [true];
_message call CBA_fnc_notify;