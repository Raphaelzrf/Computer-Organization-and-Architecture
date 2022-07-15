onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib instrcution_memory_opt

do {wave.do}

view wave
view structure
view signals

do {instrcution_memory.udo}

run -all

quit -force
