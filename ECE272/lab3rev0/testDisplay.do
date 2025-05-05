vsim -gui work.SevenSegmentDisplay
# Start simulation from beginning

# Add all waves to waveform diagram
add wave *

# Test case 0
force {digit[0]} 0
force {digit[1]} 0
force {digit[2]} 0
force {digit[3]} 0
run 10

# Test case 1
force {digit[0]} 0
force {digit[1]} 0
force {digit[2]} 0
force {digit[3]} 1
run 10

# Test case 2
force {digit[0]} 0
force {digit[1]} 0
force {digit[2]} 1
force {digit[3]} 0
run 10

# Test case 3
force {digit[0]} 0
force {digit[1]} 0
force {digit[2]} 1
force {digit[3]} 1
run 10

# Test case 4
force {digit[0]} 0
force {digit[1]} 1
force {digit[2]} 0
force {digit[3]} 0
run 10

# Test case 5
force {digit[0]} 0
force {digit[1]} 1
force {digit[2]} 0
force {digit[3]} 1
run 10

# Test case 6
force {digit[0]} 0
force {digit[1]} 1
force {digit[2]} 1
force {digit[3]} 0
run 10

# Test case 7
force {digit[0]} 0
force {digit[1]} 1
force {digit[2]} 1
force {digit[3]} 1
run 10

# Test case 8
force {digit[0]} 1
force {digit[1]} 0
force {digit[2]} 0
force {digit[3]} 0
run 10

# Test case 9
force {digit[0]} 1
force {digit[1]} 0
force {digit[2]} 0
force {digit[3]} 1
run 10

# Test case A
force {digit[0]} 1
force {digit[1]} 0
force {digit[2]} 1
force {digit[3]} 0
run 10

# Test case b
force {digit[0]} 1
force {digit[1]} 0
force {digit[2]} 1
force {digit[3]} 1
run 10

# Test case c
force {digit[0]} 1
force {digit[1]} 1
force {digit[2]} 0
force {digit[3]} 0
run 10

# Test case d
force {digit[0]} 1
force {digit[1]} 1
force {digit[2]} 0
force {digit[3]} 1
run 10

# Test case E
force {digit[0]} 1
force {digit[1]} 1
force {digit[2]} 1
force {digit[3]} 0
run 10

# Test case f
force {digit[0]} 1
force {digit[1]} 1
force {digit[2]} 1
force {digit[3]} 1
run 10

# End Simulation