params ["_medic", "_patient"];

if (pca_suture_autoResponse) then { _this call pca_suture_fnc_autoTriage; };

_this call ace_medical_treatment_fnc_checkResponse;