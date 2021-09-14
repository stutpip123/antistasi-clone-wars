//if (isNil player getVariable ["tierWar",1]) then {
	//occfor = 5;
//};


occfor = player getVariable ["tierWar", 1];

switch (true) do {
case (occfor >= 7): {
	deleteVehicle helmetmain;
	helmetmain = selectRandom ["Headgear_mandalorian_nightowl_helmet","Headgear_mandalorian_dinDjarinBeskar_helmet"] createVehicle position player;
	helmetmain setPos (helmetocc modelToWorld [0,0,0]);
	helmetmain setDamage 1;
	[helmetmain, vehicleBox] call BIS_fnc_attachToRelative;
	
	deleteVehicle helmetloser;
	helmetloser = selectRandom ["Headgear_cis_oomOfficer_helmet","Headgear_cis_b1Saboteur_helmet"] createVehicle position player;
	helmetloser setPos (helmetlos modelToWorld [0,0,0]);
	helmetloser setDamage 1;
	[helmetloser, vehicleBox] call BIS_fnc_attachToRelative;
	
	deleteVehicle helmetsecondary;
	helmetsecondary = selectRandom ["Headgear_sob_phase2SpecOp_helmet","Headgear_gar_arc_helmet", "Headgear_sob_commando_helmet"] createVehicle position player;
	helmetsecondary setPos (helmetsec modelToWorld [0,0,0]);
	helmetsecondary setDamage 1;
	[helmetsecondary, vehicleBox] call BIS_fnc_attachToRelative;
	
	holoflag setPos getMarkerPos "NATO_Carrier";
	deleteVehicle holoflag;
	holoflag = "ls_commandPost_mandalorian_green" createVehicle position player;
	holoflag setPos (holotable_flag modelToWorld [0,0,0]);
	[holoflag, vehicleBox] call BIS_fnc_attachToRelative;
};
case (occfor == 5): {
	deleteVehicle helmetmain;
	helmetmain = selectRandom ["Headgear_cis_oomOfficer_helmet","Headgear_cis_oomGeonosis_helmet"] createVehicle position player;
	helmetmain setPos (helmetocc modelToWorld [0,0,0]);
	helmetmain setDamage 1;
	[helmetmain, vehicleBox] call BIS_fnc_attachToRelative;
	deleteVehicle helmetloser;
	
	helmetloser = selectRandom ["Headgear_mandalorian_nightowl_helmet","Headgear_mandalorian_executioner_helmet"] createVehicle position player;
	helmetloser setPos (helmetlos modelToWorld [0,0,0]);
	helmetloser setDamage 1;
	[helmetloser, vehicleBox] call BIS_fnc_attachToRelative;
	deleteVehicle helmetsecondary;
	
	helmetsecondary = selectRandom ["Headgear_gar_atrtDriver_helmet","Headgear_gar_phase2Pilot_helmet", "Headgear_gar_desert_helmet"] createVehicle position player;
	helmetsecondary setPos (helmetsec modelToWorld [0,0,0]);
	helmetsecondary setDamage 1;
	[helmetsecondary, vehicleBox] call BIS_fnc_attachToRelative;
	
	holoflag setPos getMarkerPos "NATO_Carrier";
	deleteVehicle holoflag;
	holoflag = "ls_commandPost_cis_red" createVehicle position player;
	holoflag setPos (holotable_flag modelToWorld [0,0,0]);
	[holoflag, vehicleBox] call BIS_fnc_attachToRelative;
};
case (occfor <= 3): {
	deleteVehicle helmetmain;
	helmetmain = selectRandom ["Headgear_gar_barc_helmet","Headgear_gar_phase2_helmet", "Headgear_gar_scout_helmet"] createVehicle position player;
	helmetmain setPos (helmetocc modelToWorld [0,0,0]);
	helmetmain setDamage 1;
	[helmetmain, vehicleBox] call BIS_fnc_attachToRelative;
	deleteVehicle helmetloser;
	
	helmetloser = selectRandom ["Headgear_cis_oomOfficer_helmet","Headgear_cis_b1_helmet"] createVehicle position player;
	helmetloser setPos (helmetlos modelToWorld [0,0,0]);
	helmetloser setDamage 1;
	[helmetloser, vehicleBox] call BIS_fnc_attachToRelative;
	deleteVehicle helmetsecondary;
	
	helmetsecondary = selectRandom ["Headgear_mandalorian_nightowl_helmet","Headgear_mandalorian_traditional_helmet"] createVehicle position player;
	helmetsecondary setPos (helmetsec modelToWorld [0,0,0]);
	helmetsecondary setDamage 1;
	[helmetsecondary, vehicleBox] call BIS_fnc_attachToRelative;

	holoflag setPos getMarkerPos "NATO_Carrier";
	deleteVehicle holoflag;
	holoflag = "ls_commandPost_republic_blue" createVehicle position player;
	holoflag setPos (holotable_flag modelToWorld [0,0,0]);
	[holoflag, vehicleBox] call BIS_fnc_attachToRelative;	
};
};