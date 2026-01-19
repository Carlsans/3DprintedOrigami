use <base_grids.scad>

sheetwidth = 150;
sidewidth = 10;
steps = 3;

basethickness = 1.8;
sidethickness = 1.2;

creasedepth = 0.9;
creastwidth = 0.8;
totalwidth = sheetwidth +sidewidth*2;
module base(){
    translate([-sidewidth,-sidewidth,0])difference(){
        cube([totalwidth,totalwidth,basethickness+sidethickness]);
        translate([sidewidth,sidewidth,basethickness])cube([sheetwidth,sheetwidth,basethickness+sidethickness]);
        }
    
    }

module triangular_grid(){
    difference(){
        base();
    translate([0,0,basethickness-creasedepth])triangulargrid(creasedepth+1, creastwidth, [sheetwidth, sheetwidth], steps,singlecrease = true); 
        translate([0,0,basethickness+sidethickness-creasedepth+.1]) triangulargrid(creasedepth+100, creastwidth, [sheetwidth, sheetwidth], steps,singlecrease = true,intersectionned = false); 
        }
   
    }
triangular_grid();
module square_grid(){
     difference(){
        base();
    translate([0,0,basethickness-creasedepth]) squaregrid(creasedepth+1, creastwidth,[sheetwidth,sheetwidth],[pow(2,steps+1),pow(2,steps+1)],singlecrease = true);
         translate([0,-sheetwidth/2,basethickness+sidethickness-creasedepth]) scale([1,2,1])squaregrid(creasedepth+1, creastwidth,[sheetwidth,sheetwidth],[pow(2,steps+1),pow(2,steps+1)],singlecrease = true);
        }
    
    }
  
//square_grid();