
module box(size, thickness) {
	difference() {
		cube(size);

		translate([thickness, thickness, thickness])
		#cube(size - [thickness * 2, thickness * 2, thickness * 2]);
	}
}

difference() {

	box([10, 20, 30], 1);
	cube([100, 100, 5]);
}

