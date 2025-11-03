params ["_medic", "_patient",['_trainOverride',false]];

private _triage = pca_suture_autoTriage;
private _trainage = pca_suture_autoTriageTrained;
if ((_triage + _trainage) < 1) exitWith {};

private _tLevel = (_medic getVariable ['ace_medical_medicClass', parseNumber (_medic getUnitTrait "medic")]);
private _req = _tlevel - pca_suture_autoTriageReq;
if ( _req < 0 && {!_trainOverride}) exitWith {};

private _status = -1;
// ded
if !(alive _patient) exitWith {_patient setVariable ["ace_medical_triageLevel", 4, true];};
if ( (_trainage > 1 || {_req < 1 && {_triage > 1}}) && {!_trainOverride} ) exitWith {};

//uncon
private _uncon = (_patient getVariable ['ACE_isUnconscious',false]);
if (_uncon) then {_status = 1};

// blood
private _blood = (_patient getVariable ['ace_medical_bloodVolume',6.0]);
private _bleed = (_patient getVariable ['ace_medical_woundBleeding',0]);
if (_uncon && {_blood < pca_suture_autoTriageBloodDel} || {_bleed > pca_suture_autoTriageBleedDel}) then {_status = 2};

// pulse
private _pulse = (_patient getVariable ['ace_medical_heartRate',80]);
if (_pulse < 36 || { _bleed >= pca_suture_autoTriageBleedImm || {_blood < pca_suture_autoTriageBloodImm}}) then {_status = 3};


if (_status < 0) exitWith {_patient setVariable ["ace_medical_triageLevel", nil, true];};
_patient setVariable ["ace_medical_triageLevel", _status, true];