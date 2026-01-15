// Create a square grid. dimensions and separations are bidimensionnal vectors
module squaregrid(creasethickness,creasewidth,dimensions,separations){
    xseparationwidth = dimensions[0] / (separations[0]);
    for (i = [0:separations[0]]){
        translate([-creasewidth/2 + i * xseparationwidth,0,0])cube([creasewidth,dimensions[1],creasethickness]);
        }
    yseparationwidth = dimensions[1] / (separations[1]);
    for (i = [0:separations[1]]){
        translate([0,-creasewidth/2 + i * yseparationwidth,0])cube([dimensions[0],creasewidth,creasethickness]);
        }
    
    }
//squaregrid(0.2,0.5,[100,80],[10,8]);