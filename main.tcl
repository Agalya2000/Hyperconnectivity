# explicitly setup our main window

wm geometry  . 650x350+300+200
wm title  .   "LINK COLLUTION EAVES DROPPER"
# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background blue]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 
set File2 [menu .menubar.mFile2]
.menubar add cascade -label "EAVES_DROPPER"  -menu  .menubar.mFile2
set File3 [menu .menubar.mFile3]
.menubar add cascade -label "PerformanceEvaluation"  -menu  .menubar.mFile3

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile

# add the menu item

$File2 add command -label EAVES_DROPPER-Data -command {exec ./ns code.tcl &}
$File2 add command -label Run_Simulation -command {exec nam out.nam &}


$File3 add command -label Packet_Sent -command {exec xgraph packet_received.tr  packet_receivedrss.tr   -x "Time" -y "Packets"  -bg "white" -fg "blue" -t Packet_Received -lw 3 &}
$File3 add command -label Throughput -command {exec xgraph throughput.tr throughputrss.tr -x "Time" -y "packet" -bg "white" -t Throughput -fg "blue" -lw 3 &}
$File3 add command -label DELAY -command {exec xgraph dly.tr  dlyrss.tr  -x "Time" -y "time" -bg "white" -t DELAY -fg "blue" -lw 3 &}
$File3 add command -label LinkThreshold -command {exec xgraph thrval.tr -x "Node" -y "LinkThreshold" -bg "white" -t LinkThreshold -fg "blue" -lw 3 &}


$close add command -label Quit -command exit
