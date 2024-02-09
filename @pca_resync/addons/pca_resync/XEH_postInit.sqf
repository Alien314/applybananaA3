#include "settings.sqf"
if (isServer) then {
	if (isMultiplayer) then {
		if (pca_resyncAction) then {
			["pca_resync", {
				_this spawn {
					params ["_unit"];
					if (isPlayer _unit) exitWith {
						private _owner = owner _unit;
						_unit setOwner 2;
						sleep 1;
						_unit setOwner _owner;
					};
					//if (_unit in playableUnits) exitWith {};
					//_unit setDamage [1,false];
				};
			}] call CBA_fnc_addEventHandler;

			["pca_syncCheck", {  params ["_unit","_caller","_state"];
				private _servState = lifestate _unit;
				if (_servState isEqualTo _state) exitWith {};
				diag_log (format ["pca Arma: %1, %4, desync'd as %3 for %2, resyncing.",(name _unit),(name _caller),_state,_servState]);
				["pca_resync", _unit] call CBA_fnc_serverEvent;
			}] call CBA_fnc_addEventHandler;
		};


		if (pca_zeusCompKilled) then {
			["pca_killedToServer", {  params ["_unit"];
				if (local _unit || {isPlayer _unit}) exitWith {};
				private _inited = _unit getVariable ["pca_killedReturn", nil];
				if (isNil "_inited") then {
					if (!alive _unit) exitWith {
						_unit spawn { private _deadTime = time;
							waitUntil {sleep 5; !isAwake _this || {(time - _deadTime) > 15}};
							_this setOwner 2; _this awake false;};
					};
					_unit setVariable ["pca_killedReturn", true];
					_unit addMPEventHandler ["MPKilled", { params ["_unit"];
						if (!isServer || {local _unit}) exitWith {_unit setVariable ["pca_killedReturn", nil];};
						//[{!isAwake _this},{_this setOwner 2;},_unit,15,{_this setOwner 2;}] call cba_fnc_waitUntilAndExecute;
						_unit spawn { private _deadTime = time;
							waitUntil {sleep 5; !isAwake _this || {(time - _deadTime) > 15}};
							_this setOwner 2; _this awake false; _this setVariable ["pca_killedReturn", nil];};
					}];
				};
				//[_unit,{waitUntil {sleep 5; !isAwake _this}; _this setOwner 2;}] remoteExec ["spawn",2];
			}] call CBA_fnc_addEventHandler;
			["CAManBase", "InitPost", {
				params ["_unit"];
				["pca_killedToServer", [_unit]] call CBA_fnc_serverEvent;
			}, true, [], false] call CBA_fnc_addClassEventHandler;
		};
	};
};

if (pca_disableGunnerBail) then {
	[{  private _eventHash = (cba_events_eventHashes getVariable ["ace_vehicle_damage_bailOut", nil]);
		private _eventId = [_eventHash, "#lastId"] call CBA_fnc_hashGet;
		if (isServer && {_eventId > 0}) then {systemChat "PCA > Disable gunner bail being on may cause issues due to another mod besides ACE using the same event."};
		["ace_vehicle_damage_bailOut", 0] call CBA_fnc_removeEventHandler;
		["ace_vehicle_damage_bailOut", {
			params ["_center", "_crewman", "_vehicle"];

			if (isPlayer _crewman) exitWith {};
			private _canShoot = (_vehicle getVariable ["ace_vehicle_damage_canShoot",true]);
			if (!alive _crewman || { !( [_crewman] call ace_common_fnc_isAwake) || {_canShoot && { pca_fullDismount || {(_crewman isEqualTo (gunner _vehicle))} } } } ) exitWith {};

			unassignVehicle _crewman;
			if (!_canShoot) then {_crewman leaveVehicle _vehicle;};
			doGetOut _crewman;

			private _angle = floor (random 360);
			private _dist = (30 + (random 10));
			private _escape = _center getPos [_dist, _angle];

			_crewman doMove _escape;
			_crewman setSpeedMode "FULL";
		}] call CBA_fnc_addEventHandler;
	}, nil, 3] call cba_fnc_waitAndExecute;
};

