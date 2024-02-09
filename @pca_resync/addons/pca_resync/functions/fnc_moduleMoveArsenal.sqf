params ["_logic"];

private _unit = attachedTo _logic;
private _pos = getPosASL _logic;

if (isNull _unit) exitWith {
	player setVariable ["startpos", _pos, true];
	if !(local _logic) exitWith {};

	deleteVehicle _logic;
};

if (_unit isEqualTo player) then {	
	player setVariable ["startpos", getPosASL player];
};

if !(local _logic) exitWith {};

deleteVehicle _logic;