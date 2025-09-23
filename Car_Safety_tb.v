`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 03:04:43 PM
// Design Name: 
// Module Name: Car_Safety_tb
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


module Car_Safety_tb();
reg  SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV;
wire START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN;

Car_Safety uut(.SB(SB), .DOOR(DOOR), .KEY(KEY), .BRK(BRK), .PARK(PARK), .HOOD(HOOD), .BAT_OK(BAT_OK), .AIB_OK(AIB_OK), .TMP_OK(TMP_OK),
 .PASS_OCC(PASS_OCC), .SB_P(SB_P), .TRUNK(TRUNK), .PBRK(PBRK), .SRV(SRV), .START_PERMIT(START_PERMIT),
.CHIME(CHIME), .WARN_PRI2(WARN_PRI2), .WARN_PRI1(WARN_PRI1), .SEAT_WARN(SEAT_WARN), .DOOR_WARN(DOOR_WARN), .HOOD_WARN(HOOD_WARN), 
.TRUNK_WARN(TRUNK_WARN), .BAT_WARN(BAT_WARN), .AIRBAG_WARN(AIRBAG_WARN), .TEMP_WARN(TEMP_WARN));

initial begin
    #10 SB = 1; DOOR = 1; KEY = 1; BRK = 1; PARK = 1; HOOD = 1; BAT_OK = 1; AIB_OK = 1; TMP_OK = 1; PASS_OCC = 1; SB_P = 1; TRUNK = 1; 
    PBRK = 1; SRV = 0;
    
    #10 SB = 0; DOOR = 0; KEY = 1; BRK = 0; PARK = 0; HOOD = 0; BAT_OK = 0; AIB_OK = 0; TMP_OK = 0; PASS_OCC = 0; SB_P = 0; TRUNK = 0; 
    PBRK = 0; SRV = 1;
    
     #10 SB = 1; DOOR = 0; KEY = 1; BRK = 1; PARK = 1; HOOD = 1; BAT_OK = 1; AIB_OK = 1; TMP_OK = 1; PASS_OCC = 1; SB_P = 1; TRUNK = 0; 
    PBRK = 1; SRV = 0;
    
    #10 SB = 1; DOOR = 1; KEY = 1; BRK = 1; PARK = 1; HOOD = 1; BAT_OK = 0; AIB_OK = 0; TMP_OK = 1; PASS_OCC = 1; SB_P = 1; TRUNK = 1; 
    PBRK = 1; SRV = 0;
    
    #10 $stop;
end
    
endmodule
