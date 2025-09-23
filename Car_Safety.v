`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 01:40:37 PM
// Design Name: 
// Module Name: Car_Safety
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Car_Safety(SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK,
 TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV, START_PERMIT, CHIME, 
 WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN,
 BAT_WARN, AIRBAG_WARN, TEMP_WARN);
 
 input SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK,
 TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV;
 
 output START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN,
 BAT_WARN, AIRBAG_WARN, TEMP_WARN;
 
 // Warnings 
 assign TEMP_WARN = ~TMP_OK;
 assign AIRBAG_WARN = ~AIB_OK;
 assign BAT_WARN = ~BAT_OK;
 assign TRUNK_WARN = ~TRUNK;
 assign HOOD_WARN = ~HOOD;
 assign DOOR_WARN = ~DOOR;
 assign SEAT_WARN = KEY &((PASS_OCC & ~SB_P) | ~SB);
 
 // Priority Warnings
 assign WARN_PRI2 = (SEAT_WARN | DOOR_WARN | HOOD_WARN | TRUNK_WARN) & ~SRV;
 assign WARN_PRI1 = (BAT_WARN | AIRBAG_WARN | TEMP_WARN) & ~SRV;
 
 // Whenever there's a warning, Chime will sound
 assign CHIME = WARN_PRI1 | WARN_PRI2;
 
 
 // Decides if Engine may be Started
 assign START_PERMIT = (BAT_OK & BRK & PBRK & KEY) | (KEY & SRV);
 
endmodule
