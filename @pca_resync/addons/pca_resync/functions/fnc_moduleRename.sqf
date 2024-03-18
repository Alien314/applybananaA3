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
	private _group = group _unit;
	private _element = [tmf_orbat_orbatMarkerArray,_group] call BIS_fnc_findNestedElement;
	private _count = count _element;
	if (isNil "zen_dialog") exitWith {};

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
		} forEach (groups side player);

		["New Group Parent", [
			["LIST", ["Parent","Group that should lead the new group, or the new group should replace."], [_parentGroups,_parentGroups,0,5], true]
		], {  params ["_values", "_args"];
			_values params ["_name"];
			_args params ["_group"];

			["", [
				["CHECKBOX", "Replace Parent?", false, true]
			], {  params ["_values", "_args"];
				_values params ["_check"];
				_args params ["_group","_parent"];

				private _element = [tmf_orbat_orbatMarkerArray,_parent] call BIS_fnc_findNestedElement;
				private _count = count _element;
				if (_count isEqualTo 0) exitWith {systemChat "Failed to find parent."};
				_element deleteAt (_count - 1);
				private _marker = ([tmf_orbat_orbatMarkerArray,_element] call BIS_fnc_returnNestedElement);

				if (_check) exitWith {
					_marker set [8,_group];
					publicVariable "tmf_orbat_orbatMarkerArray";
					_group setGroupIdGlobal [_parent];

					if (isNil "pca_didRename") then {
						pca_didRename = true;
						publicVariable "pca_didRename";};
					(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
				};

				["New Group Name", [
					["EDIT", "Name", groupId _group, true]
				], {  params ["_values", "_args"];
					_values params ["_name"];
					_args params ["_group","_marker"];
					_marker params ["_parent", "_texture1", "_color", "_size"];

					[_parent,_name,[_texture1,_color,_size],"",_group] call tmf_orbat_fnc_add;

					publicVariable "tmf_orbat_orbatMarkerArray";
					_group setGroupIdGlobal [_name];

					if (isNil "pca_didRename") then {
						pca_didRename = true;
						publicVariable "pca_didRename";};
					(format ["%1 renamed your group to %2.",(name player),_name]) remoteExec ["systemChat",_group];
				},{},[_group,_marker]] call zen_dialog_fnc_create;
			},{},[_group, _name]] call zen_dialog_fnc_create;
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
/*
					_marker params ["_text", "_texture1", "_color", "_size", "_pos", "_minSiblingPos", "_maxChildPos", "_texture2"];
[["1PLT","x\tmf\addons\orbat\textures\blue_inf.paa",[1,1,1,1],[32,32],[4033.08,3973.44,0.00143909],[0,0,0],[3995.33,3984.05,0.00143909],"x\tmf\addons\orbat\textures\modif_3dot.paa"],
[["MMG","x\tmf\addons\orbat\textures\gray_mg_m.paa",[1,1,1,1],[32,32],[4040,3984.05,0.00143909],[4048,3984.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B MMG]],
[["MAT","x\tmf\addons\orbat\textures\gray_antitank_rocket.paa",[1,1,1,1],[32,32],[4048,3984.05,0.00143909],[4040,3984.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B MAT]],
[["S1","x\tmf\addons\orbat\textures\orange_armor.paa",[1,1,1,1],[32,32],[4036,3972.05,0.00143909],[4046,3972.05,0.00143909],[0,0,0],"",B Sierra 1]],
[["S2","x\tmf\addons\orbat\textures\orange_armor.paa",[1,1,1,1],[32,32],[4046,3972.05,0.00143909],[4036,3972.05,0.00143909],[0,0,0],"",B Sierra 2]],
[["S3","x\tmf\addons\orbat\textures\orange_armor.paa",[1,1,1,1],[32,32],[4056,3972.05,0.00143909],[4046,3972.05,0.00143909],[0,0,0],"",B Sierra 3]],
[["P1","x\tmf\addons\orbat\textures\purple_rotarywing.paa",[1,1,1,1],[32,32],[4030,3960.05,0.00143909],[4038,3960.05,0.00143909],[0,0,0],"",B Phantom 1]],
[["P2","x\tmf\addons\orbat\textures\purple_rotarywing.paa",[1,1,1,1],[32,32],[4038,3960.05,0.00143909],[4030,3960.05,0.00143909],[0,0,0],"",B Phantom 2]],
[["P3","x\tmf\addons\orbat\textures\purple_rotarywing.paa",[1,1,1,1],[32,32],[4046,3960.05,0.00143909],[4038,3960.05,0.00143909],[0,0,0],"",B Phantom 3]],
[["LOGI","x\tmf\addons\orbat\textures\yellow_logistics.paa",[1,1,1,1],[32,32],[4060,3960.05,0.00143909],[4056,3972.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B LOGI]],
[["1PLT","x\tmf\addons\orbat\textures\yellow_hq.paa",[1,1,1,1],[32,32],[4007.99,3994.05,0.00143909],[4019.33,3984.05,0.00143909],[4007.99,3994.05,0.00143909],"x\tmf\addons\orbat\textures\modif_o.paa"],[["1PLT HQ","x\tmf\addons\orbat\textures\yellow_hq.paa",[1,1,1,1],[32,32],[4007.99,3994.05,0.00143909],[0,0,0],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B PLT HQ]]]
,[["ALPHA","x\tmf\addons\orbat\textures\red_inf.paa",[1,1,1,1],[32,32],[3995.33,3984.05,0.00143909],[4007.99,3994.05,0.00143909],[3998,3988.05,0.00143909],"x\tmf\addons\orbat\textures\modif_dot.paa"],
[["ASL","x\tmf\addons\orbat\textures\red_inf.paa",[1,1,1,1],[32,32],[3998,3988.05,0.00143909],[3994,3984.05,0.00143909],[0,0,0],"",B ASL]],
[["A1","x\tmf\addons\orbat\textures\red_inf.paa",[1,1,1,1],[32,32],[3994,3984.05,0.00143909],[3994,3980.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B A1]],
[["A2","x\tmf\addons\orbat\textures\red_inf.paa",[1,1,1,1],[32,32],[3994,3980.05,0.00143909],[3994,3984.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B A2]]],
[["BRAVO","x\tmf\addons\orbat\textures\blue_inf.paa",[1,1,1,1],[32,32],[4019.33,3984.05,0.00143909],[4007.99,3994.05,0.00143909],[4022,3988.05,0.00143909],"x\tmf\addons\orbat\textures\modif_dot.paa"],
[["BSL","x\tmf\addons\orbat\textures\blue_inf.paa",[1,1,1,1],[32,32],[4022,3988.05,0.00143909],[4018,3984.05,0.00143909],[0,0,0],"",B BSL]],
[["B1","x\tmf\addons\orbat\textures\blue_inf.paa",[1,1,1,1],[32,32],[4018,3984.05,0.00143909],[4018,3980.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B B1]],
[["B2","x\tmf\addons\orbat\textures\blue_inf.paa",[1,1,1,1],[32,32],[4018,3980.05,0.00143909],[4018,3984.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B B2]]],
[["CHARLIE","x\tmf\addons\orbat\textures\green_inf.paa",[1,1,1,1],[32,32],[4007.33,3968.05,0.00143909],[3995.33,3984.05,0.00143909],[4010,3972.05,0.00143909],"x\tmf\addons\orbat\textures\modif_dot.paa"],
[["CSL","x\tmf\addons\orbat\textures\green_inf.paa",[1,1,1,1],[32,32],[4010,3972.05,0.00143909],[4006,3968.05,0.00143909],[0,0,0],"",B CSL]],
[["C1","x\tmf\addons\orbat\textures\green_inf.paa",[1,1,1,1],[32,32],[4006,3968.05,0.00143909],[4006,3964.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B C1]],
[["C2","x\tmf\addons\orbat\textures\green_inf.paa",[1,1,1,1],[32,32],[4006,3964.05,0.00143909],[4006,3968.05,0.00143909],[0,0,0],"x\tmf\addons\orbat\textures\modif_o.paa",B C2]]]]
*/