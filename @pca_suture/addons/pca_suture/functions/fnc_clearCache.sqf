params ["_medic", "_patient"];
["pca_suture_treatmentComplete",[_patient,_medic],[_patient,_medic]] call CBA_fnc_targetEvent;
if (!isNil "pca_suture_consume") then {
	ace_medical_treatment_consumeSurgicalKit = pca_suture_consume;
	pca_suture_consume = nil;
	call pca_suture_fnc_showCount;
};