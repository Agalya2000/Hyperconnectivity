#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     30                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      1217                      ;# X dimension of topography
set val(y)      500                      ;# Y dimension of topography
set val(stop)   20.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

set route1 [open routetable.tr w]
$ns trace-all $route1
set rt [open Routingtable.tr w]
$ns trace-all $rt
set dis [open distance.tr w]
$ns trace-all $dis
set route3 [open routetable2.tr w]
$ns trace-all $route1

set rt1 [open Routingtable2.tr w]
$ns trace-all $rt

set f1 [open packet_receivedrss.tr w]
set f3 [open lossrss.tr w]
set f2 [open dlyrss.tr w]
set f4 [open throughputrss.tr w]
set f5 [open packet_received.tr w]
set f7 [open loss.tr w]
set f6 [open dly.tr w]
set f8 [open throughput.tr w]

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 30 nodes
set n(0) [$ns node]
$n(0) set X_ 205
$n(0) set Y_ 203
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 20
set n(1) [$ns node]
$n(1) set X_ 254
$n(1) set Y_ 352
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 20
set n(2) [$ns node]
$n(2) set X_ 507
$n(2) set Y_ 230
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 20
set n(3) [$ns node]
$n(3) set X_ 320
$n(3) set Y_ 156
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 20
set n(4) [$ns node]
$n(4) set X_ 357
$n(4) set Y_ 305
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 20
set n(5) [$ns node]
$n(5) set X_ 399
$n(5) set Y_ 456
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 20
set n(6) [$ns node]
$n(6) set X_ 294
$n(6) set Y_ 473
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 20
set n(7) [$ns node]
$n(7) set X_ 467
$n(7) set Y_ 513
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 20
set n(8) [$ns node]
$n(8) set X_ 528
$n(8) set Y_ 360
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 20
set n(9) [$ns node]
$n(9) set X_ 645
$n(9) set Y_ 301
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 20
set n(10) [$ns node]
$n(10) set X_ 607
$n(10) set Y_ 168
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 20
set n(11) [$ns node]
$n(11) set X_ 529
$n(11) set Y_ 77
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 20
set n(12) [$ns node]
$n(12) set X_ 377
$n(12) set Y_ 80
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 20
set n(13) [$ns node]
$n(13) set X_ 426
$n(13) set Y_ 183
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 20
set n(14) [$ns node]
$n(14) set X_ 296
$n(14) set Y_ 254
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 20
set n(15) [$ns node]
$n(15) set X_ 430
$n(15) set Y_ 343
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 20
set n(16) [$ns node]
$n(16) set X_ 541
$n(16) set Y_ 464
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 20
set n(17) [$ns node]
$n(17) set X_ 645
$n(17) set Y_ 448
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 20
set n(18) [$ns node]
$n(18) set X_ 717
$n(18) set Y_ 358
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 20
set n(19) [$ns node]
$n(19) set X_ 757
$n(19) set Y_ 255
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 20
set n(20) [$ns node]
$n(20) set X_ 788
$n(20) set Y_ 174
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 20
set n(21) [$ns node]
$n(21) set X_ 665
$n(21) set Y_ 76
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 20
set n(22) [$ns node]
$n(22) set X_ 831
$n(22) set Y_ 119
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 20
set n(23) [$ns node]
$n(23) set X_ 848
$n(23) set Y_ 272
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 20
set n(24) [$ns node]
$n(24) set X_ 804
$n(24) set Y_ 452
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 20
set n(25) [$ns node]
$n(25) set X_ 699
$n(25) set Y_ 521
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 20
set n(26) [$ns node]
$n(26) set X_ 806
$n(26) set Y_ 355
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 20
set n(27) [$ns node]
$n(27) set X_ 881
$n(27) set Y_ 372
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 20
set n(28) [$ns node]
$n(28) set X_ 700
$n(28) set Y_ 196
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 20
set n(29) [$ns node]
$n(29) set X_ 919
$n(29) set Y_ 183
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 20
 
set hrate1 1
set hrate2 2

source rssCalc.tcl

puts -nonewline " ENTER the SOURCE 0 to 29 :  "
flush stdout
gets stdin sor
puts -nonewline " ENTER the DESTINATION 0 to 29 :  "
flush stdout
gets stdin dest

#color 
for {set i 0} {$i<$val(nn) } {incr i}  {
$n($i) color red
$ns at 0.0 "$n($i) color brown"
}
for { set a1 0} { $a1<$val(nn) } { incr a1} {
set e($a1) 11
# $ns at 0.0 "$n($a1) label $e($a1)"
}

set energy [open energy1.tr w]
proc sensePower {} {
	global array names n ns array names val array names e en1 en2 en3 energy sor
	set count 0
	set t [$ns now]
	for {set i 0} {$i<$val(nn)} {incr i} {
		set e($i) [expr $e($i) - 0.00475]		
 $ns at $t "$n($i) label $e($i)"		
		 puts $energy "$t $e($sor)"	
		 		 
		}		
		$ns at [expr $t+0.2] "sensePower"
	
}

