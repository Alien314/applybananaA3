private _range = pca_fingerRange;
if (_range isEqualTo 0) exitWith {};
private _target = cursorObject;
private _isPerson = _target isKindOf "CAManBase";
if (_isPerson) then { _range = _range + 0.5; };
if !(_isPerson) then { _range = _range + 3; };
if (_target isEqualTo objNull || { !alive _target || {(player distance _target > _range)}}) exitWith {};
if (_isPerson) then { _target = [_target]; };
if !(_isPerson) then { _target = crew _target; };
{
	[_x, { params ["_target"];
		if (!pca_allowJam && {isPlayer _target}) exitWith {};
		private _success = true;		
		_success = _target reload [];
	}] remoteExec ["call",_x];
} forEach _target;