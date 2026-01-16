// Create a square grid. dimensions and separations are bidimensionnal vectors
module squaregrid(creasethickness, creasewidth, dimensions, separations) {
  xseparationwidth = dimensions[0] / (separations[0]);
  for(i = [0:separations[0]]) {
    translate([-creasewidth / 2 + i * xseparationwidth, 0, 0])
      cube([creasewidth, dimensions[1], creasethickness]);
  }
  yseparationwidth = dimensions[1] / (separations[1]);
  for(i = [0:separations[1]]) {
    translate([0, -creasewidth / 2 + i * yseparationwidth, 0])
      cube([dimensions[0], creasewidth, creasethickness]);
  }

}
//squaregrid(0.2,0.5,[100,80],[10,8]);
// Create a triangle grid. dimensions is a bidimensionnal vector and steps a scalar
module triangulargrid(creasethickness, creasewidth, dimensions, steps) {
  intersection() {
    translate([0, 0, -5000])
      cube([dimensions[0], dimensions[1], 10000]);
    union() {
      separations = pow(2, steps);
      separationwidth = dimensions[0] / (separations);
      for(i = [0:separations * 2]) {
        translate([-creasewidth / 2 + i * separationwidth / 2, 0, 0])
          cube([creasewidth, dimensions[1], creasethickness]);
      }
      middlepoint = dimensions[1] / 2;
      diagonallenght = middlepoint / sin(30);
      halfdistance = (dimensions[0] / 2) * (sin(30) / sin(60));
      //echo(halfdistance);
      for(step = [0:steps]) {
        //pow(2,step)-1]
        for(lines = [-(pow(2, step) - 1):pow(2, step) - 1]) {
          translate([0, (halfdistance * 2 / pow(2, step)) * lines, 0])
            for(sign = [-1, 1]) {
              translate([0, middlepoint - creasewidth / 2, 0])
                rotate([0, 0, 30 * sign])
                  cube([diagonallenght, creasewidth, creasethickness]);
              translate([dimensions[0], middlepoint - creasewidth / 2, 0])
                translate([0,0,creasethickness])rotate([0, 180, 30 * sign])
                  cube([diagonallenght, creasewidth, creasethickness]);
            }
        }
      }


    }
  }


}


function trianglegridunitside(dimensionx,steps) = (dimensionx/pow(2,steps+1)* (sin(90) / sin(60)));// /pow(2,steps+1);
//echo(trianglegridunitside(100,1));
//triangulargrid(1, 0.5, [100, 100], 1);
