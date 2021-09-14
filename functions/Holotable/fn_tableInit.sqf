vehicleBoxActions addAction ["Refresh Holo Table","functions\holotable\fn_refreshTable.sqf"];

vehicleBoxActions addAction ["Change Marker Location",{openMap true;onMapSingleClick """marker_0"" setMarkerPos _pos; onMapSingleClick ''; true;"}];

vehicleBoxActions addAction ["Swap Map - Location", {[vehicleBox] remoteExec ["sebs_briefing_table_fnc_clearTable", 0, vehicleBox];
[vehicleBox, "marker_0", 20, 1, true, true, 0.7] remoteExec ["sebs_briefing_table_fnc_createTable", 0, vehicleBox];}];

vehicleBoxActions addAction ["Clear Table - Map", {[vehicleBox] remoteExec ["sebs_briefing_table_fnc_clearTable", 0, vehicleBox];}];

vehicleBoxActions addAction ["Clear Table - Helmets","functions\holotable\fn_wipeTable.sqf"]