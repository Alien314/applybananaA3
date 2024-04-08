if (missionNamespace getVariable ["pca_resync_disableSeatLocking", false]) exitWith {};
params ["_unit"];

if (pca_resync_seatDisableAI && {!isPlayer _unit && {(_unit getVariable ["ace_medical_statemachine_AIUnconsciousness",false])}}) exitWith {};

private _vehicle = objectParent _unit;

if (isNull _vehicle) exitWith {};
if (alive _unit && {lifeState _unit != "INCAPACITATED"}) exitWith {};

switch (true) do {
    case (_unit isEqualTo (driver _vehicle)): {
        _vehicle lockDriver true;
        [_vehicle, true] remoteExec ["lockDriver",_vehicle];
        _unit setVariable ["pca_resync_lockedSeat", [_vehicle, "driver"], true];
    };

    case (_vehicle getCargoIndex _unit != -1): {
        private _cargoIndex = _vehicle getCargoIndex _unit;
        _vehicle lockCargo [_cargoIndex, true];
        [_vehicle, [_position, true]] remoteExec ["lockCargo",_vehicle];
        _unit setVariable ["pca_resync_lockedSeat", [_vehicle, "cargo", _cargoIndex], true];
    };

    case ((_vehicle unitTurret _unit) isNotEqualTo []): {
        private _turretPath = _vehicle unitTurret _unit;
        _unit setVariable ["pca_resync_lockedSeat", [_vehicle, "turret", _turretPath], true];
		_vehicle lockTurret [_turretPath, true];
        [_vehicle, [_turretPath, true]] remoteExec ["lockTurret",_vehicle];
    };
};