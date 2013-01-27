lx = 85;
ly = 35;
lz = 20;

ledRadius = 5 / 2;
thickness = 5;

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

		for(x = [-1 : 3]) {
			translate([lx + thickness / 2, ly / 2 + (ledRadius * 4 * x), lz / 2 + ledRadius])
			rotate(a = [0, 90, 0])
			cylinder(h = thickness * 2, r = ledRadius);
		}
	}
}

module leds() {
	for(x = [-1.5 : 1.5]) {
		translate([(ledRadius * 4 * x), 0, 0])
		//rotate(a = [0, 90, 0])
		cylinder(h = thickness * 2, r = ledRadius);
	}
}

//top();
//bottom();
leds();

% union() {
	translate([0, 0, lz + thickness * 3])
	mirror([0, 0, 1])
	top();
}

