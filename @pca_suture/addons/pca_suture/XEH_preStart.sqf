#include "XEH_PREP.hpp"

if (pca_suture_medicNotif) then {
	private _h = (profilenamespace getVariable ['IGUI_pca_suture_medicNotification_H', nil]);
	if (isNil "_h" || {_h < 0.05 || {(profilenamespace getVariable ['IGUI_pca_suture_medicNotification_H', 0]) < 0.05}}) then {
		profilenamespace setVariable ['IGUI_pca_suture_medicNotification_H', (safeZoneW / 15)];
		profilenamespace setVariable ['IGUI_pca_suture_medicNotification_W', ((safeZoneW / 15)/1.2)];
	};
};