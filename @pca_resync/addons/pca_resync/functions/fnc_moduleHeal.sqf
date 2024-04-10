params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

private _isObj = _unit isEqualType objNull;
private _isPerson = (_isObj && {(_unit isKindOf "CAManBase")});
if (isNull _unit || { !_isObj }) exitWith {
    //[objNull, "No unit or vehicle selected."] call BIS_fnc_showCuratorFeedbackMessage;
	if (isNil "zen_dialog") exitWith {};
	["Global admin heal confirmation", 
		[
			["CHECKBOX", "Admin heal everyone?", true, true]
		], {  params ["_values", "_args"];
			_values params ["_check"];
			
			if !(_check) exitWith {};
		
			{	["ace_medical_treatment_fullHealLocal", [_x], _x] call CBA_fnc_targetEvent;
				if (isPlayer _x) then {(format ["%1 admin healed you.",(name player)]) remoteExec ["systemChat",_x];};
			} forEach ([(units player), playableUnits] select isMultiplayer);
	},{},[]] call zen_dialog_fnc_create;
};

if (!_isPerson) then {_unit = crew _unit;} else {_unit = [_unit]};

{	["ace_medical_treatment_fullHealLocal", [_x], _x] call CBA_fnc_targetEvent;
	if (isPlayer _x) then {(format ["%1 admin healed you.",(name player)]) remoteExec ["systemChat",_x];};
} forEach _unit;