proc transPower { b t} {
	global ns array names n nn array names e rt re nn 
		set t [$ns now]
			set e($b) [expr $e($b)-0.035]
			$ns at $t "$n($b) label $e($b)"
					}

proc receivePower { ma t} {
	global ns array names n nn array names e rt re nn 
		set t [$ns now]
			set e($ma) [expr $e($ma)-0.06]
			$ns at $t "$n($ma) label $e($ma)"
				}

	
set null1 [new Agent/LossMonitor]
set null3 [new Agent/LossMonitor]
set null2 [new Agent/LossMonitor]

	#find route to nodes
set des 0
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts $rt "RouteFrom		RouteTo		Route"
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				set s $j
				set flag 0
				set RNc $s
				puts "Route from $j to $des"
				while {$RNc!=$des} {
					foreach rn $neighborlist($RNc) {
						puts "$rn"
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						foreach rnod $neighborlist($RNc) { 
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
							set D2 [expr sqrt($v)]
							lappend dL $D2	
						}
						set disl [lsort -real $dL]
						set mindis [lindex $disl 0]						
						for {set i 0} {$i<$val(nn)} {incr i} {
							if {$i!=$des} {
								if {$mindis==$nd($des,$i)} {
									set RN1 $i
								}
							}
						}
					}
					set RNc $RN1
					lappend route($j,$des) $RNc
					puts "$RNc"
				}
				puts $rt "$j			$des			$route($j,$des)"
				puts $route1 "$route($j,$des) $RNc j:$j des:$des"
			}
		}
	}	
	set des 0
	for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				set s $j
				set flag 0
				set RNc $s
				# puts "Route from $j to $des"
				while {$RNc!=$des} {
					foreach rn $neighborlist($RNc) {
						# puts "$rn"
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						foreach rnod $neighborlist($RNc) { 
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
							set D2 [expr sqrt($v)]
							lappend dL $D2	
						}
						set disl [lsort -real $dL]
						set mindis [lindex $disl 1]						
						for {set i 0} {$i<$val(nn)} {incr i} {
							if {$i!=$des} {
								if {$mindis==$nd($des,$i)} {
									set RN1 $i
								}
							}
						}
					}
					set RNc $RN1
					lappend route2($j,$des) $RNc
					}
				puts $route3 "$route2($j,$des) $RNc j:$j des:$des"
			}
		}
	}	
	
	
	
		proc attach-cbr-traffic { node sink size interval } {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}

proc link {} {
	global array names n array names nd ns array names route null2 source array names c snode array names val sor dest array names e
set sn $sor
set dn $dest
set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	# $ns at [$ns now] "$n($s) label source"
	# $ns at [$ns now] "$n($sink) label SINK"
	# $ns at [$ns now] "$n($sn) add-mark mo blue"
	# $ns at [$ns now] "$n($sink) add-mark m1 green"
	# $ns at $t "$ns trace-annotate \" The route from $sn to sink\""
	while {$s!=$sink} {
		set in [lindex $route($sn,$dn) $r]
		puts "in:$in"
		$ns at $t "$ns trace-annotate \" $in \""
		$ns attach-agent $n($in) $null2
		# set cbr01 [attach-cbr-traffic $n($s) $null2 50 0.008]
		# transPower $s $t
		# receivePower $in $t
		# $ns at $t "$cbr01 start"
		# $ns at $t "$ns trace-annotate \" Data send $s to $in \""
		set $e($in)  12
		 $ns at $t "$n($in) label $e($in)"		
		# $ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+0.01]
		set s $in
		incr r
		puts "r:$r"
			}
	puts "Time:$t"
	# $ns at [expr $t+0.6] "finish"
}

proc Transmission1 {} {
	global array names n array names nd ns array names route null1 source array names c snode array names val sor dest null2 route2 ni
set sn $sor
set dn $dest
set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	$ns at [$ns now] "$n($s) label source"
	$ns at [$ns now] "$n($sink) label SINK"
	$ns at [$ns now] "$n($sn) add-mark mo blue"
	$ns at [$ns now] "$n($sink) add-mark m1 green"
	$ns at $t "$ns trace-annotate \" The route from $sn to sink\""
	while {$s!=$sink} {
	if {$r!=0} {
		set in [lindex $route($sn,$dn) $r]
	} else {
		set ni [lindex $route2($sn,$dn) $r]	
		set in $ni
		}
		$ns at $t "$ns trace-annotate \" $in \""
		$ns attach-agent $n($in) $null2
		if {$r!=0} {
			set cbr01 [attach-cbr-traffic $n($s) $null2 50 0.008]
	} else {
		set cbr01 [attach-cbr-traffic $n($s) $null2 350 0.003]
		}
	
		transPower $s $t
		receivePower $in $t
		$ns at $t "$cbr01 start"
		$ns at $t "$ns trace-annotate \" Data send $s to $in \""
		$ns at $t "$n($in) color yellow"
		$ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+1.1]
		set s $in
		incr r
		puts "r:$r"
			}
	puts "Time:$t"
	$ns at [expr $t+0.3] "Transmission2"
}

