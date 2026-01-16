use <base_grids.scad>

sheetwidth = 100;
sheetthickness = 0.4;
creasethickness = 0.2;
creasewidth = 0.5;
steps = 2;

module triangletwist(){
    triangleside = trianglegridunitside(sheetwidth,steps);
    triangleheight = sheetwidth / pow(2,steps+1);
    difference(){
        cube([sheetwidth,sheetwidth,sheetthickness]);
        translate([0,0,creasethickness])triangulargrid(creasethickness+1, creasewidth, [sheetwidth, sheetwidth], steps);
        
        for(rotation =[0,120,240])
        translate([sheetwidth/2,sheetwidth/2,0])rotate([0,0,rotation])translate([-triangleheight,-creasewidth/2+triangleside/2,0])union(){
            cube([triangleheight*2,creasewidth,10]);
            translate([0,0,-50])cylinder(d=3,h=100,$fn=20);
            }
        
        }
    
    

    
    }
triangletwist();