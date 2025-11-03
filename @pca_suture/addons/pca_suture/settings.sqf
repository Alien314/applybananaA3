private _title = "PCA Suture";

private _category = "Sutures";

[
    "pca_suture_enable",
    "CHECKBOX",
    ["Enable Stitching With Sutures", "Allows Sutures to be used as single use surgical kits for closing wounds."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_medicReq",
    "LIST",
    ["Allow Suture", "Determines required training to use sutures."],
    [_title, _category],
    [[0, 1, 2], ["Anyone", "Medics", "Doctors"], 1],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_consumption",
    "CHECKBOX",
    ["Suture Consumed per Wound Type", "Whether Sutures are consumed per wound type (ACE behaviour), per limb if unchecked.\nMedic or patient having a Surgical Kit will prevent all consumption,\nunless ACE consumption is set to Kit/Suture."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

//pca_suture_consume = true;
/*
[
    "pca_suture_consume",
    "CHECKBOX",
    ["Consume Sutures", "Leave enabled or it's just a tiny surgical kit."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;*/

[
    "pca_suture_notify",
    "CHECKBOX",
    ["Suture Count Notification", "Shows suture counts available after using sutures."],
    [_title, _category],
    true,
    false
] call CBA_fnc_addSetting;

[
    "pca_suture_medicNotif",
    "CHECKBOX",
    ["Enable Medic Notification", "Shows an image near Weapon/Stance info when stitching, or being stitched.\nWhere it appears can be changed in Settings > Game > Layout."],
    [_title, _category],
    true,
    false,
	{},
	true
] call CBA_fnc_addSetting;

[
    "pca_suture_helpNotif",
    "CHECKBOX",
    ["Enable Help Notification", "Shows a message when another player is helping you while you are unconscious."],
    [_title, _category],
    true,
    false
] call CBA_fnc_addSetting;



private _category = "Triage";

[
    "pca_suture_autoTriage",
    "LIST",
    ["Auto Triage Function", "Determines functionality of auto triage."],
    [_title, _category],
    [[0, 1, 2], ["Disable", "Enable", "Death Only"], 2],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoTriageTrained",
    "LIST",
    ["Auto Triage Trained Function", "Determines functionality of auto triage, when above the required training level."],
    [_title, _category],
    [[0, 1, 2], ["Disable", "Enable", "Death Only"], 1],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoTriageReq",
    "LIST",
    ["Allow Auto Triage", "Determines required training to automatically set triage status."],
    [_title, _category],
    [[0, 1, 2], ["Anyone", "Medics", "Doctors"], 0],
    true
] call CBA_fnc_addSetting;

/*[
    "pca_suture_autoTriageAdv",
    "CHECKBOX",
    ["Auto Triage Advanced Checks function", "Determines whether advanced checks only check conditions relevant to the check performed (Response will mark deceased for dead and immediate for cardiac arrest, pulse will check heart rate, only blood presure will check blood)."],
    [_title, _category],
    false,
    true
] call CBA_fnc_addSetting;//*/

[
    "pca_suture_autoTriageBleedDel",
    "SLIDER",
    ["Delayed Bleed", "Lowest bleed considered delayed/yellow priority. (0.5 is considered unstable for wake up, 1.0 causes unconsciousness.)"],
    [_title, _category],
    [0, 2.0, 0.5, 2],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoTriageBleedImm",
    "SLIDER",
    ["Immediate Bleed", "Lowest bleed considered immediate priority. (0.5 is considered unstable for wake up, 1.0 causes unconsciousness.)"],
    [_title, _category],
    [0, 2.0, 1.0, 2],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoTriageBloodDel",
    "SLIDER",
    ["Delayed Blood", "Highest blood in liters considered delayed/yellow priority when unconscious. (3 is death, less than 5.1 is considered unstable.)"],
    [_title, _category],
    [3.0, 6.0, 5.1, 2],
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoTriageBloodImm",
    "SLIDER",
    ["Immediate Blood", "Highest blood in liters considered immediate priority.(3 is death, less than 5.1 is considered unstable.)"],
    [_title, _category],
    [3.0, 6.0, 3.6, 2],
    true
] call CBA_fnc_addSetting;

private _category = "Triage Activating Actions";

[
    "pca_suture_autoWake",
    "CHECKBOX",
    ["Wake up", "Whether gaining consciousness will clear triage status."],
    [_title, _category],
    true,
    true,
	{},
	true
] call CBA_fnc_addSetting;
/*[
    "pca_suture_autoWake",
    "CHECKBOX",
    ["Wake up", "Whether gaining consciousness will clear triage status."],
    [_title, _category],
    [[0, 1, 2], ["Disabled", "Player-Side Statemachine", "Ace Unconscious Event"], 1],
    true,
	{},
	true
] call CBA_fnc_addSetting;//*/

[
    "pca_suture_autoDeath",
    "CHECKBOX",
    ["Death", "Whether dying will mark deceased automatically."],
    [_title, _category],
    false,
    true,
	{},
	true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoMenu",
    "CHECKBOX",
    ["Menu Opened", "Whether opening the medical menu will activate auto triage."],
    [_title, _category],
    false,
    true,
	{},
	true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoResponse",
    "CHECKBOX",
    ["Check Response", "Whether check response will activate auto triage."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoPulse",
    "CHECKBOX",
    ["Check Pulse", "Whether check pulse will activate auto triage."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoPressure",
    "CHECKBOX",
    ["Check Blood Pressure", "Whether check Blood Pressure will activate auto triage."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_suture_autoDiag",
    "CHECKBOX",
    ["Diagnosis", "Whether diagnosis action will activate auto triage."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;