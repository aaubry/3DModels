lx = 68;
ly = 30;
lz = 22;

ledRadius = 5 / 2;
thickness = 2.5;
ledSpacing = 23.5 / 3;

module top() {

	cube([lx + thickness * 2, ly + thickness * 2, thickness]);

	translate([thickness / 2, thickness / 2, thickness])
	cube([lx + thickness, ly + thickness, thickness / 2]);

	difference() {
		translate([thickness, thickness, thickness * 1.5])
		cube([lx, ly, thickness * 1.5]);

		translate([thickness * 1.5, thickness * 1.5, thickness * 1.5])
		cube([lx - thickness, ly - thickness, thickness * 2]);
	}

}

module bottom() {

	difference() {
		cube([lx + thickness * 2, ly + thickness * 2, lz + thickness]);

		translate([thickness, thickness, thickness + 1])
		cube([lx, ly, lz + 1]);

		translate([thickness / 2, thickness / 2, lz + thickness / 2 + 1])
		cube([lx + thickness, ly + thickness, thickness / 2 + 1]);

		translate([thickness + lx - 54, thickness, thickness + 3])
		board();

		translate([lx, ly / 4 + thickness, lz / 2])
		rotate([0, 90, 0])
		cylinder(r = 4.8 / 2, h = 10);
	}

}

module leds() {
	for(x = [0 : 3]) {
		translate([(ledRadius * 4 * x), 0, 0])
		cylinder(h = thickness * 2, r = ledRadius);
	}
}

module board() {
	cube([54, 30, 1]);

	for(x = [0 : 3]) {
		translate([6.5 + x * ledSpacing, 6, -8.5])
		cylinder(r = ledRadius, h = 8.5);
	}

	translate([43, 3.5, -14.2])
	cube([6, 6, 14.2]);
}

//top();
//bottom();
//leds();

/*
difference() {

	top();

	linear_extrude(height = 10)
	scale([0.07, 0.07, 0.07])
	translate([100, -350, 0])
	import("../hello.dxf");

}
*/

difference() {
	top();

	translate([4, 20, -1])
	linear_extrude(height = 2)
	mirror([0, 1, 0])
	scale([0.3, 0.3, 0.3])
	import("susana1.dxf");

	translate([30, 33, -1])
	linear_extrude(height = 2)
	mirror([0, 1, 0])
	scale([0.15, 0.15, 0.15])
	import("../tavaubry.dxf");
}



//% bottom();

