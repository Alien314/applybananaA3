class CfgPatches {
  class pca_cup_vicfix {
    ammo[] = {};
    magazines[] = {};
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.1;
    author = "Alien314";
    name = "PCA Cup Vic Fix";
    requiredAddons[]=
        {
            "CUP_AirVehicles_LoadOrder",
            "CUP_TrackedVehicles_LoadOrder",
            "CUP_WaterVehicles_LoadOrder",
            "CUP_WheeledVehicles_LoadOrder",
			"hlcweapons_scar"
        };
    };
};

class CfgVehicles {
    class Car;
	class Car_F : Car {
		class NewTurret;
	};

	class Wheeld_APC_F : Car_F {
		class NewTurret : NewTurret {};
		class Turrets {
			class MainTurret : NewTurret {};
		};
	};

    class Tank;
	class Tank_F : Tank {
		class NewTurret;
		class Turrets {
			class MainTurret : NewTurret {};
		};
	};
	class APC_Tracked_02_base_F : Tank_F {
		class NewTurret;
	};

	class CUP_BMP1_base : APC_Tracked_02_base_F {
		class NewTurret : NewTurret {};
		class Turrets {
			class MainTurret : NewTurret {};
		};
	};

// guns
	class CUP_BTR90_Base : Wheeld_APC_F {
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				weapons[] = {"CUP_Vacannon_2A42_BMP2","CUP_Vhmg_PKT_veh_Noeject","CUP_Vmlauncher_AT5_single_veh","CUP_Vgmg_AGS17_veh"};
				magazines[] = {"CUP_340Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M","CUP_160Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M","CUP_400Rnd_30mm_AGS17_M","CUP_8Rnd_AT5_BMP2_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M"};
			};
		};
	};

	class CUP_GAZ_Vodnik_Base : Wheeld_APC_F {
		class Turrets : Turrets {
			class MainTurret : NewTurret {
				gunnerAction = "CUP_UAZ_Gunner01";
				gunnerInAction = "CUP_UAZ_Gunner01";
			};
		};
	};
	class CUP_GAZ_Vodnik_AGS_Base : CUP_GAZ_Vodnik_Base {
		class Turrets : Turrets {
			class MainTurret : NewTurret {
				gunnerAction = "CUP_UAZ_Gunner01";
				gunnerInAction = "CUP_UAZ_Gunner01";
			};
		};
	};
	class CUP_GAZ_Vodnik_BPPU_Base : CUP_GAZ_Vodnik_Base { // vodnik
		class Turrets : Turrets {
			class MainTurret : NewTurret {
				gunnerAction = "CUP_BTR_Gunner_out";
				gunnerInAction = "CUP_BTR_Gunner";
				magazines[] = {"CUP_180Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M","CUP_120Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","SmokeLauncherMag"};
				weapons[] = {"CUP_Vacannon_2A72_BPPU","CUP_Vhmg_PKT_veh_Noeject","SmokeLauncher"};
			};
		};
	};
	class CUP_BMP2_base : CUP_BMP1_base { // bmp2
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				weapons[] = {"CUP_Vacannon_2A42_BMP2","CUP_Vhmg_PKT_veh_Noeject","CUP_Vmlauncher_AT5_single_veh"};
				magazines[] = {"CUP_340Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M","CUP_160Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M","CUP_8Rnd_AT5_BMP2_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M","CUP_250Rnd_TE1_Green_Tracer_762x54_PKT_M"};
			};
		};
	};

	class CUP_M60A3_Base : Tank_F {
		class CommanderOptics;
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				weapons[] = {"CUP_Vcannon_M68_veh","CUP_Vlmg_M240_veh"};
				magazines[] = {"CUP_40Rnd_TE1_Red_Tracer_105mmSABOT_M68_Cannon_M","CUP_23Rnd_TE1_Red_Tracer_105mmHEAT_M68_Cannon_M","CUP_1200Rnd_TE4_Red_Tracer_762x51_M240_M","CUP_1200Rnd_TE4_Red_Tracer_762x51_M240_M","CUP_1200Rnd_TE4_Red_Tracer_762x51_M240_M"};
				class Turrets : Turrets {
					class CommanderOptics : CommanderOptics {
						gunnerInAction = "GetInHigh";
						gunnerAction = "GetInLow";
					};
				};
			};
		};
	};

	class CUP_LAV25_Base : Wheeld_APC_F {
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				weapons[] = {"CUP_Vacannon_M242_veh_LAV25","CUP_Vlmg_M240_veh"};
				magazines[] = {"CUP_60Rnd_TE1_Red_Tracer_25mm_M242_APDS","CUP_60Rnd_TE1_Red_Tracer_25mm_M242_APDS","CUP_60Rnd_TE1_Red_Tracer_25mm_M242_APDS","CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE","CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE","CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE","CUP_400Rnd_TE4_Red_Tracer_762x51_M240_M","CUP_400Rnd_TE4_Red_Tracer_762x51_M240_M","CUP_400Rnd_TE4_Red_Tracer_762x51_M240_M"};
			};
		};
	};

