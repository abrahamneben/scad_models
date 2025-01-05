// Parameters
disk_radius_mm = 4 * 25.4;  // Convert 4 inches to mm
disk_thickness_mm = 2;

annulus_inner_radius_mm = 26.5;
annulus_outer_radius_mm = 28.5;
annulus_height_mm = 1.5 * 25.4;  // Convert 1.5 inches to mm

triangle_side_mm = 1;  // Side length of the right triangle

// Flat circular disk
cylinder(h = disk_thickness_mm, r = disk_radius_mm, center = false);

// Annular extrusion
translate([0, 0, disk_thickness_mm]) {
    difference() {
        // Main annular extrusion
        cylinder(h = annulus_height_mm, r = annulus_outer_radius_mm, center = false);

        // Inner cutout to form the annulus
        cylinder(h = annulus_height_mm, r = annulus_inner_radius_mm, center = false);
    }
}

// Right triangle reinforcement at the base
translate([0, 0, disk_thickness_mm]) {
    rotate_extrude(angle = 360) {
        polygon(points = [
            [annulus_outer_radius_mm, 0],
            [annulus_outer_radius_mm + triangle_side_mm, 0],
            [annulus_outer_radius_mm, triangle_side_mm]
        ]);
    }
}
