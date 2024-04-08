if (!hasInterface) exitWith {};
if (!canSuspend) exitWith {_this spawn pca_resync_fnc_moduleMoveArsenal};

params ["_logic"];

private _unit = attachedTo _logic;
private _prevPos = (player getVariable ["startpos",nil]);

if (isNull _unit || {!(_unit isKindOf "CAManBase")}) exitWith {
	private _pos = getPosASL _logic;
	if (isNil '_prevPos') then {
		if (isNil 'pca_fnc_curatedArsenal') exitWith {"Arsenal script not found."};
		private _complete = (player spawn pca_fnc_curatedArsenal);
		waitUntil {sleep 1; scriptDone _complete};
	};
	player setVariable ["startpos", _pos];

	if !(local _logic) exitWith {};
	systemChat "All players' arsenal moved here.";
	deleteVehicle _logic;
};

if (_unit isEqualTo player) then {	
	if (isNil '_prevPos') exitWith {player call pca_fnc_curatedArsenal};
	player setVariable ["startpos", getPosASL player];
};

if !(local _logic) exitWith {};

deleteVehicle _logic;