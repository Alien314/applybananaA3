params ["_logic"];

private _unit = attachedTo _logic;

deleteVehicle _logic;

private _isObj = _unit isEqualType objNull;
private _isPerson = (_isObj && {(_unit isKindOf "CAManBase")});

if (_isObj && {!_isPerson}) then {
	private _lead = [];
	{
		_lead = (fullCrew [_unit,_x]);
		if (_lead isNotEqualTo []) exitWith { _unit = (leader ((_lead select 0) select 0) ); };
	} forEach ["commander","gunner","driver","turret",""];
	if (count _lead isEqualTo 0) then {_unit = objNull}; 
};

if (isNull _unit || { !_isObj }) exitWith {
    //[objNull, "No unit or vehicle selected."] call BIS_fnc_showCuratorFeedbackMessage;
};

private _group = group _unit;

if !(isNil "tmf_orbat_orbatMarkerArray") exitWith {
	private _element = [tmf_orbat_orbatMarkerArray,(group _unit)] call BIS_fnc_findNestedElement;
	private _count = count _element;
	if (isNil "zen_dialog" || {_count isEqualTo 0}) exitWith {};
	private _marker = tmf_orbat_orbatMarkerArray;
	_count = _count - 2;
	for "_i" from 0 to _count do {
		_marker = _marker select (_element select _i);
	};

	private _group = (_marker select  8);
	if (isNil "_group") exitWith {systemChat "Failed to find group."};

	private _hidden = false;

	private _prevIcon = (_group getVariable ["pca_prevIcon",nil]);

	if (isNil "_prevIcon") then {
		_group setVariable ["pca_prevIcon",[(_marker select 0),(_marker select 1),(_marker select 7)],true];
		_marker set [0,""];
		_marker set [1,""];
		_marker set [7,""];
		_hidden = true;
	} else {
		_marker set [0,(_prevIcon select 0)];
		_marker set [1,(_prevIcon select 1)];
		_marker set [7,(_prevIcon select 2)];
		_group setVariable ["pca_prevIcon",nil,true];
	};

	publicVariable "tmf_orbat_orbatMarkerArray";

	if (isNil "pca_didRename") then {
		pca_didRename = true;
		publicVariable "pca_didRename";
	};
	(format ["%1 %2 your group marker.",(name player),(["unhid","hid"] select _hidden)]) remoteExec ["systemChat",_group];
};

private _hidden = _group getVariable ['ACE_map_hideBlueForceMarker',false];

if (_hidden) exitWith {
	_group setVariable ['ACE_map_hideBlueForceMarker',nil,true];
};
_group setVariable ['ACE_map_hideBlueForceMarker',true,true];