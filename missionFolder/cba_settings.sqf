private _header = 'Mission Settings';

private _category = 'Apply Banana';
[
    'ab_enableBanana',
    'CHECKBOX',
    ['Enable Banana','Whether to add the action allowing bananas to act as stamina boosters.'],
    [_header,_category],
    true,
    true
] call CBA_fnc_addSetting;

[
    'ab_stamRegenDuration',
    'SLIDER',
    ['Banana stamina regen duration','How long the stamina regen effect from banana should last.'],
    [_header,_category],
    [1,600,30,0],
    true,
    {
        params ["_value"];
        ab_stamRegenDuration = round _value;
    }
] call CBA_fnc_addSetting;

[
    'ab_stamRegenAmount',
    'SLIDER',
    ['Total stamina restoration multiplier','Multiplier for how much of a full stamina bar to regen over the duration.'],
    [_header,_category],
    [0,10,1,0,true],
    true
] call CBA_fnc_addSetting;

[
    'ab_regenAfterFull',
    'CHECKBOX',
    ['Continue effect after full','Whether the effect should continue after stamina is full.'],
    [_header,_category],
    false,
    true
] call CBA_fnc_addSetting;