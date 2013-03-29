
phone_thickness = 13;
phone_width = 58;
phone_height = 115;
phone_angle = 70;
phone_padding = 0.5;

stand_thickness = 2;
stand_width = 5;
stand_length = 35;
stand_height = 30;
stand_angle = 10;

offset = phone_thickness * sin(phone_angle);

module phone() {
	translate([offset + stand_thickness + phone_padding, -10, stand_thickness + phone_padding])
	rotate([0, -phone_angle, 0])
	cube([phone_width, phone_height, phone_thickness]);
}

module stand() {
	$fn=50;

	minkowski() {
	difference() {
		cube([stand_length, stand_width, stand_height]);

		translate([stand_thickness, -1, stand_thickness])
		cube([offset + phone_padding * 2, stand_width + 2, stand_length]);

		translate([offset + stand_thickness + phone_padding * 2, -1, stand_thickness])
		rotate([0, -phone_angle, 0])
		cube([phone_width, stand_width + 2, phone_thickness + phone_padding * 2]);

		translate([stand_length, -1, 0])
		rotate([0, -stand_angle, 0])
		cube([stand_length, stand_width + 2, stand_height * 2]);

		translate([-1, -1, phone_thickness * cos(phone_angle) + stand_thickness * 1.5 + phone_padding])
		cube([stand_thickness + 2, stand_width + 2, stand_height]);
	}

	rotate([-90, 0, 0])
	cylinder(r = phone_padding, h = 0.01);
	}
}

stand();



% phone();

