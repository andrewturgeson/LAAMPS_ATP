package require psfgen
resetpsf

readpsf FACS.psf
coordpdb FACS.pdb
readpsf FACS_MYR.psf
coordpdb FACS_MYR.pdb

writepsf FACS_MD.psf
writepdb FACS_MD.pdb

mol delete all
mol new FACS_MD.psf
mol addfile FACS_MD.pdb

if {0} {
	set sel [atomselect top "element X"]	
	set a {};#H	
	set b {};#C
	set c {};#N
	set d {};#O
	set e {};#P
	set f {};#MG
	set g {};#S
	foreach i [$sel get name] { 
		if {[string first "H" $i] != -1} { 
			lappend a $i
		} elseif {[string first "C" $i] != -1} {
			lappend b $i
		} elseif {[string first "N" $i] != -1} {
			lappend c $i
		} elseif {[string first "O" $i] != -1} {
			lappend d $i
		} elseif {[string first "P" $i] != -1} {
			lappend e $i
		} elseif {[string first "Mg" $i] != -1} {
			lappend f $i
		} elseif {[string first "S" $i] != -1} {
			lappend g $i
		}
	}
	foreach j {a b c d e f g} {
		set $j [lsort -unique [set $j]]
		puts [set $j]
	}
}
if {1} {
	set sel [atomselect top "name H1 H1' H2 H2' H2'' H3' H3T H4' H5' H5'' H61 H62 H8 HA HA1 HA2 HB HB1 HB2 HB3 HD1 HD11 HD12 HD13 HD2 HD21 HD22 HD23 HD3 HE HE1 HE2 HE21 HE22 HE3 HG HG1 HG11 HG12 HG13 HG2 HG21 HG22 HG23 HH HH11 HH12 HH2 HH21 HH22 HN HT1 HT2 HT3 HZ HZ1 HZ2 HZ3 H10R H10S H11R H11S H12R H12S H13R H13S H14R H14S H14T H2R H2S H3R H3S H4R H4S H5R H5S H6R H6S H7R H7S H8R H8S H9R H9S"]
	$sel set element H
	set sel [atomselect top "name C1' C2 C2' C3' C4 C4' C5 C5' C6 C8 CH2 C C1 C10 C11 C12 C13 C14 C3 C7 C9 CA CB CD CD1 CD2 CE CE1 CE2 CE3 CG CG1 CG2 CZ CZ2 CZ3"]
	$sel set element C
	set sel [atomselect top "name N1 N3 N6 N7 N9 NH1 NH2 N ND1 ND2 NE NE1 NE2 NZ"]
	$sel set element N
	set sel [atomselect top "name O1A O1B O1G O2' O2A O2B O2G O3' O3A O3B O3G O4' O5' OT1 OT2 OH OH2 O O1 O2 OD1 OD2 OE1 OE2 OG OG1"]
	$sel set element O
	set sel [atomselect top "name PA PB PG"]
	$sel set element P
	
   


	#test:
	set sel1 [atomselect top "element H C N O P Mg S"]
	set sel2 [atomselect top "all"]
	if { [expr [$sel1 num] - [$sel2 num]] == 0 } {
		puts "YES!!!"
	} else {
		mol new blach;#should stop script		
		puts "ERROR!!!"
	}
}

if {1} {
set sel [atomselect top "element O"]
$sel set type O
set sel [atomselect top "element C"]
$sel set type C
set sel [atomselect top "element H"]
$sel set type H
set sel [atomselect top "element P"]
$sel set type P
set sel [atomselect top "element N"]
$sel set type N
set sel [atomselect top "element S"]
$sel set type S
set sel [atomselect top "element Mg"]
$sel set type Mg
}

topo writelammpsdata FACS_MD.data full
topo writelammpsdata FACS_MD.chrg charge
#topo readlammpsdata ATP.data full
