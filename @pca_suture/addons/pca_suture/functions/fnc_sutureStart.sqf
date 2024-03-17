params ["_medic", "_patient"];

private _hasSurgKit = false;
private _aceConsume = ace_medical_treatment_consumeSurgicalKit > 0;

["pca_suture_treatmentStarted",[_patient], [_patient,_medic]] call CBA_fnc_targetEvent;

{
	if ([_x, "ACE_surgicalKit"] call ace_common_fnc_hasItem) exitWith { _hasSurgKit = true; };
} forEach [_medic,_patient];

if ( _aceConsume || { !_hasSurgKit } ) then {
    ([_medic, _patient, ["ACE_suture"]] call ace_medical_treatment_fnc_useItem);
	if (!_aceConsume) exitWith {call pca_suture_fnc_showCount};
	if (pca_suture_consumption) exitWith {
		pca_suture_consume = ace_medical_treatment_consumeSurgicalKit;
		ace_medical_treatment_consumeSurgicalKit = 2;
	};
	pca_suture_consume = ace_medical_treatment_consumeSurgicalKit;
	ace_medical_treatment_consumeSurgicalKit = 0;
};