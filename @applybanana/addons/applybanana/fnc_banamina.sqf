params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

if !(local _patient) exitWith {_this remoteExec ["ab_applybanana_fnc_banamina",_patient];};
if (isDedicated) exitWith {};

[_patient, _usedItem] call ace_medical_treatment_fnc_addToTriageCard;
[_patient, "activity", "%1 administered %2", [[_medic, false, true] call ace_common_fnc_getName, "Banana"]] call ace_medical_treatment_fnc_addToLog;
if (!ace_advanced_fatigue_enabled || {isDedicated || {!isPlayer _patient}}) exitWith {};

// if remoteExec limited, use target event?
// ["ab_applybanana_banaminaLocal", [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;

//#define AE1_MAXRESERVE 4000000
//#define AE2_MAXRESERVE   84000
#define AN_MAXRESERVE     2300

// can replace the Plus values with a number or calculation if you don't want full stam reset.
//private _ae1Plus = AE1_MAXRESERVE; // regen factor, optional
//ace_advanced_fatigue_ae1Reserve = ((ace_advanced_fatigue_ae1Reserve + (_ae1Plus)) min AE1_MAXRESERVE);

//private _ae2Plus = AE2_MAXRESERVE; // regen factor, optional
//ace_advanced_fatigue_ae2Reserve = ((ace_advanced_fatigue_ae2Reserve + (_ae2Plus)) min AE2_MAXRESERVE);

// This is the visble stam bar value
private _anPlus = AN_MAXRESERVE;
//ace_advanced_fatigue_anReserve = (ace_advanced_fatigue_anReserve + (_anPlus)) min AN_MAXRESERVE;

[_anPlus] spawn { // regen over time instead of instant
    params ["_anPlus"];
	private _duration = 30;
	private _perSecond = (_anPlus / _duration);
	
	for "_i" from 1 to _duration do {
        sleep 1; // ace fatigue main loop runs once a second
        // or condition can be removed for temporary stamina boost beyond refill
        if (!alive ACE_Player || { ace_advanced_fatigue_anReserve >= AN_MAXRESERVE}) exitWith {};
        ace_advanced_fatigue_anReserve = (ace_advanced_fatigue_anReserve + (_perSecond)) min AN_MAXRESERVE;
    };
};

/*/ optional?
private _musclePlus = ace_advanced_fatigue_muscleDamage; // regen factor
ace_advanced_fatigue_muscleDamage = (ace_advanced_fatigue_muscleDamage - _musclePlus) max 0;