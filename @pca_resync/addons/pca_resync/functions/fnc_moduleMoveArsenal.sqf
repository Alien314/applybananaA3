params ["_logic"];

private _unit = attachedTo _logic;

if (isNull _unit || {!isPlayer _unit}) exitWith {
	private _pos = getPosASL _logic;
	player setVariable ["startpos", _pos];
	if !(local _logic) exitWith {};

	deleteVehicle _logic;
};

if (_unit isEqualTo player) then {	
	player setVariable ["startpos", getPosASL player];
};

if !(local _logic) exitWith {};

deleteVehicle _logic;