params ['_player'];

while {sleep 30; true} do {
	private _alive = alive _player;
	if (!_alive && {!isNil 'tmf_localrespawnedunit' && {player isEqualTo tmf_localrespawnedunit}}) exitWith {
		private _var = ("pca_" + (((name player) splitString "([ ]/:){}") joinString ""));
		["pca_resyncPlayer",[player], _var] call CBA_fnc_globalEventJIP;
		player spawn pca_resync_fnc_respawnSync;
	};
};