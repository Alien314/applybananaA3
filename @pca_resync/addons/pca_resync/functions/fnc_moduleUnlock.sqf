params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

private _isObj = _unit isEqualType objNull;
private _isPerson = (_isObj && {(_unit isKindOf "CAManBase")});
if (isNull _unit || { !_isObj }) exitWith {
    //[objNull, "No unit or vehicle selected."] call BIS_fnc_showCuratorFeedbackMessage;
};

if (_isPerson) exitWith {};
if (isNil "zen_dialog") exitWith {};

["Lock/Unlock", 
	[
		["CHECKBOX", "Empty to Unlock, Checked to Lock:", false, true]
	], {  params ["_values", "_args"];
		_values params ["_lock"];
		_args params ["_vehicle"];

		{
			_x params ["_unit","_type","_cargo","_turret"];
			switch (_type) do {
				case "driver": {
					[_vehicle, _lock] remoteExec ["lockDriver",_vehicle];
					[_vehicle, ([1,3] select _lock)] remoteExec ["lock",_vehicle];
				};

				case "cargo": {
					[_vehicle, [_cargo, _lock]] remoteExec ["lockCargo",[_vehicle,_unit]];
				};

				default {
					[_vehicle, [_turret, _lock]] remoteExec ["lockTurret",[_vehicle,_unit]];
				};
			};
		} forEach (fullCrew [_vehicle,"",true]);
},{},[_unit]] call zen_dialog_fnc_create;