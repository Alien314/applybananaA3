params ["_patient","_medic","",["_first",true]]; //, "_bodyPart", "_classname", "", "_usedItem"

if (_first) exitWith {
	[
		ace_medical_treatment_treatmentTimeTourniquet,
		[_medic, _patient],
		{(_this # 0) params ["_medic", "_patient"]; [_medic,_patient,"",false] call ab_fnc_banTour},
		{},
		"Applying Banana...",
		{true},
		["isNotInside"]
	] call ace_common_fnc_progressBar;
};

private _bodyPart = "head";
private _usedItem = "ACE_Banana";

[_medic, _usedItem] call ace_common_fnc_useItem;

//_this call ace_medical_treatment_fnc_tourniquet;
if ([_patient, _bodyPart] call ace_medical_treatment_fnc_hasTourniquetAppliedTo) exitWith {
    ["There is already a bananiquet on this body part!", 1.5] call ace_common_fnc_displayTextStructured; // todo: localize
};
[_patient, _usedItem] call ace_medical_treatment_fnc_addToTriageCard;
[_patient, "activity", "%1 applied a banana", [[_medic, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;

["ace_medical_treatment_tourniquetLocal", [_patient, _bodyPart], _patient] call CBA_fnc_targetEvent;

[{_this call ace_medical_treatment_fnc_tourniquetRemove;}, [objNull, _patient, _bodyPart], 30] call CBA_fnc_waitAndExecute;