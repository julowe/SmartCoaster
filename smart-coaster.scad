//smart coaster
//jkl 20210707

draftingFNs = 36;
renderFNs = 180;
$fn = draftingFNs;


//here, coaster being the part that actually comes into contact with the cup
coasterDiameter = 85; //ok so not exactly cup itself, but the space for a cup bottom
coasterThickness = 2; //ertical thickness of material under cup

coasterDonutWidth = 5; //raised donut around inner cup coaster circle
coasterDonutRidgeHeight = 2; //vertical difference between place for cup and ridge/donut around it

coasterWallThickness = 2; // radial thickness of wall that come down over some of base of coaster - upper part of object will have two circular walls (cross-section as an upside down U shape) mating with bottom one circular wall
coasterWallHeight = 10; //how much coaster part overlaps vertically with base

wallGapRadialTolerance = 0.2; //how much gap to put between concentric walls - so they fit together nice enough
coasterBaseVerticalGap = 2; //how much gap to leave between uppper (coaster) part and the base - i.e. how much can top be depressed by glass and trigger the button/mechanism

//the vertical height of finished object will be: baseThickness, baseRingHeight, coasterBaseVerticalGap, coasterWallHeight, coasterThickness, coasterDonutRidgeHeight

baseThickness = 3; //vertical height of soid part that sits on desk
baseRingHeight = 5; //height of ring above the base thickness pecified above that will alow LEDs to shine through. 

objectRadius = (coasterDiameter + coasterDonutWidth*2)/2;

//some terms I leave expanded for visualization clarity (hopefully) e.g. `objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness` vs `objectRadius-wallGapRadialTolerance-coasterWallThickness*2`
/* TODO

- [ ] test print wall tolerances
- [ ] add mounting posts(?) for arduino
- [ ] mounting option(?) for trigger mechanism(?)
- [ ] mounting option(?) for LEDs(type?)

*/

module base() {
    //very bottom of base of whole object
    cylinder(baseThickness, objectRadius, objectRadius);
    
    //part where LEDs shine through as well, must be as wide as outer wall of upper part of coaster and inner wall above it (which upper parts of coaster will slide down around)
    translate([0,0,baseThickness]){
        difference(){
            cylinder(baseRingHeight, objectRadius, objectRadius);
            cylinder(baseRingHeight, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness);
        }
    }
    
    //wall which upper part of coaster will slide down around
    translate([0,0,baseThickness + baseRingHeight]){
        difference(){
            cylinder(coasterWallHeight+coasterBaseVerticalGap, objectRadius-coasterWallThickness-wallGapRadialTolerance, objectRadius-coasterWallThickness-wallGapRadialTolerance);
            cylinder(coasterWallHeight+coasterBaseVerticalGap, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness);
        }
    }
}
//retain whitespace (after collapsing module code)


module coasterUpper() {
    //outer wall of upper object/coaster
    difference(){
        cylinder(coasterWallHeight, objectRadius, objectRadius);
        cylinder(coasterWallHeight, objectRadius-coasterWallThickness, objectRadius-coasterWallThickness);
    }
    
    //inner wall of upper object/coaster
    difference(){
        cylinder(coasterWallHeight, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness-wallGapRadialTolerance, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness-wallGapRadialTolerance);
        cylinder(coasterWallHeight, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness, objectRadius-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness-wallGapRadialTolerance-coasterWallThickness);
    }
    
    //upper solid cylinder/surface of coaster
    translate([0,0,coasterWallHeight]) {
        difference(){
            cylinder(coasterThickness+coasterDonutRidgeHeight, objectRadius, objectRadius);
            translate([0,0,coasterThickness]){
                cylinder(coasterDonutRidgeHeight, objectRadius-coasterDonutWidth, objectRadius-coasterDonutWidth);     
            }   
        }
    }

}
//retain whitespace (after collapsing module code)


//overkill here? probably, but I eventually screw something up by just commenting in/out lines to render objects I want
//objectsToRender options: "preview", "top", "base"
objectsToRender = "top";

if ( objectsToRender == "preview") {
    $fn = draftingFNs;
    
    base();
    
    translate([0,0,(baseThickness + baseRingHeight + coasterWallHeight*2)]){
        coasterUpper();
    }
} else if ( objectsToRender == "base") {
    $fn = renderFNs;
    base();
} else if ( objectsToRender == "top") {
    $fn = renderFNs;
    coasterUpper();
}
