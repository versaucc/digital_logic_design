


 

vsim work.FourBitAdder
add wave * 

run -all
force Cin 0

# Force all combinations of A and B and run the simulation for each
force A 0000
force B 0000
run 10 ns

force A 0001
force B 0001
run 10 ns

force A 0010
force B 0010
run 10 ns

force A 1010
force B 0101
run 10 ns

force A 1000
force B 0000
run 10 ns

force A 0101
force B 1100
run 10 ns

force A 1111
force B 0110
run 10 ns

force A 0000
force B 0111
run 10 ns

force A 0000
force B 1000
run 10 ns

force A 0110
force B 1001
run 10 ns

force A 0000
force B 1010
run 10 ns

force A 0111
force B 1111
run 10 ns

force A 1111
force B 1111
run 10 ns


