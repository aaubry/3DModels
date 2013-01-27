lx = 85;
ly = 35;
lz = 20;

ledRadius = 5 / 2;
thickness = 5;
ledSpacing = 23.5 / 3;

module top() {

	cube([lx + thickness * 2, ly + thickness * 2, thickness]);

	translate([thickness / 2, thickness / 2, thickness])
	cube([lx + thickness, ly + thickness, thickness / 2]);

}

module bottom() {

	difference() {
		cube([lx + thickness * 2, ly + thickness * 2, lz + thickness]);

		translate([thickness, thickness, thickness + 1])
		cube([lx, ly, lz + 1]);

		translate([thickness / 2, thickness / 2, lz + thickness / 2 + 1])
		cube([lx + thickness, ly + thickness, thickness / 2 + 1]);


		//leds();
/*
		for(x = [-1 : 3]) {
			translate([lx + thickness / 2, ly / 2 + (ledRadius * 4 * x), lz / 2 + ledRadius])
			rotate(a = [0, 90, 0])
			cylinder(h = thickness * 2, r = ledRadius);
		}*/
	}

//	cube(
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

	translate([43, 3.5, -4.2])
	cube([6, 6, 4.2]);

	translate([43, 3.5, -4.2])
	cylinder(r = 3.5 / 2, h = 6);

}

//top();
//bottom();
//leds();

board();

//% translate([0, 0, lz + thickness * 3]) mirror([0, 0, 1]) top();

