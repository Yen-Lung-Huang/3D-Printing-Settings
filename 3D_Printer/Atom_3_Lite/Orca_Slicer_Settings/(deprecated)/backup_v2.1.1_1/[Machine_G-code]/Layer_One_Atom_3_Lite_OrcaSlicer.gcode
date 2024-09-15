; Machine start G-code for Delta 3D printer with Bowden extruder

; MACHINE START CODE
M106 S255 ; Turn fan on full for cooling during heating
M104 S[first_layer_temperature] ; Set extruder temperature for first layer
M140 S[first_layer_bed_temperature] ; Set bed temperature for first layer
M109 S[first_layer_temperature] ; Wait for extruder to reach target temp
M190 S[first_layer_bed_temperature] ; Wait for bed to reach target temp
G21 ; Use metric units
G90 ; Use absolute positioning
M83 ; Set extruder to relative mode
G28 ; Home all axes
G92 E0 ; Reset extruder position

; Prime and clean nozzle
G1 Z10 F3000 ; Move up slightly to avoid bed
G0 X0 Y-130 Z1 ; Move to the front of the bed for priming
M106 S0 ; Turn off fan
G1 E10 F1800 ; Prime nozzle with fast extrusion (10mm filament)
G1 E12 F300 ; Slow extrusion for more precise priming
M400 ; Wait for moves to complete

; Prepare for printing
G1 X0 Y-130 Z1 F3000 ; Move nozzle close to the bed to start printing
G17; Select workspace plane XY
G2 X-78 Y-104 I0 J130 Z-0.05 E1 F{outer_wall_volumetric_speed/(0.3*0.5) * 60} ; move in a partial circle, gradually lowering Z and extruding 6mm
M400 ; Wait for move to complete
G1 F1800 ; set feed rate to 1800
M106 S65 ; set fan to low speed
G92 E0 ; Reset extruder position again
; END MACHINE START CODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Machine end G-code

; MACHINE END CODE
M104 S0 ; Turn off extruder heater
M140 S0 ; Turn off bed heater
M106 S255 ; Turn fan on full for cooling
G91 ; Use relative positioning
G1 E-2 F1800 ; Quick retract 2mm to release pressure
G1 E-8 F300 ; Slow retraction of 8mm to prevent oozing
M400 ; Wait for all movements to finish
G1 Z+20 F1200 ; Lift nozzle 20mm up slowly
G90 ; Return to absolute positioning
G1 X0 Y0 F5000 ; Move to home position quickly
M400 ; Wait for all movements to finish
M106 S0 ; Turn off fan
G28 ; Home all axes
M84 ; Disable stepper motors
M300 S40 P75 ; beep
G4 P25 ; wait
M300 S20000 P75 ; beep higher pitch
; END MACHINE END CODE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Before layer change G-code

; BEFORE_LAYER_CHANGE
G92 E0 ; Reset extruder position
; END BEFORE_LAYER_CHANGE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Layer change G-code

; AFTER_LAYER_CHANGE
;[layer_z]
; END AFTER_LAYER_CHANGE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Pause G-code

;PAUSE
M601
G91 ; relative positioning
G1 Z10 E-5 F1800 ; raise Z 10mm and retract 5mm
G90 ; absolute positioning
G1 X0 Y0 F5000 ; move to X=0 Y=0 quickly
; END PAUSE