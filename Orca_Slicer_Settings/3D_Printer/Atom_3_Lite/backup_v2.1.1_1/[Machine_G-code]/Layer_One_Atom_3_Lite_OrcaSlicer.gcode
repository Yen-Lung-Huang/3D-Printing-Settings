; Machine start G-code for Delta 3D printer with Bowden extruder

; MACHINE START CODE START
M106 S255 ; Turn fan on full for cooling during heating
M104 S[first_layer_temperature] ; Set extruder temperature for first layer
M140 S[first_layer_bed_temperature] ; Set bed temperature for first layer
M109 S[first_layer_temperature] ; Wait for extruder to reach target temp
M190 S[first_layer_bed_temperature] ; Wait for bed to reach target temp
G21 ; Use metric units
G90 ; Use absolute positioning
G28 ; Home all axes
G92 E0.0 ; Reset extruder position to 0

; Prime and clean nozzle
G1 Z10 F3000 ; Move up slightly to avoid bed
G0 X0 Y-130 Z1 ; Move to the front of the bed for priming
M106 S0 ; Turn off fan
G1 E30 F3000 ; Prime nozzle with fast extrusion (30mm filament)
G1 E30 F600 ; Slow extrusion for more precise priming
M400 ; Wait for extrusion to complete

; Prepare for printing
G1 X0 Y-130 Z0.2 F3000 ; Move nozzle close to the bed to start printing
G2 X-78 Y-104 I0 J130 Z-0.05 E0.0001 F{outer_wall_volumetric_speed/(0.3*0.5) * 60} ; move in a partial circle to (-78, 104), gradually lowering Z
G1 F3000 ; set feed rate back to F3000
G92 E0.0 ; Reset extruder position to 0
M106 S65 ; set fan to low speed

; Ready for first layer
; Put printing message on LCD screen
; MACHINE START CODE END






; Machine end G-code

; MACHINE END CODE START
M104 S0 ; Turn off extruder heater
M140 S0 ; Turn off bed heater
M106 S255 ; Turn fan on full for cooling
G91 ; Use relative positioning
G1 E-10 F4000 ; Retract 10mm of filament to release pressure
G1 E-5 F600 ; Slow retraction to prevent oozing
M400 ; Wait for all movements to finish
G4 P500 ; wait for 500 milliseconds (0.5 second)
G1 Z+10 F3000 ; Lift nozzle 10mm up
G90 ; Return to absolute positioning
G1 X0 Y0 ; Move to home position
M400 ; Wait for all movements to finish
M106 S0 ; Turn off fan
G28 ; Home all axes
M84 ; Disable stepper motors
M300 S20 P50 ; beep
G4 P25 ; wait
M300 S20000 P50 ; beep
; MACHINE END CODE END






; Before layer change G-code

;BEFORE_LAYER_CHANGE
;[layer_z]
G92 E0






; Layer change G-code

;AFTER_LAYER_CHANGE
;[layer_z]






; Pause G-code
M601
G91 ; relative positioning
G1 Z5 E-5 F3000 ; raise Z 5mm and retract 5mm
G90 ; absolute positioning
G1 X0 Y0 ; move to X=0 Y=0
