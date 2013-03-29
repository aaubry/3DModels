spool_diameter = 50;
spool_thickness = 55.5;
axis_diameter = 8;
bearing_thickness = 5;

module spool() {
	difference() {
		cylinder(r = spool_diameter * 2, h = spool_thickness);

		translate([0, 0, -1])
		cylinder(r = spool_diameter / 2, h = spool_thickness + 2);
	}

	* difference() {
		translate([0, 0, spool_thickness])
		cylinder(r = spool_diameter * 2, h = spool_thickness / 2);

		translate([0, 0, spool_thickness])
		cylinder(r = spool_diameter / 1.25, h = spool_thickness / 2 + 1);
	}
}

module bearing() {
	difference() {
		union() {
			cylinder(r = spool_diameter / 2, h = bearing_thickness);
			translate([0, 0, -bearing_thickness / 2])
			cylinder(r = spool_diameter / 1.8, h = bearing_thickness / 2);
		}

		translate([0, 0, -bearing_thickness - 1])
		cylinder(r = axis_diameter / 2, h = bearing_thickness * 2 + 2);
	}
}

% * spool();

bearing();

translate([0, 0, spool_thickness])
mirror([0, 0, 1])
* bearing();


