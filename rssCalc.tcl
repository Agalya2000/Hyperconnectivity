# RADIO MODEL SETTINGS
set Gt 1
set Gr 1
set L 1.0
set Pt1 0.031778
set Pt2 0.021778
set ht 1.5
set hr 1.5


#Distance calulation
set nn 30
	for {set i 0} {$i<$nn} {incr i} { 
		set neighborlist($i) [list]
		set x_pos1 [$n($i) set X_]
		set y_pos1 [$n($i) set Y_]
		puts "Distance from node $i"
		puts "***************************************"
		puts $dis "**********************************"
		puts "FROM	TO	DISTANCE"
		puts $dis "FROM	TO	DISTANCE"
		puts "***************************************"
		puts $dis "**********************************"
 		for {set j 0} {$j<$nn} {incr j} {
			if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			puts $dis "Node$i	Node$j 	$d"
			puts "Distance from $i to $j:$d"
			if {$d<200} {
				$n($i) add-neighbor $n($j)
			}
			}
		}
		set neighbor1 [$n($i) neighbors]
			foreach nb1 $neighbor1 {
			set now [$ns now]
    			puts "The neighbor for node $i are:$nb1"
			set idv [$nb1 id]
    			puts "$idv"
				lappend neighborlist($i) $idv
			}
		
	}
	proc myRand { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr int([expr rand() * 100])]
    set value [expr [expr $value % $maxFactor] + $min]
return $value
}

set rssi [ open rssi.tr w]
set nn 30
set i 0

		set x_pos1 [$n($i) set X_]
		set y_pos1 [$n($i) set Y_]

 		for {set j 1} {$j<$nn} {incr j} {
			if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
			set d [expr sqrt($v)]
			set rs [ expr 1000 - $d]
					set neighbor1 [$n($i) neighbors]
			foreach nb1 $neighbor1 {
			set now [$ns now]
    			# puts "The neighbor for node $i are:$nb1 "
			set idv [$nb1 id]
    			# puts "$idv"
			}
			
		}
	}
#RSS Values 
# puts  "~~~~~~~~~~~~~~~~RSS CALCULATION~~~~~~~~~~~~~~~~"
set x_poss1 [$n(0) set X_]
set y_poss1 [$n(0) set Y_]
set x_poss2 [$n(3) set X_]
set y_poss2 [$n(3) set Y_]
set x_poss3 [$n(10) set X_]
set y_poss3 [$n(10) set Y_]
set y_poss [expr $y_poss1-$y_poss2]
set x_poss [expr $x_poss1-$x_poss2]
set y_poss1 [expr $y_poss1-$y_poss3]
set x_poss1 [expr $x_poss1-$x_poss3]
set t1 0
proc RSS1 {} {
global array names n ns i array names c
global Gt Gr L Pt1 ht hr  t1 y_poss x_poss
set nn 3
		set t [ns now]
		set t1 [expr $t1+$t]
		set v [expr $x_poss*$x_poss + $y_poss*$y_poss]
		set d [expr sqrt($v)]
		# puts "Distance from 0 to 3: $d"
		#RSS
			if {$d > 0} {
			set t [ns now]
			set rss(3) [expr ($Pt1*$Gt*$Gr* [expr pow($ht,2)] * [expr pow($hr,2)])/[expr pow($d,4)] *$L]
			# puts $ "$t1 0 3 $rss(3)"
				}

		set tim [$ns now]
		if {$tim <= 3.0} {
		set d [expr $d-5]
		} else {
		set y_poss [expr $y_poss-10]
		}
		$ns at [expr $tim+0.2] "RSS1"
	}
