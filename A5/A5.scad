a5_lx = 115;
a5_ly = 13;
a5_lz = 58;

thickness = 3;
clearance_x = 1;
clearance_y = 0.5;
clearance_z = 0.5;

support_x = 5;
support_z = 3;

use <../_lib/shapes.scad>;

//use <../../shapes.scad>;

module A5_quick() {
	cube([a5_lx, a5_ly, a5_lz]);
}

module A5() {
	cyl_x = 9.5;
	cyl_z = 20;
	sph_r = 3;

$fn = 20;

	translate([cyl_x + sph_r, a5_ly / 2 + sph_r, cyl_z + sph_r])

	minkowski() {
		minkowski() {
			cube([a5_lx - (sph_r + cyl_x) * 2, a5_ly / 2 - sph_r * 2, a5_lz - (sph_r + cyl_z) * 2]);

			scale([1, 1, cyl_z / cyl_x])
			rotate([90, 0, 0])
			cylinder(r = cyl_x, h = a5_ly / 2);
		}

		sphere(r = sph_r);

	}
}

module stand() {
	x = a5_lx + thickness * 2 + clearance_x * 2;
	y = a5_ly + thickness * 2 + clearance_y * 2;
	z = a5_lz + thickness * 2 + clearance_z * 2;

	difference() {
		translate([0, thickness, 0])
		cube([x, y - thickness, z]);

		translate([thickness, -1, thickness])
		cube([x - thickness * 2, y - thickness + 1, z - thickness * 2]);
	}
}

translate([thickness + clearance_x, thickness + clearance_y, thickness + clearance_z]) {
	% A5();
	//% A5_quick();
}
stand();

















