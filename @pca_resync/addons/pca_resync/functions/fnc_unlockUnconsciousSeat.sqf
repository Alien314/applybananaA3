params ["_unit"];

private _seat = _unit getVariable ["pca_resync_lockedSeat", []];
_seat params ["_vehicle", "_type", "_position"];

if (_seat isEqualTo []) exitWith {};

switch (_type) do {
    case "driver": {
		_vehicle lockDriver false;
        [_vehicle, false] remoteExec ["lockDriver",_vehicle];
    };

    case "cargo": {
        _vehicle lockCargo [_cargoIndex, false];
        [_vehicle, [_position, false]] remoteExec ["lockCargo",_vehicle];
    };

    case "turret": {
        _vehicle lockTurret [_position, false];
        [_vehicle, [_position, false]] remoteExec ["lockTurret",_vehicle];
    };
};

_unit setVariable ["pca_resync_lockedSeat", nil, true];