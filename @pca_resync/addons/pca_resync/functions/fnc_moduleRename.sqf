params ["_logic"];

if !(local _logic) exitWith {};

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
if (isNil "zen_dialog") exitWith {};

if !(isNil "tmf_orbat_orbatMarkerArray") exitWith {
	private _group = group _unit;
	private _element = [tmf_orbat_orbatMarkerArray,_group] call BIS_fnc_findNestedElement;
	private _count = count _element;
	private _side = side _group;

	if (_count isEqualTo 0) exitWith {
		// collect group names
		private _parentGroups = []; 
		{ 
		    private _element = [tmf_orbat_orbatMarkerArray,_x] call BIS_fnc_findNestedElement; 
		    private _count = count _element; 
		    if (_count isEqualTo 0) then {continue}; 
		    _element deleteAt (_count - 1); 
		    _element set [(_count - 2),0];
		    _element set [(_count - 3),0];
		    _element = ([tmf_orbat_orbatMarkerArray,_element] call BIS_fnc_returnNestedElement); 
		    if !(isNil "_element") then {_parentGroups pushBackUnique _element;}; 
		} forEach (groups _side);

		private _factionDefault = ["Redfor","Bluefor","Grefor","Civilian","Unknown","Renegade"];
		_parentGroups append _factionDefault;

		["New Group Parent", [
			["LIST", ["Parent","Group that should lead the new group, or the new group should replace."], [_parentGroups,_parentGroups,0,5], true]
		], {  params ["_values", "_args"];
			_values params ["_parent"];
			_args params ["_group"];

			/*["", [
				["CHECKBOX", "Replace Parent?", false, true]
			], {  params ["_values", "_args"];
				_values params ["_check"];
				_args params ["_group","_parent"];*/
				private _marker = [];
				private _element = [tmf_orbat_orbatMarkerArray,_parent] call BIS_fnc_findNestedElement;
				private _count = count _element;
				if (_count isEqualTo 0) then {
					private _factionDefault = [["Redfor","x\tmf\addons\orbat\textures\red.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""],["Bluefor","x\tmf\addons\orbat\textures\blue.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""],["Grefor","x\tmf\addons\orbat\textures\green.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""],["Civilian","x\tmf\addons\orbat\textures\purple.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""],["Unknown","x\tmf\addons\orbat\textures\yellow.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""],["Renegade","x\tmf\addons\orbat\textures\orange.paa",[1,1,1,1],[32,32],[0,0,0],[0,0,0],[0,0,0],""]];				

					private _element = [_factionDefault,_parent] call BIS_fnc_findNestedElement;
					private _count = count _element;
					if (_count isEqualTo 0) exitWith {systemChat "Failed to find parent."};
					_element deleteAt (_count - 1);
					_marker = ([_factionDefault,_element] call BIS_fnc_returnNestedElement);
					_marker set [0,""];
				} else {
					_element deleteAt (_count - 1);
					_marker = ([tmf_orbat_orbatMarkerArray,_element] call BIS_fnc_returnNestedElement);
				};

				/*if (_check) exitWith {
					_marker set [8,_group];
					publicVariable "tmf_orbat_orbatMarkerArray";
					_group setGroupIdGlobal [_parent];

					if (isNil "pca_didRename") then {
						pca_didRename = true;
						publicVariable "pca_didRename";};
					(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
				};*/

				["New Group Name", [
					["EDIT", "Name", groupId _group, true]
				], {  params ["_values", "_args"];
					_values params ["_name"];
					_args params ["_group","_marker"];
					_marker params ["_parent", "_texture1", "_color", "_size"];
					if ("_hq" in _texture1) then { _texture1 = [_texture1, "_hq", ""] call CBA_fnc_replace; };
					[_parent,_name,[_texture1,_color,_size],"",_group] call tmf_orbat_fnc_add;

					publicVariable "tmf_orbat_orbatMarkerArray";
					_group setGroupIdGlobal [_name];

					if (isNil "pca_didRename") then {
						pca_didRename = true;
						publicVariable "pca_didRename";};
					(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
				},{},[_group,_marker,_parentGroups]] call zen_dialog_fnc_create;
			//},{},[_group, _parent]] call zen_dialog_fnc_create;
		},{},[(group _unit)]] call zen_dialog_fnc_create;
	};

	
	_element deleteAt (_count - 1);
	private _marker = ([tmf_orbat_orbatMarkerArray,_element] call BIS_fnc_returnNestedElement);

	["Rename Group", [
		["EDIT", "Name", (_marker select 0), true]
	], {  params ["_values", "_args"];
		_values params ["_name"];
		_args params ["_marker"];

		_marker set [0,_name];
		publicVariable "tmf_orbat_orbatMarkerArray";
		private _group = (_marker select 8);
		_group setGroupIdGlobal [_name];

		if (isNil "pca_didRename") then {
			pca_didRename = true;
			publicVariable "pca_didRename";};
		(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
	},{},[_marker]] call zen_dialog_fnc_create;
};

["Rename Group", [
	["EDIT", "Name", (groupId _group), true]
], {  params ["_values", "_args"];
	_values params ["_name"];
	_args params ["_group"];

	_group setGroupIdGlobal [_name];

	(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
},{},[_group]] call zen_dialog_fnc_create;