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
            "CUP_WheeledVehicles_LoadOrder"
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

    class Tank_F;
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
};
/*/ 
class CfgWeapons {
	class CannonCore;

    class CUP_Vacannon_M242_veh : CannonCore {
		muzzles[] = {"this"};
	};

    class CUP_Vacannon_2A42_veh : CannonCore {
		magazines[] = {"CUP_250Rnd_TE1_Green_Tracer_30mmHE_2A42_M","CUP_250Rnd_TE1_Green_Tracer_30mmAP_2A42_M"};
		muzzles[] = {"this"};
	};
};//*/