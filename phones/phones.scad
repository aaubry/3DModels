tableHeight = 34;
tableRadius = 20.95;
hookHeight = 20;
hookWidth = 50;
baseWidth = 60;
thickness = 5;
width = 20;

// % translate([0, 0, -width / 2]) cube([baseWidth, tableHeight, width]);

scale([1, 1, 1])
union() {

	translate([0, tableHeight, 0])
	cube([baseWidth, thickness, width]);

	translate([0, -thickness, 0])
	cube([baseWidth, thickness, width]);

	translate([baseWidth, -thickness, 0])
	cube([thickness, tableHeight + thickness * 2, width]);

	translate([0, -hookHeight - thickness, 0])
	cube([thickness, hookHeight, width]);

	translate([0, -hookHeight - thickness * 2, 0])
	cube([baseWidth, thickness, width]);

	translate([baseWidth - thickness, -hookHeight - thickness, 0])
	cube([thickness, thickness, width]);
}