// seats

	class CUP_FV510_Base : Tank_F {
		driverAction = "Driver_MBT_03_cannon_F_out";
		driverInAction = "Driver_MBT_01_cannon_F_in";
		cargoAction[] = {"passenger_flatground_leanleft","passenger_flatground_generic01","passenger_flatground_generic02","passenger_flatground_generic03","passenger_flatground_generic04","passenger_flatground_generic05"};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
	};
	class CUP_MCV80_Base : Tank_F {
		driverAction = "Driver_MBT_03_cannon_F_out";
		driverInAction = "Driver_MBT_01_cannon_F_in";
		cargoAction[] = {"passenger_flatground_leanleft","passenger_flatground_generic01","passenger_flatground_generic02","passenger_flatground_generic03","passenger_flatground_generic04","passenger_flatground_generic05"};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
	};
	class CUP_FV432_Bulldog_Base : Tank_F {
		class NewTurret;
		class Turrets;
		cargoAction[] = {"passenger_flatground_leanleft","passenger_flatground_generic01","passenger_flatground_generic02","passenger_flatground_generic03","passenger_flatground_generic04","passenger_flatground_generic05"};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
	};
	class CUP_B_FV432_Bulldog_GB_D : CUP_FV432_Bulldog_Base {
		class NewTurret;
		class Turrets {
			class MainTurret : NewTurret {
				gunnerInAction = "gunner_apctracked3_in";
				gunnerAction = "gunner_apctracked3_out";
			};
		};
		cargoAction[] = {"passenger_flatground_leanleft","passenger_flatground_generic01","passenger_flatground_generic02","passenger_flatground_generic03","passenger_flatground_generic04","passenger_flatground_generic05"};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
	};
	/*class CUP_B_FV432 : CUP_B_FV432_Bulldog_GB_D {
		class Turrets {
			class MainTurret;
			class Commander : MainTurret {
				weapons[] = {};
				magazines[] = {};
			};
		};
	};
	class CUP_B_FV432_GB_GPMG : CUP_B_FV432 {
	};
	// Mortar sight doesn't work, no clue how to fix that
	class CUP_B_FV432_Mortar : CUP_B_FV432_GB_GPMG {
		class Turrets {
			class MainTurret;
			class MortarTurret : MainTurret {
				gunnerAction = "GetInLow";
				gunnerInAction = "GetOutLow";
			};
		};
	};*/

	/*class Heli_Light_02_base_F;
	class RHS_Mi8_base : Heli_Light_02_base_F { // GPS not usable even with GPS item
		enableGPS = 0;
		class Components {
			class VehicleSystemsDisplayManagerComponentLeft {
				class Components {
					class  {};
				};
			};
			class VehicleSystemsDisplayManagerComponentLeft {
				class Components {
					class  {};
				};
			};
		};
	};
	class RHS_mi24G // no nvg mode on gunner turret

*/
};

class CfgWeapons {
	class UGL_F;
	class Rifle_Base_F;
	class hlc_scarl_base : Rifle_Base_F {
		class hlc_GL_SCAR_AGC : UGL_F { reloadAction = "NIA_GestureReloadM320_Mk17"; };
	};

	/*/ class CannonCore;

    class CUP_Vacannon_M242_veh : CannonCore {
		muzzles[] = {"this"};
	};

    class CUP_Vacannon_2A42_veh : CannonCore {
		magazines[] = {"CUP_250Rnd_TE1_Green_Tracer_30mmHE_2A42_M","CUP_250Rnd_TE1_Green_Tracer_30mmAP_2A42_M"};
		muzzles[] = {"this"};
	};///
	class Mode_FullAuto;
	class CUP_Vlmg_M240_veh;
	class CUP_Vlmg_L7A2_veh : CUP_Vlmg_M240_veh {
		class manual : Mode_FullAuto { reloadTime = 0.25; };
	};//*/
};