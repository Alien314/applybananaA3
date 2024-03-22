params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

private _isObj = _unit isEqualType objNull;
private _isPerson = (_isObj && {(_unit isKindOf "CAManBase")});
if (isNull _unit || { !_isObj }) exitWith {
    //[objNull, "No unit or vehicle selected."] call BIS_fnc_showCuratorFeedbackMessage;
	private _response = true;
	_response = [
		"Admin heal everyone?", // body
		"Global admin heal confirmation", // title
		"Yes", // true return
		"Cancel", // false return
		nil, nil, false
	] call BIS_fnc_guiMessage;
	if (!_response) exitWith {};

	{	["ace_medical_treatment_fullHealLocal", [player], _x] call CBA_fnc_targetEvent;
		if (isPlayer _x) then {(format ["%1 admin healed you.",(name player)]) remoteExec ["systemChat",_x];};
	} forEach playableUnits;
};

if (!_isPerson) then {_unit = crew _unit;} else {_unit = [_unit]};

{	["ace_medical_treatment_fullHealLocal", [_x], _x] call CBA_fnc_targetEvent;
	if (isPlayer _x) then {(format ["%1 admin healed you.",(name player)]) remoteExec ["systemChat",_x];};
} forEach _unit;
