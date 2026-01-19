use <base_grids.scad>

sheetwidth = 100;
sheetthickness = 0.4;//old 0.4
creasethickness = 0.2;
creasewidth = 0.5; //old 0.5
steps = 2;

 triangleside = trianglegridunitside(sheetwidth,steps);
    triangleheight = sheetwidth / pow(2,steps+1);
module triangletwisttessellation(){
   
    difference(){
        cube([sheetwidth,sheetwidth,sheetthickness]);
        translate([0,0,creasethickness])triangulargrid(creasethickness+1, creasewidth, [sheetwidth, sheetwidth], steps);
        //hexagontriangles = [[0,triangleside*2,90],[0,-triangleside*2,0],[triangleheight*2,triangleside,-30],[triangleheight*2,-triangleside,0],[-triangleheight*2,triangleside,60],[-triangleheight*2,-triangleside,0]];
        hexagontriangles = [[triangleheight,triangleside*1.5,30],[triangleheight*2,0,90],[triangleheight,-triangleside*1.5,30],[-triangleheight,-triangleside*1.5,90],[-triangleheight*2,0,30],[-triangleheight*1,triangleside*1.5,90]];
        for (i = hexagontriangles){
            translate([sheetwidth/2+i[0],sheetwidth/2+i[1],creasethickness])rotate([0,0,i[2]])othertriangle();
            }
        
        
        
        }
    
    

    
    }
module triangle(){
    for(rotation =[0,120,240])
        rotate([0,0,rotation])translate([-triangleheight,-creasewidth/2+triangleside/2,0])union(){
            cube([triangleheight*2,creasewidth,10]);
            translate([0,0,-50])cylinder(d=3,h=100,$fn=20);
            }
    }
module othertriangle(){
    for(rotation =[0,120,240])
        rotate([0,0,rotation])translate([-creasewidth/2+triangleside/2,-triangleheight,0])union(){
            cube([creasewidth,triangleheight*2,10]);
            translate([0,0,-50])cylinder(d=3,h=100,$fn=20);
            }
    }
    triangletwisttessellation();