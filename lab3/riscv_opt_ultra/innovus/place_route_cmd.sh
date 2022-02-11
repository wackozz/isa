source /software/scripts/init_innovus17.11
cd innovus/
rm -r screenCapture
rm -r snapshot
rm -r timingReports
mkdir screenCapture
mkdir snapshot
mkdir timingReports
innovus -no_gui -init scripts/place_route_cmd.cmd

