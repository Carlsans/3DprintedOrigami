bladelenght = 35;
bladeangle = 15;
handlelenght = 50;
knifelenght = bladelenght+handlelenght;
knifethickness =  6;
knifewidth = 12;

module knife(){
   difference(){
       cube([knifelenght,knifewidth,knifethickness]);
       rotate([bladeangle,0,0])cube([bladelenght,knifewidth+1000,knifethickness]);
       
       }

    }


knife();