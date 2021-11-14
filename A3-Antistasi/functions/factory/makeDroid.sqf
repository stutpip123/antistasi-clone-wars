hint "DEBUG: Working";
_index = lbCurSel 1500;
_droidType = lbData [1500, _index];
// hintSilent str _droidType;
resourcesFIADroid = server getVariable ["resourcesFIA", 1000];
_playerRole = roleDescription player;
switch (_droidType) do
{
	case "JLTS_Droid_B1_Training_Commander": {partsRequired = 3, droidDescription = "standard B1 Droid, programmed as a leader."};
	case "JLTS_Droid_B1_Security": {partsRequired = 5, droidDescription = "These security droids are pog!"};
	case "JLTS_Droid_B1_Training_AR": {partsRequired = 4, droidDescription = "standard B1 Droid, programmed to use a heavy gun."};
	case "JLTS_Droid_B1_Training_E5": {partsRequired = 2, droidDescription = "This is the standard for a B1 Droid. It works!"};
	case "CWDependencies_Mando_Droid": {partsRequired = 3, droidDescription = "Deadly B1 Droid, programmed to fight"};
	case "k_CIS_Droideka": {moneyRequired = 3000, partsRequired = 0; droidDescription = "ROLY POLY (for legal reasons, this statement is false)"};
	case "CW_Ifrit_Mando_HMG": {moneyRequired = 1500, partsRequired = 0; droidDescription = "Is armored, gun go brrt."};
	case "CW_Ifrit_Mando": {moneyRequired = 500, partsRequired = 0; droidDescription = "Is armored, has no gun."};
	case "ls_heli_laatle_transportGunship": {moneyRequired = 25000, partsRequired = 0, droidDescription = "Scrapped by the republic, it's now used to kill them!"};
	case "3as_arc_170_razor": {moneyRequired = 75000, partsRequired = 0, droidDescription = "BRRRT, and the clones are gone"};
	case "3as_LAAT_Mk2": {moneyRequired = 50000, partsRequired = 0, droidDescription = "Do Not Garage or Weapons are Removed!"};
	case "3as_LAAT_Mk1": {moneyRequired = 60000, partsRequired = 0, droidDescription = "Do Not Garage or Weapons are Removed!"};
	// case "": {};
	case "ls_ground_aat_black": {moneyRequired = 40000, partsRequired = 0, droidDescription = "Didn't yoda fuck 3 of these up at once?"};
	case "3as_ParticleCannon": {moneyRequired = 25000, partsRequired = 0, droidDescription = "what does this even do"};
	case "3AS_FieldCannon": {moneyRequired = 30000, partsRequired = 0, droidDescription = "try not to kill the cows eating grass"};
};

_unitArray = 
[
	"JLTS_Droid_B1_Training_Commander",
	"JLTS_Droid_B1_Security",
	"JLTS_Droid_B1_Training_AR",
	"JLTS_Droid_B1_Training_E5",
	"CWDependencies_Mando_Droid"
];
_vehicleArray = 
[
	"k_CIS_Droideka",
	"CW_Ifrit_Mando_HMG",
	"CW_Ifrit_Mando",
	"ls_heli_laatle_transportGunship",
	"3as_arc_170_razor",
	"3as_LAAT_Mk2",
	"3as_LAAT_Mk1",
	"ls_ground_aat_black",
	"3as_ParticleCannon",
	"3AS_FieldCannon"
];


if (player == player) then {
	_money = player getVariable "moneyX";
	_mags = {_x == "CW_DroidParts"} count magazines player;
	if (_mags >= partsRequired) then {
	{
		if (_x == "CW_DroidParts" && {_x == "CW_DroidParts"} count magazines player != _mags - partsRequired) then {
			player removeMagazine _x;
		};
		} forEach magazines player; 
		_pos = [player, 1, 30, 3, 0, 20, 0] call BIS_fnc_findSafePos;
		if (_droidType in _unitArray) then {
			_droidType createUnit [position player, group player, "thisUnit = this"];
			thisUnit setPos _pos;
		} else {
			if (player == theBoss && resourcesFIADroid >= moneyRequired) then {
				_v = _droidType createVehicle position player;
				_v setPos _pos;
				server setVariable ["resourcesFIA",resourcesFIADroid - moneyRequired ,true];
				if (_droidType == "k_CIS_Droideka") then {
					"I_support_AMG_F" createUnit [position player, group player, "thisUnit = this"];
					thisUnit moveInAny _v;
				};
			} else {
				if (player != theBoss && _money >= moneyRequired) then {
					_v = _droidType createVehicle position player;
					_v setPos _pos;
					player setVariable ["moneyX", _money - moneyRequired, true];
					if (_droidType == "k_CIS_Droideka") then {
						"I_support_AMG_F" createUnit [position player, group player, "thisUnit = this"];
						thisUnit moveInAny _v;
					};
				};
			};
		};
	};
	if (player != theBoss) then {
		titleText ["You can not buy this, you're not the commander role.", "PLAIN"];
	};
} else {
	titleText ["You don't have enough droid scrap.", "PLAIN"];
};