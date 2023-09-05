private _title = "PCA";

private _category = "Locality";
[
    "pca_resyncAction",
    "CHECKBOX",
    ["Enable Resync Action", "Map tab with a list of players and a button to fix if someone is desync'd for you."],
    [_title, _category],
    true,
    true,
    { },
    true
] call CBA_fnc_addSetting;

[
    "pca_zeusCompKilled",
    "CHECKBOX",
    ["Shift Zeus Comps", "Shift zeus local AI to the server on death, making them ragdoll again for some reason."],
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