sheetwidth = 200;
sheetthickness = 0.4;


xfolds = 16;
foldwidthtop = .5;
foldwidthbottom = .5;
xfoldwidth = sheetwidth / xfolds;

pressurereleaseholesdiameter= 3;
module herringbone(){
    difference(){
        cube([sheetwidth,sheetwidth,sheetthickness]);
        for (i = [-1:xfolds+1]){
            if(i%2 == 0){
                translate([-foldwidthbottom/2+ i*xfoldwidth,0,/**(i%2)***/sheetthickness/2])cube([foldwidthbottom,sheetwidth,sheetthickness/2]);
                }else{
                    translate([ -foldwidthbottom/2+i*xfoldwidth,0,/**(i%2)***/sheetthickness/2])cube([foldwidthtop,sheetwidth,sheetthickness/2]);
                }
            
     
            }
        for (j = [0:xfolds ]){
            translate([foldwidthbottom,j*xfoldwidth,/**(j%2)***/sheetthickness/2])
                for (i = [0:xfolds/2 ]){
                    translate([i*xfoldwidth*2-0.7,0,0])scale(j%2);
                }
            
            }
        
       

        pressurereleaseholes();
        }
    
    }
module scale(is_bottom){
  
    if(is_bottom==0){
        rotate([0,0,-45])cube([foldwidthbottom,xfoldwidth*1.41,sheetthickness/2+.001]);
        translate([xfoldwidth*2,0,0])rotate([0,0,45])cube([foldwidthbottom,xfoldwidth*1.41,sheetthickness/2+.001]);
        
        }else{
        rotate([0,0,-45])cube([foldwidthtop,xfoldwidth*1.41,sheetthickness/2+.001]);
        translate([xfoldwidth*2,0,0])rotate([0,0,45])cube([foldwidthtop,xfoldwidth*1.41,sheetthickness/2+.001]);
        }
    
    
    }
module pressurereleaseholes(){
    for (i = [1:xfolds/2-1 ]){
        for (j = [1:xfolds-1 ]){
            translate([i*xfoldwidth*2,j*xfoldwidth,-50])cylinder(d=pressurereleaseholesdiameter,h=100,$fn=12);
            }
        
     }
    for (i = [1:xfolds/2 ]){
        for (j = [1:xfolds-1 ]){
            translate([i*xfoldwidth*2-xfoldwidth,j*xfoldwidth,-50])cylinder(d=pressurereleaseholesdiameter,h=100,$fn=12);
            }
        
     }
 }
herringbone();