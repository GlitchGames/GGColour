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

##### Get a named colour as a table
```lua
local colour = colourChart:fromName( "Tomato", true )
```

##### Use a named colour for a display object
```lua
local back = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
back:setFillColor( colourChart:fromName( "Tomato" ) )
```

##### Use a hex colour for a display object
```lua
local back = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
back:setFillColor( colourChart:fromHex( "6495ed" ) )
```

##### Use a gradient for a display object
```lua
local gradient = graphics.newGradient( colourChart:fromName( "SkyBlue", true ), colourChart:fromName( "MidnightBlue", true ), "up" )
local back = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
back:setFillColor( gradient )
```

##### Create a colour palette
```lua
local palette = {}
palette[ "red" ] = colourChart:fromName( "Tomato", true )
palette[ "green" ] = colourChart:fromName( "ForestGreen", true )
palette[ "blue" ] = colourChart:fromHex( "6495ed", true )
colourChart:addPalette( "default", palette )
```

##### Use a named colour from a palette for a display object
```lua
local back = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
back:setFillColor( colourChart:fromName( "red", false, "default" ) )
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