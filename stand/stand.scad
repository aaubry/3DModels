thickness = 4;
width = 40;
length = 40;
frontHeight = 6;
backHeight = 50;

scale([10, 10, 10]) translate([-width / 2, -length / 2, 0]) union() {
	cube([width, length, thickness]);
	translate([0, -thickness, 0]) cube([width, thickness, frontHeight + thickness]);
	translate([0, length, 0]) cube([width, thickness, backHeight + thickness]);
}


