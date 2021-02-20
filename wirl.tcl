#------------------------------------------------------- 
# This ns script has been created by the nam editor.
# If you edit it manually, the nam editor might not
# be able to open it properly in the future.
#
# EDITING BY HAND IS AT YOUR OWN RISK!
#------------------------------------------------------- 
# Create a new simulator object.
set ns [new Simulator]
# Create a nam trace datafile.
set namfile [open /root/Desktop/wirl.nam w]
$ns namtrace-all $namfile

# Create wired nodes.

# ----- Setup wireless environment. ----
set wireless_tracefile [open /root/Desktop/wirl.trace w]
set topography [new Topography]
$ns trace-all $wireless_tracefile
$ns namtrace-all-wireless $namfile 613.781250 627.187500
$topography load_flatgrid 613.781250 627.187500





set opt(ant)            Antenna/OmniAntenna
set opt(netif)		Phy/WirelessPhy
# unity gain, omni-directional antennas
# set up the antennas to be centered in the node and 1.5 meters above it
Antenna/OmniAntenna set X_ 0
Antenna/OmniAntenna set Y_ 0
Antenna/OmniAntenna set Z_ 1.5
Antenna/OmniAntenna set Gt_ 1.0
Antenna/OmniAntenna set Gr_ 1.0
# Initialize the SharedMedia interface with parameters to make
# it work like the 914MHz Lucent WaveLAN DSSS radio interface
Phy/WirelessPhy set CPThresh_ 10.0
Phy/WirelessPhy set CSThresh_ 1.559e-11
Phy/WirelessPhy set RXThresh_ 3.652e-10
Phy/WirelessPhy set Rb_ 2*1e6
Phy/WirelessPhy set Pt_ 0.2818
Phy/WirelessPhy set freq_ 914e+6 
Phy/WirelessPhy set L_ 1.0



#
# Create God
#
set god_ [create-god 3]
#global node setting
$ns node-config  -adhocRouting DSR \
                 -llType LL \
                 -macType Mac/802_11 \
                 -ifqType Queue/DropTail/PriQueue \
                 -ifqLen 50 \
                 -antType $opt(ant) \
                 -propType Propagation/TwoRayGround \
                 -phyType $opt(netif) \
                 -channel [new Channel/WirelessChannel] \
                 -topoInstance $topography \
		 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace ON \
                 -energyModel    "EnergyModel" \
                 -initialEnergy  3J \
                 -rxPower        1mW \
                 -txPower        1mW \
                 -idlePower      0.5mW \
		 -sleepPower 	 0.001mW 


# Create wireless nodes.
set node(3) [$ns node]
## node(3) at 540.843750,607.187500
$node(3) set X_ 540.843750
$node(3) set Y_ 607.187500
$node(3) set Z_ 0.0
$node(3) color "black"
$ns initial_node_pos $node(3) 10.000000

set node(2) [$ns node]
## node(2) at 593.781250,559.750000
$node(2) set X_ 553.781250
$node(2) set Y_ 559.750000
$node(2) set Z_ 0.0
$node(2) color "black"
$ns initial_node_pos $node(2) 10.000000
set node(1) [$ns node]
## node(1) at 495.812469,554.937500
$node(1) set X_ 495.812469
$node(1) set Y_ 554.937500
$node(1) set Z_ 0.0
$node(1) color "black"
$ns initial_node_pos $node(1) 10.000000

#######################################################
Agent/UDP set nam_tracevar_ true         
Agent/UDP set window_ 20
Agent/UDP set maxcwnd_ 8
########################################################
# Create links between nodes.
# Add Link Loss Models

# Create agents.
set agent(3) [new Agent/Null]
$ns attach-agent $node(3) $agent(3)
set agent(2) [new Agent/UDP]
$ns attach-agent $node(2) $agent(2)

# Create traffic sources and add them to the agent.
set traffic_source(2) [new Application/Traffic/CBR]
$traffic_source(2) attach-agent $agent(2)
$traffic_source(2) set interval_ 0.200000
set agent(1) [new Agent/UDP]
$ns attach-agent $node(1) $agent(1)

# Create traffic sources and add them to the agent.
set traffic_source(1) [new Application/Traffic/CBR]
$traffic_source(1) attach-agent $agent(1)
$traffic_source(1) set packetSize_ 1024               ;# Set Packet Size to 512 bytes
$traffic_source(1) set rate_ 512Kb                    ;# Set CBR rate to 200 Kbits/sec
$traffic_source(1) set interval_ 0.100000

####################################################

$ns add-agent-trace $agent(3) udp
$ns monitor-agent-trace $agent(3)
$agent(3) tracevar cwnd_
$agent(3) tracevar ssthresh_

####################################################

#Connect the traffic sources with the traffic sink
$ns connect $agent(1) $agent(3)  
$ns connect $agent(2) $agent(3)


#Schedule events for the CBR agents
$ns at 0.5 "$traffic_source(1) start"
$ns at 1.0 "$traffic_source(2) start"
$ns at 4.0 "$traffic_source(1) stop"
$ns at 4.5 "$traffic_source(2) stop"


################ add annotations ##########################
$ns at 0.5 "$ns trace-annotate \"traffic_source(1) start\""
$ns at 1.0 "$ns trace-annotate \"traffic_source(2) start\""
$ns at 4.0 "$ns trace-annotate \"traffic_source(1) stop\""
$ns at 4.5 "$ns trace-annotate \"traffic_source(2) stop\""
###########################################################

# Connect agents.
# Run the simulation
proc finish {} {
	global ns namfile 
	$ns flush-trace
	close $namfile
	exec nam -r 2000.000000us /root/Desktop/wirl.nam &	
	exit 0
	}
$ns at 60.000000 "finish"
$ns run

