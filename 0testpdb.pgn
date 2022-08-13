#breaks into two parts, reaxff part and bonds part
set list {"resid 1001 and (not name O3A O2A O1A PA O3B O2B O1B PB O3G O2G O1G PG) and not (resname MYR and name C1 O1 O2)" "(resid 1001 and name O3A O2A O1A PA O3B O2B O1B PB O3G O2G O1G PG) or (resid 1001 and resname MYR and name O1 O2 C1) or (same residue as water and within 5 of resid 1001 666)"}

#foreach i {0 1} {

mol new FACS_MD.psf
mol addfile FACS_EQU.pdb

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
	set sel [atomselect top "name SD SG"]
	$sel set element S
	set sel [atomselect top "name MG"]
	$sel set element Mg
	
	#test:
	set sel1 [atomselect top "element H C N O P Mg S"]
	set sel2 [atomselect top "all"]
	
	if { [expr [$sel1 num] - [$sel2 num]] == 0 } {
		puts "YES!!!"
	} else {
		puts "ERROR!!!"
		mol new blach;#should stop script				
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

if {1} {
	set sel [atomselect top "same residue as (within 3 of resid 1001 666)"]
	#set sel [atomselect top "resid 1001 666 or (same residue as water and within 5 of resid 1001 666)"]
	#set sel [atomselect top all]
	#set sel [atomselect top "resname TIP3 and resid 1188 1189"]
	set r [measure center $sel]
	$sel moveby [vecscale -1 $r]	

	$sel writepdb test.pdb
	$sel writepsf test.psf

	if {1} {
		solvate test.psf test.pdb -minmax { {-25 -25 -25 } {25 25 25} } -b 2 -o test_wb 

		mol delete all
		mol new test_wb.psf
		mol addfile test_wb.pdb
		set sel [atomselect top "type OT OH2"]
		$sel set type O
		set sel [atomselect top "type HT H1 H2"]
		$sel set type H
		

	} else {		
		mol delete all
		mol new test.psf
		mol addfile test.pdb
	}

	set sel [atomselect top all]
	set l [$sel get type]
	set g [lsort -unique $l]
	puts $g	
	exec sed -i "s/CHONSMgPNaCuCl.ff.*/CHONSMgPNaCuCl.ff $g/g" lammps\ run/test.in


	topo writelammpsdata lammps\ run/test.data molecular
	topo writelammpsdata lammps\ run/test.full full
	topo writelammpsdata lammps\ run/test.chrg charge 
}

if {0} {
	set j [expr $i+1]
	set sel [atomselect top "[lindex $list $i]"] 	
	
	$sel writepdb test${j}.pdb
	$sel writepsf test${j}.psf

	mol delete all
	mol new test${j}.psf
	mol addfile test${j}.pdb

	topo writelammpsdata lammps\ run/test${j}.data molecular
	topo writelammpsdata lammps\ run/test${j}.full full	
	topo writelammpsdata lammps\ run/test${j}.chrg charge

}

# };#foreach i in list
if {0} { mol delete all; mol new test1.psf; mol addfile test1.pdb; mol new test2.psf; mol addfile test2.pdb} 
