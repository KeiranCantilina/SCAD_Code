//Parameters (get estimates from reed pipe spreadsheet)
//All measurements in mm

//Extend length by 33%
//Use square cross-section
//Walls are all 2mm and overlap with reed width

//Assuming a brass "reed"

Reed_length = 89.47; //estimated oscillating length

Reed_width = 17;
Reed_thickness = 1.2;
wall_thickness = 2;
wire_diameter = 2;

//Intermediate parameters (calculated)

Channel_length = Reed_length*(4/3);
Channel_side_out= Reed_width+(wall_thickness);
Channel_side_in= Reed_width- (wall_thickness);
SU=Channel_side_out/2;
wire_radius = wire_diameter/2;


//Rendering

//Shallot

difference(){
    
    cube([Channel_length, Channel_side_out, Channel_side_out]);

    translate([wall_thickness,wall_thickness,wall_thickness])
        cube([Channel_length, Channel_side_in, 2*Channel_side_in]);
}


difference(){
    
    //Boot cap
    translate([Channel_length,SU,SU])
        rotate([90,0,90])
            cylinder(h=wall_thickness,r1=SU*4,r2=SU*4);
    
    //Sounding hole
    translate([Channel_length-(wall_thickness/2),wall_thickness,wall_thickness])
        cube([wall_thickness*2,Channel_side_in, Channel_side_in]);
    
    //Reed slot
    translate([Channel_length-(wall_thickness/2),wall_thickness/2,SU*2])
        cube([wall_thickness*2,Reed_width, Reed_thickness]);
    
    //Wire hole
    translate([Channel_length-(wall_thickness/2),SU,SU*3])
        rotate([90,0,90])
            cylinder(h=wall_thickness*2,r1=wire_radius,r2=wire_radius);

}

//Little shallot cover thingy
translate([Channel_length-Channel_side_in,wall_thickness,wall_thickness+Channel_side_in])
    cube([Channel_side_in, Channel_side_in,wall_thickness,]);



