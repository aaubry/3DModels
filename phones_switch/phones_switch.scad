thickness = 1;
phone_hole_diameter = 5.2;
cable_diameter = 3.4;

lx = 35;
ly = 30;
lz = thickness + phone_hole_diameter * 2;

switch_lx = 6.4;
switch_ly = 14;
switch_lz = 7.8;
swicth_border_ly = 4;

module box() {

	difference() {
		cube([lx, ly, lz]);

		translate([thickness, thickness, thickness])
		cube([lx - thickness * 2, ly - thickness * 2, lz]);

		translate([phone_hole_diameter + thickness, -1, phone_hole_diameter + thickness])
		rotate([270, 0, 0])
		cylinder(r = phone_hole_diameter / 2, h = thickness + 2);

		translate([lx - phone_hole_diameter - thickness, -1, phone_hole_diameter + thickness])
		rotate([270, 0, 0])
		cylinder(r = phone_hole_diameter / 2, h = thickness + 2);

		translate([lx / 2, -1, phone_hole_diameter + thickness])
		rotate([270, 0, 0])
		cylinder(r = cable_diameter / 2, h = thickness + 2);

		translate([lx / 2, ly - thickness / 2, thickness + switch_lz / 2])
		cube([switch_lx, thickness + 2, switch_lz], center = true);
	}

	translate([lx / 2 + switch_lx / 2 + 2, ly - thickness * 2 - swicth_border_ly, thickness])
	cube([12.3, thickness, switch_lz / 4]);

	translate([lx / 2, ly - switch_ly / 2 - thickness, thickness + switch_lz / 2])
	% cube([switch_lx, switch_ly, switch_lz], center = true);
}

module cap() {
	cube([lx, ly, thickness]);

	translate([thickness, thickness, thickness])
	cube([thickness, thickness * 2, thickness * 3]);

	translate([lx - thickness * 2, thickness, thickness])
	cube([thickness, thickness * 2, thickness * 3]);

	translate([thickness, ly - thickness * 3, thickness])
	cube([thickness, thickness * 2, thickness * 3]);

	translate([lx - thickness * 2, ly - thickness * 3, thickness])
	cube([thickness, thickness * 2, thickness * 3]);
}

cap();
//box();