set sn $sor
set dn $dest
set s $sn
set sink $dn
set ni [lindex $route2($sn,$dn) 0]	
set tru [open thrval.tr w]
for {set i 1} {$i<$val(nn)} {incr i} {
if {$i==$ni} {
set thr($i) [myRand 60 75]
puts $tru "$i $thr($i)"
} else {
set thr($i) [myRand 80 95]
puts $tru " $i $thr($i)"
}
}
proc Transmission2 {} {
	global array names n array names nd ns array names route null1 source array names c snode array names val sor dest array names route2
set sn $sor
set dn $dest
set s $sn
	set sink $dn
	set r 0
	set t [$ns now]
	$ns at [$ns now] "$n($s) label source"
	$ns at [$ns now] "$n($sink) label SINK"
	$ns at [$ns now] "$n($sn) add-mark mo blue"
	$ns at [$ns now] "$n($sink) add-mark m1 green"
	$ns at $t "$ns trace-annotate \" The route from $sn to sink\""
	while {$s!=$sink} {
		set in [lindex $route($sn,$dn) $r]
		puts "in:$in"
			set ni [lindex $route2($sn,$dn) 0]
		$ns at $t "$n($ni) color red"
		$ns at $t "$n($ni) label worstlink"
		$ns at $t "$ns trace-annotate \" $in \""
		$ns attach-agent $n($in) $null1
		set cbr01 [attach-cbr-traffic $n($s) $null1 50 0.008]
		transPower $s $t
		receivePower $in $t
		$ns at $t "$cbr01 start"
		$ns at $t "$ns trace-annotate \" Data send $s to $in \""
		$ns at $t "$n($in) color yellow"
		$ns at [expr $t+1.0] "$cbr01 stop"
		set t [expr $t+1.1]
		set s $in
		incr r
		puts "r:$r"
			}
	puts "Time:$t"
	$ns at [expr $t+0.6] "finish"
}

proc record {} {
 #Get An Instance Of The Simulator
    set ns [Simulator instance]

  global  f1 f2 f3 f4 f5 f6 f7 f8 hrate1 hrate2 hrate3 hrate4 hrate5 pdrratio null1 null2 null3  dl 
     
   #Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
   
   #How Many Bytes Have Been Received By The Traffic Sinks?
   set bw0 [$null1 set npkts_]
   set bw1 [$null2 set npkts_]
   set bw2 [$null3 set npkts_]   
   #packets Received by each node
     
   set totalpkts [expr $bw0+$bw1+$bw2]       
	set mean [expr $totalpkts/7]    
   set drop0 [$null1 set nlost_]
   set drop1 [$null2 set nlost_]
   set drop2 [$null3 set nlost_]  
    set totalpktss [expr ($bw0+$bw1+$bw2)/1.5]  
   set totaldrop [expr ($drop1+$drop0+$drop2)/100]
   # puts "Total packet drops : $totaldrop"
   set QOS [expr $totalpkts-$totaldrop]
   set QOS1 [expr $totalpktss-$totaldrop]
   
    set Size 64  

   set pdr0 [expr $bw0/$Size*10]
   set pdr1 [expr $bw1/$Size*10]
   set pdr2 [expr $bw2/$Size*10]	  

   set total [expr $pdr0+$pdr1+$pdr2+40]
   set pdrratio [expr $total/7] 
   set dly0 [expr (($bw0+$hrate1)*8)/(2*$time*1000)]
   set dly1 [expr (($bw1+$hrate2)*8)/(2*$time*1000)] 
   set dly2 [expr (($bw2+$hrate1)*8)/(2*$time*1000)]   
   set totaldelay [expr ($dly0+$dly1+$dly2)/1]

	#Get The Current Time
   set now [$ns now]
    #Save Data To The Files
   puts $f1 "$now [expr $totalpkts]"   
   puts $f2 "$now [expr $totaldelay]"
   puts $f3 "$now [expr $drop2]"   
   puts $f4 "$now [expr $QOS]"
   puts $f5 "$now [expr $totalpktss]"   
   puts $f6 "$now [expr $bw0*0.3]"
   puts $f7 "$now [expr $totaldrop]"   
   puts $f8 "$now [expr $QOS1]"
   #Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  } 
#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at 1.0 "Transmission1"
$ns at 0.0 "sensePower"
$ns at 1.01 "link"
$ns at 0.0 "record"
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