if (isMultiplayer) then {
	if (pca_carryLocal && {!isNil "ace_dragging"}) then {
		pca_carryLocalHandle = ["pca_carryLocal", {
			_this spawn {
				params["_player", "_obj"];
				sleep 0.2;
				if (_player distance _obj > 10) then {
					_this call ace_dragging_fnc_carryObject;
				};
			};
		}] call CBA_fnc_addEventHandler;

		pca_carryHandle = ["pca_carryHandler", { params ["_obj"];
			private _carrier = attachedTo _obj;
			if (isNull _carrier) exitWith {};
			if ((owner _carrier) isEqualTo (owner _obj)) exitWith {};
			_obj setOwner (owner _carrier);
			["pca_carryLocal", [_carrier, _obj], _carrier] call CBA_fnc_targetEvent;
		}] call CBA_fnc_addEventHandler;

		pca_handoffHandle = ["ace_common_setDir", {
			if ((_this select 0) isKindOf "CAManBase") exitWith {};
			["pca_carryHandler", [(_this select 0)]] call CBA_fnc_serverEvent;
		}] call CBA_fnc_addEventHandler;
	};

	if (pca_resyncAction) then {
		if (hasInterface) then {player createDiarySubject ["pca_resync", "Resync"];};
		pca_resyncEH = ["pca_resyncPlayer", { params ["_unit"];
			_unit spawn { params ["_unit"]; waitUntil {sleep 5; isPlayer _unit || {!(alive _unit)}};
				sleep 1;
				if (!alive _unit) exitWith {};
				private _var = ("pca_" + (((name _unit) splitString "([ ]/:){}") joinString ""));
				private _assign = (missionNamespace getVariable [_var,nil]);
				missionNamespace setVariable [_var,_unit];
				if (!hasInterface || {!isNil "_assign"}) exitWith {};
				waitUntil {sleep 5; !(isNull player)};
				if (!alive _unit) exitWith {};
				player createDiaryRecord  ["pca_resync", [(name _unit),format ["<execute expression='if !(isNil ""pca_syncCD"") exitWith {}; pca_syncCD = false; [{pca_syncCD = nil;},[],60] call CBA_fnc_waitAndExecute; [""pca_resync"", %1] call CBA_fnc_serverEvent;'>[Re-sync State]</execute>",_var]]];
			};
		}] call CBA_fnc_addEventHandler;

		if (!hasInterface) exitWith {};
		0 spawn { waitUntil {sleep 5; !(isNull player)};
			[{  private _var = ("pca_" + (((name player) splitString "([ ]/:){}") joinString ""));
				["pca_resyncPlayer",[player], _var] call CBA_fnc_globalEventJIP;
				player spawn pca_resync_fnc_respawnSync;
			}, nil, 3] call cba_fnc_waitAndExecute;
		};
	};

	if !(hasInterface) exitWith {};
	if (pca_zeusCompKilled) then {
		if !(isNil "zen_remote_control") then {
			["zen_remoteControlStopped", {
				if (isServer) exitWith {};
					["pca_killedToServer", [_this]] call CBA_fnc_serverEvent;
			}] call CBA_fnc_addEventHandler;
		} else {
			["ModuleCurator_F", "InitPost", { params ["_curator"];
				systemChat str ([_curator, "curatorObjectRemoteControlled", {params ["_curator", "_player", "_unit", "_isRemoteControlled"];
					if (isServer) exitWith {};
					if !(_isRemoteControlled) then {
						["pca_killedToServer", [_unit]] call CBA_fnc_serverEvent;
					};
				}] call BIS_fnc_addScriptedEventHandler);
			}, false, [], true] call CBA_fnc_addClassEventHandler;
		};
	};
	if (didJIP && {!isNil "pca_didRename"}) then {
		0 spawn {
			waitUntil {time > 0};
			sleep 5;
			[clientOwner,"tmf_orbat_orbatMarkerArray"] remoteExec ["publicVariableClient",2];
		};
	};
};

if !(hasInterface) exitWith {};

setTIParameter ["OutputRangeStart", pca_thermalStart];
setTIParameter ["OutputRangeWidth", pca_thermalWidth];

if (!isNil "ace_interact_menu") then {
	private _action = [
		"pca_uniformFix","Fix Uniform",
		"\a3\ui_f\data\gui\rsc\rscdisplayarsenal\uniform_ca.paa",
		{ 	 params ["", "_player", ""];
			_player call pca_resync_fnc_switchUniform;
		},  { true },{ },[],[0,0,0],3,[false, true, false, false, true]
	] call ace_interact_menu_fnc_createAction;

	["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};

["CBA_loadoutSet", {
    params ["_unit", "", "_extradata"];
    private _mode = _extradata getOrDefault ["pca_dagrMode", nil];
    if (!isNil "_mode" && {"ACE_microDAGR" in (_unit call ace_common_fnc_uniqueItems)}) then {
		if (_mode == -1) exitWith {}; [_mode] call ace_microdagr_fnc_openDisplay; };
    if ((_extradata getOrDefault ["pca_gpsMode", false]) && {"ItemGPS" in (_unit call ace_common_fnc_uniqueItems)}) then {
		openGPS true;};
	[_unit,(_extradata getOrDefault ["pca_goggles", ""])] spawn { params ["_unit","_goggs"]; sleep 1;
		if (_goggs isNotEqualTo "") then {
			_unit addGoggles _goggs;
		};
	};
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "", "_extradata"];
    private _mode = missionNamespace getVariable ["ace_microdagr_currentShowMode",nil];
    if (!isNil "_mode") then {
        _extradata set ["pca_dagrMode", _mode];};
	if (visibleGPS) then {_extradata set ["pca_gpsMode", true];};
	private _goggs = goggles _unit; 
	if (_goggs isNotEqualTo "") then {
		_extradata set ["pca_goggles", _goggs];
	};
}] call CBA_fnc_addEventHandler;

0 spawn { sleep 5;
	private _pointKeybinds = ((["ACE3 Common", "ace_finger_finger"] call CBA_fnc_getKeybind) select 8);
	{	(_x + [{ call pca_resync_fnc_jam; }, "keydown", "", false]) call CBA_fnc_addKeyHandler;
	} forEach _pointKeybinds;
};