use <base_grids.scad>
sheetwidth = 100;
sheetthickness = 0.4;
creasethickness = 0.2;
creasewidth = 0.5;
separations = 8;
module waterbomb(){
    difference(){
        cube([sheetwidth,sheetwidth,sheetthickness]);
        translate([0,0,creasethickness]){
            squaregrid(creasethickness+1,creasewidth,[sheetwidth,sheetwidth],[separations,separations]);
            x();
            }
        
        
        }
    
    }
module x(){
    xlenght = sqrt(2*pow(2*sheetwidth/separations,2));
    echo(xlenght);
    rotate([0,0,45])translate([-creasewidth/2,-xlenght/2,0])cube([creasewidth,xlenght,creasethickness+1]);
    rotate([0,0,-45])translate([-creasewidth/2,-xlenght/2,0])cube([creasewidth,xlenght,creasethickness+1]);
    
    }
waterbomb();