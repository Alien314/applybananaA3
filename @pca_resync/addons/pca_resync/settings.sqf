private _title = "PCA";

private _category = "Locality";

[
    "pca_disconnectAIUncon",
    "CHECKBOX",
    ["Enable Uncon for AI on Disconnect", "Prevents uncon death of player AI if a player disconnects."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_resyncAction",
    "CHECKBOX",
    ["Enable Resync Action", "Map tab with a list of players and a button to fix if someone is desync'd for you. Can cause people to be stuck in vehicles, until used again."],
    [_title, _category],
    false,
    true,
    { },
    true
] call CBA_fnc_addSetting;

[
    "pca_carryLocal",
    "CHECKBOX",
    ["Ace Carry Local", "Non-player objects are shifted to the carrying player to allow accurate rotation."],
    [_title, _category],
    false,
    true,
    { },
    true
] call CBA_fnc_addSetting;

[
    "pca_zeusCompKilled",
    "CHECKBOX",
    ["Shift Zeus Comps", "Shift zeus local AI to the server on death, making them lootable for players. (Maybe partially fixed by vanilla update. Also makes ridiculous ragdolls more common for zeus units.)"],
    [_title, _category],
    false,
    true,
    { },
    true
] call CBA_fnc_addSetting;

[
    "pca_resync_seatDisable",
    "CHECKBOX",
    ["Disable ACE Seat Locking", "Prevents ACE breaking seats by never locking them, allowing player to change/get in unconscious/dead seats and eject occupants."],
    [_title, _category],
    false,
    true
] call CBA_fnc_addSetting;

[
    "pca_resync_seatFix",
    "CHECKBOX",
    ["Fix ACE Seat Locking", "Fixes ACE breaking seats by not unlocking them when vehicle is not local but turret is."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

[
    "pca_resync_allowDumpDead",
    "CHECKBOX",
    ["Unlock Dead Seats", "Allow switching to seats with dead units, ejecting them."],
    [_title, _category],
    false,
    true
] call CBA_fnc_addSetting;

[
    "pca_resync_seatDisableAI",
    "CHECKBOX",
    ["Disable Locking AI Seats", "Prevents ACE locking seats for AI, allowing player to change/get in unconscious/dead seats and eject occupants."],
    [_title, _category],
    false,
    true
] call CBA_fnc_addSetting;

private _category = "AI";
[
    "pca_disableGunnerBail",
    "CHECKBOX",
    ["Disable Gunner bailout", "Prevents gunners from bailing if they can still shoot."],
    [_title, _category],
    true,
    true,
    { },
    true
] call CBA_fnc_addSetting;
[
    "pca_fullDismount",
    "CHECKBOX",
    ["Full Dismount Only", "Other crew also stay in until the gunner dismounts when Disable Gunner bailout is enabled."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

private _category = "Thermal Vision";
[
    "pca_thermalStart",
    "SLIDER",
    ["Thermal Cold Floor", "Sets where coldest color starts, can make thermals unusable at higher settings."],
    [_title, _category],
    [0, 1, 0, 2],
    true,
    {
        params ["_value"];
        pca_thermalStart = _value;
    }
] call CBA_fnc_addSetting;

[
    "pca_thermalWidth",
    "SLIDER",
    ["Thermal Width", "Sets maximum contrast of thermals, can make thermals unusable at lower settings."],
    [_title, _category],
    [0, 1, 1, 2],
    true,
    {
        params ["_value"];
        pca_thermalWidth = _value;
    }
] call CBA_fnc_addSetting;

private _category = "Shenanigans";

/*[ // broken by ace changes and medical uncon screen
    "pca_enableAFKToggle",
    "CHECKBOX",
    ["Enable AFK Toggle", "Players can toggle ACE's uncon flag to be drag/carryable. (May cause issues with actually going uncon)"],
    [_title, _category],
    false,
    true
] call CBA_fnc_addSetting;*/

[
    "pca_fingerRange",
    "SLIDER",
    [("Finger Jam Range"), "Range in meters where point will force a reload. 0 disables."],
    [_title, _category],
    [0, 50, 2, 1],
    true,
    {
        params ["_value"];
        pca_fingerRange = (parseNumber (_value toFixed 1));
    }
] call CBA_fnc_addSetting;

[
    "pca_allowJam",
    "CHECKBOX",
    ["Allow Jam", "Let other players force you to reload by pointing at you within the range defined above on the server."],
    [_title, _category],
    false,
    false
] call CBA_fnc_addSetting;