_droidArray = "getNumber (_x >> 'type') == 2 && getNumber (_x >> 'scope') == 2" configClasses (configFile >> "cfgVehicles");
_allowedDroids = [];
_whitelistedDroids = 
[
	"JLTS_Droid_B1_Training_Commander",
	"JLTS_Droid_B1_Security",
	"JLTS_Droid_B1_Training_AR",
	"JLTS_Droid_B1_Training_E5",
	"CWDependencies_Mando_Droid",
	"k_CIS_Droideka",
	"CW_Ifrit_Mando_HMG",
	"CW_Ifrit_Mando",
	"ls_heli_laatle_transportGunship",
	"3as_arc_170_razor",
	"3as_LAAT_Mk2",
	"3as_LAAT_Mk1",
	"ls_ground_aat_black",
	"3as_ParticleCannon",
	"3as_FlakCannon",
	"3AS_FieldCannon"
];

partsRequired = 0;
picturePath = "";
droidDescription = "";

{
	_droid = configName _x;
	_allowedDroids pushBack _droid;
} forEach _droidArray;

{
	_droidName = getText (configFile >> "cfgVehicles" >> _x >> "displayName");
	lbAdd [1500, _droidName];
	lbSetData [1500, _forEachIndex, _x];
} forEach _whitelistedDroids;

while {true} do 
{
	_index = lbCurSel 1500;
	_droidType = lbData [1500, _index];
	//hintSilent str _droidType;
	switch (_droidType) do
	{
		case "JLTS_Droid_B1_Training_Commander": {partsRequired = 3, droidDescription = "standard B1 Droid, programmed as a leader."};
		case "JLTS_Droid_B1_Security": {partsRequired = 5, droidDescription = "These security droids are pog!"};
		case "JLTS_Droid_B1_Training_AR": {partsRequired = 4, droidDescription = "standard B1 Droid, programmed to use a heavy gun."};
		case "JLTS_Droid_B1_Training_E5": {partsRequired = 2, droidDescription = "This is the standard for a B1 Droid. It works!"};
		case "CWDependencies_Mando_Droid": {partsRequired = 3, droidDescription = "Deadly B1 Droid, programmed to fight"};
		case "k_CIS_Droideka": {moneyRequired = 3000, partsRequired = 0, droidDescription = "ROLY POLY"};
		case "CW_Ifrit_Mando_HMG": {moneyRequired = 1500, droidDescription = "Is armored, gun go brrt."};
		case "CW_Ifrit_Mando": {moneyRequired = 500, droidDescription = "Is armored, has no gun."};
		case "ls_heli_laatle_transportGunship": {moneyRequired = 25000, partsRequired = 0, droidDescription = "Scrapped by the republic, it's now used to kill them!"};
		case "3as_arc_170_razor": {moneyRequired = 75000, partsRequired = 0, droidDescription = "BRRRT, and the clones are gone"};
		case "3as_LAAT_Mk2": {moneyRequired = 50000, partsRequired = 0, droidDescription = "Do Not Garage or Weapons are Removed!"};
		case "3as_LAAT_Mk1": {moneyRequired = 60000, partsRequired = 0, droidDescription = "Do Not Garage or Weapons are Removed!"};
		// case "": {};
		case "ls_ground_aat_black": {moneyRequired = 40000, partsRequired = 0, droidDescription = "Didn't yoda fuck 3 of these up at once?"};
		case "3as_ParticleCannon": {moneyRequired = 25000, partsRequired = 0, droidDescription = "what does this even do"};
		case "3as_FlakCannon": {moneyRequired = 25000, partsRequired = 0, droidDescription = "starfighter? where?"};
		case "3AS_FieldCannon": {moneyRequired = 30000, partsRequired = 0, droidDescription = "try not to kill the cows eating grass"};
	};
	vehicleArray = ["CW_Ifrit_Mando_HMG", "CW_Ifrit_Mando", "k_CIS_Droideka", "ls_heli_laatle_transportGunship", "3as_arc_170_razor", "3as_LAAT_Mk1", "3as_LAAT_Mk2", "ls_ground_aat_black", "3AS_FieldCannon", "3as_FlakCannon", "3as_ParticleCannon"];
	_picture = getText (configFile >> "cfgVehicles" >> _droidType >> "editorPreview");
	_description = getText (configFile >> "cfgVehicles" >> _droidType >> "role");
	ctrlSetText [1200, _picture];
	if !(_droidType in vehicleArray) then {
		ctrlSetText [1998, str partsRequired];
		ctrlSetText [1003, "Droid Parts Required:"];
	} else {
		ctrlSetText [1003, "Money Required:"];
		ctrlSetText [1998, str moneyRequired];
	};
	ctrlSetText [1999, droidDescription];
	ctrlSetText [1001, _description];
	sleep 0.1;
};
