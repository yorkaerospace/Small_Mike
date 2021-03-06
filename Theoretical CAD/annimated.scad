use <template/src/NoseCones.scad>
use <template/src/Fins.scad>
use <template/src/BasicComponents.scad>

// units: mm
$fn = 360;

//out_dia = 56.5;

acrylic_thick = 2.7;

// Nose Cone
{
    nose_len = 150;
    nose_dia = 53.7;      //nose cone should be same dia as tube but isn't
    nose_thick = 2.5;
    k = 0.5;
    // Shoulder
    shoul_len = 80;
    shoul_dia = 50;
    shoul_thick = 2.5;
    
    // TOGGLE TAG: nose_cone
    translate([0, 0, 624])
    parabolic(nose_len, nose_dia, nose_dia-(2*nose_thick), k, shoul_len, shoul_dia, shoul_dia-(2*shoul_thick), step=0.1);
}
//

//tube
{
    tube_len = 624;
    tube_dia = 55.5;
    tube_thick = 2.7;
    tube_innner = tube_dia - (2 * tube_thick);
    
    // TOGGLE TAG: main_body
    tube(tube_len, tube_dia, tube_innner, "yellow", "aqua");

    //inner tube
    {
        inn_len = 142;
        inn_dia = 30.7;
        inn_thick = 0.95;
        
        // TOGGLE TAG: inner_tube
        tube(inn_len, inn_dia, inn_dia-(2*inn_thick), "Sienna", "Tan");
        
        // God nut mount
        // TOGGLE TAG: god_nut_mount
        difference()
        {
            union()
            {
                color("maroon")
                translate([0, 0, inn_len + 2*acrylic_thick])
                centreRing(tube_innner, 9.8 , acrylic_thick);
                
                color("red")
                translate([0, 0, inn_len + acrylic_thick])
                centreRing(tube_innner, 9.8 , acrylic_thick);
            }
            //
            translate([0, 14.95, inn_len + (acrylic_thick/2)])
            cylinder(h=3 * acrylic_thick, d=2.9);
        }
        //
        
        // TOGGLE TAG: top_ring
        difference()
        {
            color("orange")
            translate([0, 0, inn_len])
            centreRing(tube_innner, inn_dia, acrylic_thick);
            
            translate([0, 14.95, inn_len - (acrylic_thick/2)])
            cylinder(h=2 * acrylic_thick, d=6.1);
        }
        //
        
        //top centre ring
        {
            // TOGGLE TAG: top_centre_ring
            color("yellow")
            translate([0, 0, inn_len - acrylic_thick])
            
            centreRing(tube_innner, inn_dia, acrylic_thick);
        }
        //
        
        // bottom assembly
        {
            // TOGGLE TAG: bottom_centre_ring_retainer
            difference()
            {
                union()
                {
                        
                    // bottom centre ring
                    {
                        color("yellow")
                        translate([0, 0, 0])
                        centreRing(tube_innner, inn_dia, acrylic_thick);
                    }
                    //
                    
                    color("orange")
                    translate([0, 0, -acrylic_thick])
                    centreRing(53.8, 30, acrylic_thick);
                }
                rotate([0, 0, 45])
                translate([0, 20.95, -(acrylic_thick * 1.5)])
                cylinder(h=3 * acrylic_thick, d=2.9);
                
                rotate([0, 0, -135])
                translate([0, 20.95, -(acrylic_thick * 1.5)])
                cylinder(h=3 * acrylic_thick, d=2.9);
            }
        }
    }
    //
    
    // motor casing
    {
        cas_len = 141;
        cas_dia=28.5;
        cas_thick = 1.6;
        
        // TOGGLE TAG: motor_casing
        tube(cas_len, cas_dia, cas_dia-(2*cas_thick), "gray", "red");
    }
    // 
    
    ////engine block
    //color("red")
    //translate([0, 0, 0])
    //linear_extrude(0.5)
    //circle(13.4/2);


    //Fins
    {
        root_chord = 80;
        tip_chord = 70;
        height = 50;
        sweep = 62.3;
        depth = 13;
        fin_thick = acrylic_thick;
        
        // TOGGLE TAG: fin_1
        translate([tube_dia/2, -fin_thick/2, fin_thick])
        rotate([0, 0, -90])
        color("green")
        deep_trap(root_chord, tip_chord, height, sweep, depth, fin_thick);
        
        // TOGGLE TAG: fin_2
        translate([-tube_dia/2, fin_thick/2, fin_thick])
        rotate([0, 0, 90])
        color("green")
        deep_trap(root_chord, tip_chord, height, sweep, depth, fin_thick);
        
        // TOGGLE TAG: fin_3
        translate([-fin_thick/2, -tube_dia/2, fin_thick])
        rotate([0, 0, 180])
        color("green")
        deep_trap(root_chord, tip_chord, height, sweep, depth, fin_thick);
        
        // TOGGLE TAG: fin_4
        translate([fin_thick/2, tube_dia/2, fin_thick])
        rotate([0, 0, 0])
        color("green")
        deep_trap(root_chord, tip_chord, height, sweep, depth, fin_thick);
    }
}