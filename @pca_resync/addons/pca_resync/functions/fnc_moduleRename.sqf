params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

private _isObj = _unit isEqualType objNull;
private _isPerson = (_isObj && {(_unit isKindOf "CAManBase")});
if (isNull _unit || { !_isObj }) exitWith {
    //[objNull, "No unit or vehicle selected."] call BIS_fnc_showCuratorFeedbackMessage;
};

if (!_isPerson) then {_unit = leader driver _unit;};

if !(isNil "tmf_orbat_orbatMarkerArray") exitWith {
	private _element = [tmf_orbat_orbatMarkerArray,(group _unit)] call BIS_fnc_findNestedElement;
	private _count = count _element;
	if (isNil "zen_dialog" || {_count isEqualTo 0}) exitWith {};
	private _marker = tmf_orbat_orbatMarkerArray;
	_count = _count - 2;
	for "_i" from 0 to _count do {
		_marker = _marker select (_element select _i);
	};

	["Rename Group", [
		["EDIT", "Name", (_marker select 0), true]
	], {  params ["_values", "_args"];
		_values params ["_name"];
		_args params ["_marker"];

		_marker set [0,_name];
		publicVariable "tmf_orbat_orbatMarkerArray";
		private _group = (_marker select 8);
		_group setGroupIdGlobal [_name];

		(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
	},{},[_marker]] call zen_dialog_fnc_create;
};

private _group = group _unit;
["Rename Group", [
	["EDIT", "Name", (groupId _group), true]
], {  params ["_values", "_args"];
	_values params ["_name"];
	_args params ["_group"];

	_group setGroupIdGlobal [_name];

	(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
},{},[_group]] call zen_dialog_fnc_create;