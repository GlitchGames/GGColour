-- Project: GGColour
--
-- Date: October 17, 2012
--
-- File name: GGColour.lua
--
-- Author: Graham Ranson of Glitch Games - www.glitchgames.co.uk
--
-- Comments: 
-- 
--	    GGColour makes it very simple to used named or hex colours in your game or app. 
--		You can also create custom colour palettes that you can swap out whenever you want
--		Colour values liberated from here - http://www.tayloredmktg.com/rgb/
--
-- Copyright (C) 2012 Graham Ranson, Glitch Games Ltd.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this 
-- software and associated documentation files (the "Software"), to deal in the Software 
-- without restriction, including without limitation the rights to use, copy, modify, merge, 
-- publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
-- to whom the Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or 
-- substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
-- DEALINGS IN THE SOFTWARE.
--
----------------------------------------------------------------------------------------------------

local GGColour = {}
local GGColour_mt = { __index = GGColour }

local lower = string.lower

--- Initiates a new GGColour object.
-- @return The new object.
function GGColour:new()
    
    local self = {}
    
    setmetatable( self, GGColour_mt )
    
    self.colours = {}
	self.palettes = {}
	
	-- Whites/Pastels --
	self:addColour( "Snow", { 1, 0.98, 0.98 } )
	self:addColour( "Snow2", { 0.93, 0.91, 0.91 } )
	self:addColour( "Snow3", { 0.8, 0.79, 0.79 } )
	self:addColour( "Snow4", { 0.55, 0.54, 0.54 } )
	self:addColour( "GhostWhite", { 0.97, 0.97, 1 } )
	self:addColour( "WhiteSmoke", { 0.96, 0.96, 0.96 } )
	self:addColour( "Gainsboro", { 0.86, 0.86, 0.86 } )
	self:addColour( "FloralWhite", { 1, 0.98, 0.94 } )
	self:addColour( "OldLace", { 0.99, 0.96, 0.9 } )
	self:addColour( "Linen", { 0.94, 0.94, 0.9 } )
	self:addColour( "AntiqueWhite", { 0.98, 0.92, 0.84 } )
	self:addColour( "AntiqueWhite2", { 0.93, 0.87, 0.8 } )
	self:addColour( "AntiqueWhite3", { 0.8, 0.75, 0.69 } )
	self:addColour( "AntiqueWhite4", { 0.55, 0.51, 0.47 } )
	self:addColour( "PapayaWhip", { 1, 0.94, 0.84 } )
	self:addColour( "BlanchedAlmond", { 1, 0.92, 0.8 } )
	self:addColour( "Bisque", { 1, 0.89, 0.77 } )
	self:addColour( "Bisque2", { 0.93, 0.84, 0.72 } )
	self:addColour( "Bisque3", { 0.8, 0.72, 0.62 } )
	self:addColour( "Bisque4", { 0.55, 0.49, 0.42 } )
	self:addColour( "PeachPuff", { 1, 0.85, 0.73 } )
	self:addColour( "PeachPuff2", { 0.93, 0.8, 0.68 } )
	self:addColour( "PeachPuff3", { 0.8, 0.69, 0.58 } )
	self:addColour( "PeachPuff4", { 0.55, 0.47, 0.4 } )
	self:addColour( "NavajoWhite", { 1, 0.87, 0.68 } )
	self:addColour( "Moccasin", { 1, 0.89, 0.71 } )
	self:addColour( "Cornsilk", { 1, 0.97, 0.86 } )
	self:addColour( "Cornsilk2", { 0.93, 0.91, 0.8 } )
	self:addColour( "Cornsilk3", { 0.8, 0.78, 0.69 } )
	self:addColour( "Cornsilk4", { 0.55, 0.53, 0.47 } )
	self:addColour( "Ivory", { 1, 1, 0.94 } )
	self:addColour( "Ivory2", { 0.93, 0.93, 0.88 } )
	self:addColour( "Ivory3", { 0.8, 0.8, 0.76 } )
	self:addColour( "Ivory4", { 0.55, 0.55, 0.51 } )
	self:addColour( "LemonChiffon", { 1, 0.98, 0.8 } )
	self:addColour( "Seashell", { 1, 0.96, 0.93 } )
	self:addColour( "Seashell2", { 0.93, 0.9, 0.87 } )
	self:addColour( "Seashell3", { 0.8, 0.77, 0.75 } )
	self:addColour( "Seashell4", { 0.55, 0.53, 0.51 } )
	self:addColour( "Honeydew", { 0.94, 1, 0.94 } )
	self:addColour( "Honeydew2", { 0.96, 0.93, 0.88 } )
	self:addColour( "Honeydew3", { 0.76, 0.8, 0.76 } )
	self:addColour( "Honeydew4", { 0.51, 0.55, 0.51 } )
	self:addColour( "MintCream", { 0.96, 1, 0.98 } )
	self:addColour( "Azure", { 0.94, 1, 1 } )
	self:addColour( "AliceBlue", { 0.94, 0.97, 1 } )
	self:addColour( "Lavender", { 0.9, 0.9, 0.98 } )
	self:addColour( "LavenderBlush", { 1, 0.94, 0.96 } )
	self:addColour( "MistyRose", { 1, 0.89, 0.88 } )
	self:addColour( "White", { 1, 1, 1 } )

	-- Greys --
	self:addColour( "Black", { 0, 0, 0 } )
	self:addColour( "DarkSlateGrey", { 0.19, 0.31, 0.31 } )
	self:addColour( "DimGrey", { 0.41, 0.41, 0.41 } )
	self:addColour( "SlateGrey", { 0.44, 0.54, 0.56 } )
	self:addColour( "LightSlateGrey", { 0.47, 0.53, 0.6 } )
	self:addColour( "Grey", { 0.75, 0.75, 0.75 } )
	self:addColour( "LightGrey", { 0.83, 0.83, 0.83 } )

	-- Blues --
	self:addColour( "MidnightBlue", { 0.1, 0.1, 0.44 } )
	self:addColour( "Navy", { 0, 0, 0.5 } )
	self:addColour( "CornflowerBlue", { 0.39, 0.58, 0.93 } )
	self:addColour( "DarkslateBlue", { 0.28, 0.24, 0.55 } )
	self:addColour( "SlateBlue", { 0.42, 0.35, 0.8 } )
	self:addColour( "MediumSlateBlue", { 0.48, 0.41, 0.93 } )
	self:addColour( "LightSlateBlue", { 0.52, 0.44, 1 } )
	self:addColour( "MediumBlue", { 0, 0, 0.8 } )
	self:addColour( "RoyalBlue", { 0.25, 0.41, 0.88 } )
	self:addColour( "Blue", { 0, 0, 1 } )
	self:addColour( "DodgerBlue", { 0.12, 0.56, 1 } )
	self:addColour( "DeepSkyBlue", { 0, 0.75, 1 } )
	self:addColour( "SkyBlue", { 0.53, 0.81, 0.98 } )
	self:addColour( "LightSkyBlue", { 0.53, 0.81, 0.98 } )
	self:addColour( "SteelBlue", { 0.27, 0.51, 0.71 } )
	self:addColour( "LightSteelBlue", { 0.69, 0.77, 0.87 } )
	self:addColour( "LightBlue", { 0.68, 0.85, 0.9 } )
	self:addColour( "PowderBlue", { 0.69, 0.88, 0.9 } )
	self:addColour( "PaleTurquoise", { 0.69, 0.93, 0.93 } )
	self:addColour( "DarkTurquoise", { 0, 0.81, 0.82 } )
	self:addColour( "MediumTurquoise", { 0.28, 0.82, 0.8 } )
	self:addColour( "Turquoise", { 0.25, 0.88, 0.82 } )
	self:addColour( "Cyan", { 0, 1, 1 } )
	self:addColour( "LightCyan", { 0.88, 1, 1 } )
	self:addColour( "CadetBlue", { 0.37, 0.62, 0.63 } )

	-- Greens --
	self:addColour( "MediumAquamarine", { 0.4, 0.8, 0.67 } )
	self:addColour( "Aquamarine", { 0.5, 1, 0.83 } )
	self:addColour( "DarkGreen", { 0, 0.39, 0 } )
	self:addColour( "DarkOliveGreen", { 0.33, 0.42, 0.18 } )
	self:addColour( "DarkSeaGreen", { 0.56, 0.74, 0.56 } )
	self:addColour( "SeaGreen", { 0.18, 0.55, 0.34 } )
	self:addColour( "MediumSeaGreen", { 0.24, 0.7, 0.44 } )
	self:addColour( "LightSeaGreen", { 0.13, 0.7, 0.67 } )
	self:addColour( "PaleGreen", { 0.6, 0.98, 0.6 } )
	self:addColour( "SpringGreen", { 0, 1, 0.5 } )
	self:addColour( "LawnGreen", { 0.49, 0.99, 0 } )
	self:addColour( "Chartreuse", { 0.5, 1, 0 } )
	self:addColour( "MediumSpringGreen", { 0, 0.98, 0.6 } )
	self:addColour( "GreenYellow", { 0.68, 1, 0.18 } )
	self:addColour( "LimeGreen", { 0.2, 0.8, 0.2 } )
	self:addColour( "YellowGreen", { 0.6, 0.8, 0.2 } )
	self:addColour( "ForestGreen", { 0.13, 0.55, 0.13 } )
	self:addColour( "OliveDrab", { 0.42, 0.56, 0.14 } )
	self:addColour( "DarkKhaki", { 0.74, 0.72, 0.42 } )
	self:addColour( "Khaki", { 0.94, 0.9, 0.55 } )

	-- Yellows --
	self:addColour( "PaleGoldenrod", { 0.93, 0.91, 0.67 } )
	self:addColour( "LightGoldenRodYellow", { 0.98, 0.98, 0.82 } )
	self:addColour( "LightYellow", { 1, 1, 0.88 } )
	self:addColour( "Yellow", { 1, 1, 0 } )
	self:addColour( "Gold", { 1, 0.84, 0 } )
	self:addColour( "LightGoldenrod", { 0.93, 0.87, 0.51 } )
	self:addColour( "Goldenrod", { 0.85, 0.65, 0.13 } )
	self:addColour( "DarkGoldenrod", { 0.72, 0.53, 0.04 } )

	-- Browns --
	self:addColour( "RosyBrown", { 0.74, 0.56, 0.56 } )
	self:addColour( "IndianRed", { 0.8, 0.36, 0.36 } )
	self:addColour( "SaddleBrown", { 0.55, 0.27, 0.07 } )
	self:addColour( "Sienna", { 0.63, 0.32, 0.18 } )
	self:addColour( "Peru", { 0.8, 0.52, 0.25 } )
	self:addColour( "BurlyWood", { 0.87, 0.72, 0.53 } )
	self:addColour( "Beige", { 0.96, 0.96, 0.86 } )
	self:addColour( "Wheat", { 0.96, 0.87, 0.7 } )
	self:addColour( "SandyBrown", { 0.96, 0.64, 0.38 } )
	self:addColour( "Tan", { 0.82, 0.71, 0.55 } )
	self:addColour( "Chocolate", { 0.82, 0.41, 0.12 } )
	self:addColour( "Firebrick", { 0.7, 0.13, 0.13 } )
	self:addColour( "Brown", { 0.65, 0.16, 0.16 } )

	-- Oranges --
	self:addColour( "DarkSalmon", { 0.91, 0.59, 0.48 } )
	self:addColour( "Salmon", { 0.98, 0.5, 0.45 } )
	self:addColour( "LightSalmon", { 1, 0.63, 0.48 } )
	self:addColour( "Orange", { 1, 0.65, 0 } )
	self:addColour( "DarkOrange", { 1, 0.55, 0 } )
	self:addColour( "Coral", { 1, 0.5, 0.31 } )
	self:addColour( "LightCoral", { 0.94, 0.5, 0.5 } )
	self:addColour( "Tomato", { 1, 0.39, 0.28 } )
	self:addColour( "OrangeRed", { 1, 0.27, 0 } )
	self:addColour( "Red", { 1, 0, 0 } )

	-- Pinks/Violets --
	self:addColour( "HotPink", { 1, 0.41, 0.71 } )
	self:addColour( "DeepPink", { 1, 0.08, 0.58 } )
	self:addColour( "Pink", { 1, 0.75, 0.8 } )
	self:addColour( "LightPink", { 1, 0.71, 0.76 } )
	self:addColour( "PaleVioletRed", { 0.86, 0.44, 0.58 } )
	self:addColour( "Maroon", { 0.69, 0.19, 0.38 } )
	self:addColour( "MediumVioletRed", { 0.78, 0.08, 0.52 } )
	self:addColour( "VioletRed", { 0.82, 0.13, 0.56 } )
	self:addColour( "Violet", { 0.93, 0.51, 0.93 } )
	self:addColour( "Plum", { 0.87, 0.63, 0.87 } )
	self:addColour( "Orchid", { 0.85, 0.44, 0.84 } )
	self:addColour( "MediumOrchid", { 0.73, 0.33, 0.83 } )
	self:addColour( "DarkOrchid", { 0.6, 0.2, 0.8 } )
	self:addColour( "DarkViolet", { 0.58, 0, 0.83 } )
	self:addColour( "BlueViolet", { 0.54, 0.17, 0.89 } )
	self:addColour( "Purple", { 0.63, 0.13, 0.94 } )
	self:addColour( "MediumPurple", { 0.58, 0.44, 0.86 } )
	self:addColour( "Thistle", { 0.85, 0.75, 0.85 } )

    return self
    
