source /software/scripts/init_innovus17.11
cd innovus/
rm -r powerReport
mkdir powerReport
innovus -no_gui -init scripts/powercons.cmd
