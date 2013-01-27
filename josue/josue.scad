
$fn = 20;

module axis() {

	difference() {
		cylinder(r = 6, h = 5.7);
		translate([0, 0, -0.1])
		cylinder(r = 4.3 / 2, h = 6);

		for(i = [0 : 2]) {
			translate([0, 0, 2])
			rotate([0, 0, 60 * i])
			cube([6.9, 3.9, 4.1], center = true);
		}
	}

	translate([4.3 / 2, -0.35 / 2, 5.7])
# 	cube([6, 0.35, 2.2]);
}

module frame() {

	//cube([40, 30, 5.7]);

	difference() {
		union() {
			cube([40, 6, 5.7]);

			rotate([0, 0, 90])
			translate([0, -6, 0])
			cube([30, 6, 5.7]);

			translate([0, 27, 0])
			rotate([0, 0, -30])
			cube([46, 6, 5.7]);
		}

		translate([40.7, -5, -1])
		cube([20, 20, 10]);

		translate([43, 5, 0])
		cylinder(r = 6, h = 10);

		translate([43, 5, 3.5])
		cylinder(r = 6.5, h = 10);

		translate([-5, 30, -1])
		cube([20, 20, 10]);
	}
}

module base() {
	
	translate([0, 0, 4])
	cube([3, 30, 14]);

//	cylinder(

	translate([3, 0, 0])
	cube([4, 30, 22]);
}

module insert() {
	// # translate([3.5 - 6, 11, 0]) cube([20, 4, 5]);

	difference() {
		cube([13, 11, 5.7]);

		translate([-10, 0, -1])
		rotate([0, 0, -16])
		cube([10, 20, 7]);

		translate([13, 0, -1])
		rotate([0, 0, 3.5])
		cube([10, 20, 7]);
	}
}

module fix() {

	rotate([0, 0, -90])
	translate([-17.5, 13.1, 0])
	insert();

	difference() {
		frame();

		translate([-1, -1, -1])
		cube([25.1, 40, 10]);
	}

	translate([24.1, 0, 0])
	cube([5, 15, 5.7]);

	translate([25, 0, 0])
	cube([11.4, 12, 5.7]);

	translate([43, 5, -2.2])
	axis();

}

mirror([0, 0, 1])
fix();









