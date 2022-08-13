#SNUB
solvate ATP_ideal

mol delete all
mol new ATP_WB.psf
mol addfile ATP_WB.pdb
if {1} {
set sel [atomselect top "element O"]
$sel set type O
set sel [atomselect top "element C"]
$sel set type C
set sel [atomselect top "element H or name H61 H62 H3T H2'' H5' H5'' "]
$sel set type H
set sel [atomselect top "element P"]
$sel set type P
set sel [atomselect top "element N"]
$sel set type N
}
topo writelammpsdata ATP.data full
#topo writelammpsdata ATP.chrg charge
#topo readlammpsdata ATP.data full

