private _title = "PCA";

private _category = "Suture";

[
    "pca_suture_consumption",
    "CHECKBOX",
    ["Suture Consumed per Wound Type", "Whether Sutures are consumed per wound type (ACE behaviour), per limb if unchecked.\nMedic or patient having a Surgical Kit will prevent all consumption,\nunless ACE consumption is set to Kit/Suture."],
    [_title, _category],
    true,
    true
] call CBA_fnc_addSetting;

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