vsim -gui work.FourBitAdder
add wave * 
force A 0000
force B 0000
run 10 

force A 0000 
force B 0001 
run 10 

force A 0000 
force B 0011 
run 10 

force A 0000 
force B 0111 
run 10  

force A 0000 
force B 1111 
run 10  

force A 0001 
force B 0000
run 10 

force A 0011
force B 0000
run 10

force A 0110
force B 1001
run 10