# SmartCoaster

## Overview

Timed reminder lights using Adafruit NeoPixels and Arduino Micro (3.3v ATMEGA 32U4). Forked to add models. And maybe more documentation? Info on original object [in this reddit post](https://www.reddit.com/r/3Dprinting/comments/ofcp4t/i_kept_forgetting_to_drink_my_water_while_working/h4cs1ja/).

## 3D Models

Aim was to make parametric OpenScad file for anyone to easily edit and customize their coaster. Scad file currently only creates a model that uses all solid materials (original post mentions using TPU for coaster/cup part) 

**Very** rough/early STLs are included for now, they have not been print tested, the math may very well be off somewhere - or the math may be right and the objects just don't make sense somehow... Especially the wallGapRadialTolerance = 0.2 (mm) which actually probably isn't enough :-/

## TODO

See individual files for most up to date TODOs, but here are some from some point in time:

- [ ] test print wall tolerances
- [ ] add mounting posts(?) for arduino
- [ ] mounting option(?) for trigger mechanism(?)
- [ ] mounting option(?) for LEDs(type?)

