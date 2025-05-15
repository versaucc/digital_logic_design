restart -force -nowave
delete wave *

add wave clk
add wave reset
add wave A
add wave B
add wave La0
add wave La1
add wave Lb0
add wave Lb1
add wave state

#Create a repeating clock of 1S - From lab5
force sim:/TrafficController/clk 0 0, 1 500ms -repeat 1000ms

force sim:/TrafficController/reset 1
run 1000ms
force sim:/TrafficController/reset 0 
run 1000ms

# Run 10 seconds. should go s1->s22->s3
force sim:/TrafficController/A 0 
force sim:/TrafficController/B 1 
run 10000ms 

# Run another 10s. Should go s4->s24->s0
force sim:/TrafficController/B 0 
force sim:/TrafficController/A 1
run 10000ms 

# Run another 10s. Shouldnt change states
run 1000ms

# Run 10s. should go s1->s22->s3
force sim:/TrafficController/A 0 
force sim:/TrafficController/B 1 
run 10000ms 