; MACHINE START CODE
M106 S200 ; turn on fan
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
G21 ; metric values
G90 ; use absolute coordinates
G28 ; home all
G4 P500 ; wait for 500 milliseconds (0.5 second)
G92 E0.0 ; zero the extruded length

; intro line
G1 F3000 ; set feed rate to 3000
G1 X0 Y-100 Z1 ; move to position with previously set speed (F3000)
G1 F100 E20 ; extrude 20mm of filament (to compensate for the 20mm retraction at the end)
G1 F300 E20 ; change to slower speed for precise extrusion and extrude 20mm of filament
G1 F3000 ; set feed rate back to 3000
G1 X-20 Y-80 Z-0.05 ; move to position with speed F3000, scrape off any excess filament
G92 E0.0 ; zero the extruded length again

; Put printing message on LCD screen
; MACHINE START CODE
















; MACHINE END CODE
M104 S0 ; extruder heater off
G91 ; relative positioning
G1 E-15 F300 ; retract the filament by 15mm to prevent clogging near the nozzle
G1 F3000 ; set speed to 3000
G1 Z+10 ; move Z up by 10mm to avoid hitting the print
G90 ; absolute positioning
G1 X0 Y0 ; move X/Y to home position
M106 S25 ; turn on fan
M140 S50 ; set heated bed to 50C
M190 R50 ; wait until bed temperature drops to 50C
M140 S0 ; heated bed heater off
M106 S0 ; turn off fan
G28 ; home all
M84 ; steppers off
M300 S1000 P100 ; beep to indicate end of print
G4 P100 ; wait for 100 milliseconds (0.1 second)
M300 S1000 P100 ; beep to indicate end of print
; MACHINE END CODE