end

--- Gets all named colours in the system.
-- @return The colours.
function GGColour:getAvailableColours()
	return self.colours
end

--- Gets all palettes in the system.
-- @return The palettes.
function GGColour:getAvailablePalettes()
	return self.palettes
end

--- Adds a named colour to the main list of colours.
-- @param name The name of the new colour. Case-insensitive.
-- @param rgba A table containing the RGBA values.
function GGColour:addColour( name, rgba )
	self.colours[ lower( name ) ] = rgba
end

--- Adds a palette.
-- @param name The name of the new palette. Case-insensitive.
-- @param colours A table containing a list of named RGBA values.
function GGColour:addPalette( name, colours )
	self.palettes[ lower( name ) ] = colours
end

--- Gets a named palette.
-- @param name The name of the palette. Case-insensitive.
-- @return The palette. Nil if none found.
function GGColour:getPalette( name )
	return self.palettes[ lower( name ) ]
end

--- Removes a palette.
-- @param name The name the palette. Case-insensitive.
function GGColour:removePalette( name )
	self.palettes[ lower( name ) ] = nil
end

--- Gets a named colour.
-- @param name The name of the colour.
-- @param asTable Value indicating whether the colour should be returned as a table or individual components. Default is individual components.
-- @param paletteName The name of the colour palette to use. Optional and case-insensitive.
-- @return The found colour. Nil if none found.
function GGColour:fromName( name, asTable, paletteName )
	
	local colours = self:getAvailableColours()
	
	if paletteName then
		colours = self:getPalette( paletteName )
	end
	
	local colour
	if colours then
		colour = colours[ lower( name ) ]
	end
	
	if colour then
		if asTable then
			return colour
		else
			return colour[ 1 ], colour[ 2 ], colour[ 3 ], colour[ 4 ] or 1
		end
	end
	
end

--- Gets a colour from a passed in Hex string.
-- @param hex The hex string.
-- @param asTable Value indicating whether the colour should be returned as a table or individual components. Default is individual components.
-- @return The converted colour.
function GGColour:fromHex( hex, asTable )
	
	local colour = {}
	colour[ 1 ] = tonumber( string.sub( hex, 1, 2 ), 16 ) or 1
	colour[ 2 ] = tonumber( string.sub( hex, 3, 4 ), 16 ) or 1
	colour[ 3 ] = tonumber( string.sub( hex, 5, 6 ), 16 ) or 1
	colour[ 4 ] = tonumber( string.sub( hex, 7, 8 ), 16 ) or 1
	
	for i = 1, #colour, 1 do
		colour[ i ] = colour[ i ] / 255
	end

	if asTable then
		return colour
	else
		return colour[ 1 ], colour[ 2 ], colour[ 3 ], colour[ 4 ] or 1
	end
		
end

--- Destroys this GGColour object.
function GGColour:destroy()
	self.palettes = nil
	self.colours = nil
end

return GGColour