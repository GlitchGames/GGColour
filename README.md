GGColour
============

GGColour makes it very simple to used named or hex colours in your game or app. 
You can also create custom colour palettes that you can swap out whenever you want. 
Colour values liberated from here - http://www.tayloredmktg.com/rgb/

Basic Usage
-------------------------

##### Require the code
```lua
local GGColour = require( "GGColour" )
```

##### Create your chart
```lua
local colourChart = GGColour:new()
```

##### Get a named colour
```lua
local r, g, b, a = colourChart:fromName( "ForestGreen" )
```

##### Print out all available named colours
```lua
for name, rgb in pairs( colourChart:getAvailableColours() ) do
	print( name, "R: " .. rgb[ 1 ] .. ", G: " .. rgb[ 2 ] .. ", B: " .. rgb[ 3 ] )
end
```

##### Destroy the colour chart
```lua
colourChart:destroy()
colourChart = nil
```

Update History
-------------------------

##### 0.1
Initial release