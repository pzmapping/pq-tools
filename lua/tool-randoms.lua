--[[
    Randoms Tool Created by Pabbiqo
]]

DATA = {
    {
        label = '## Randoms ##',
    },  
    {
        label = 'Picnic Table',
        dir1 = {
            w = 'camping_01_8',
            n = 'camping_01_9',
            e = 'camping_01_10',
            s = 'camping_01_11'
        },
        dir2 = {
            w = 'camping_01_12',
            n = 'camping_01_15',
            e = 'camping_01_13',
            s = 'camping_01_14'
        },
		dir3 = {
            w = 'camping_01_8',
            n = 'camping_01_9',
            e = 'camping_01_10',
            s = 'camping_01_11'
        },
		dir4 = {
            w = 'camping_01_12',
            n = 'camping_01_15',
            e = 'camping_01_13',
            s = 'camping_01_14'
        },
    },

	{
	label = 'Small wood East 1',
        dir1 = {
        	w = 'camping_01_24',
		e = 'camping_01_25',
        },
    },

	{
	label = 'Small wood East 2',
        dir1 = {
        	w = 'camping_01_28',
		e = 'camping_01_29',
        },
    },	

	{
	label = 'Small wood South 1',
        dir1 = {
        	w = 'camping_01_34',
		n = 'camping_01_35',
        },
    },

	{
	label = 'Small wood South 2',
        dir1 = {
        	w = 'camping_01_38',
		n = 'camping_01_39',
        },
    },	
	
	
}

LAYERS = {
	'0_Furniture',
	'0_Furniture1',
	'0_Furniture2',
	'0_Furniture3'
}


function options()
    local items = {}
    for i=1,#DATA do items[i] = DATA[i].label end
    return {
        { name = 'type', label = 'Type:', type = 'list', items = items },
    }
end

function setOption(name, value)
    if name == 'type' and #DATA > 0 then
    CURDATA = DATA[value]
    end
end

function activate()
    self:setCursorType(TileTool.CurbTool)
    print 'activate'
end

function deactivate()
    print('deactivate')
end

function mouseMoved(buttons, x, y, modifiers)
	self:clearToolTiles()	
	if x < 0 or y < 0 or x >= map:width() or y >= map:height() then
		self.ok = false
		return
	end	
		if modifiers.alt then
			local layerName = pickEmptyLayer4(x, y)
			if layerName then
				self.ok = true
				if CURDATA.dir4.w ~= nil then
					local tile = map:tile(CURDATA.dir4.w)
					if tile then
						self:setToolTile(layerName, x, y, tile)
					end
				end
				if CURDATA.dir4.n ~= nil then
					local tile2 = map:tile(CURDATA.dir4.n)
					if tile2 then
						self:setToolTile(layerName, x, y-1, tile2)
					end
				end
				if CURDATA.dir4.e ~= nil then
					local tile3 = map:tile(CURDATA.dir4.e)
					if tile3 then
						self:setToolTile(layerName, x+1, y, tile3)        
					end
				end
				if CURDATA.dir4.s ~= nil then
					local tile4 = map:tile(CURDATA.dir4.s)
					if tile4 then
						self:setToolTile(layerName, x+1, y-1, tile4)
					end
				end
			end
		elseif modifiers.control then
    local layerName = pickEmptyLayer3(x, y)
    if layerName then
        self.ok = true
        if CURDATA.dir3.w ~= nil then
            local tile = map:tile(CURDATA.dir3.w)
            if tile then
                self:setToolTile(layerName, x, y, tile)
            end
        end
        if CURDATA.dir3.n ~= nil then
            local tile2 = map:tile(CURDATA.dir3.n)
            if tile2 then
                self:setToolTile(layerName, x, y-1, tile2)
            end
        end
        if CURDATA.dir3.e ~= nil then
            local tile3 = map:tile(CURDATA.dir3.e)
            if tile3 then
                self:setToolTile(layerName, x+1, y, tile3)        
            end
        end
        if CURDATA.dir3.s ~= nil then
            local tile4 = map:tile(CURDATA.dir3.s)
            if tile4 then
                self:setToolTile(layerName, x+1, y-1, tile4)
            end
        end
    end
		elseif modifiers.shift then
    local layerName = pickEmptyLayer2(x, y)
    if layerName then
        self.ok = true
        if CURDATA.dir2.w ~= nil then
            local tile = map:tile(CURDATA.dir2.w)
            if tile then
                self:setToolTile(layerName, x, y, tile)
            end
        end
        if CURDATA.dir2.n ~= nil then
            local tile2 = map:tile(CURDATA.dir2.n)
            if tile2 then
                self:setToolTile(layerName, x, y-1, tile2)
            end
        end
        if CURDATA.dir2.e ~= nil then
            local tile3 = map:tile(CURDATA.dir2.e)
            if tile3 then
                self:setToolTile(layerName, x+1, y, tile3)        
            end
        end
        if CURDATA.dir2.s ~= nil then
            local tile4 = map:tile(CURDATA.dir2.s)
            if tile4 then
                self:setToolTile(layerName, x+1, y-1, tile4)
            end
        end
		end
		else
    local layerName = pickEmptyLayer1(x, y)
    if layerName then
        self.ok = true
        if CURDATA.dir1.w ~= nil then
            local tile = map:tile(CURDATA.dir1.w)
            if tile then
                self:setToolTile(layerName, x, y, tile)
            end
        end
        if CURDATA.dir1.n ~= nil then
            local tile2 = map:tile(CURDATA.dir1.n)
            if tile2 then
                self:setToolTile(layerName, x, y-1, tile2)
            end
        end
        if CURDATA.dir1.e ~= nil then
            local tile3 = map:tile(CURDATA.dir1.e)
            if tile3 then
                self:setToolTile(layerName, x+1, y, tile3)        
            end
        end
        if CURDATA.dir1.s ~= nil then
            local tile4 = map:tile(CURDATA.dir1.s)
            if tile4 then
                self:setToolTile(layerName, x+1, y-1, tile4)
            end
        end
    end
		end
	self.ok = false
end


function mousePressed(buttons, x, y, modifiers)
    if buttons.left then
	self.cancel = false
	self.x, self.y = x, y
    end
    if buttons.right then
	self.cancel = true
    end
end

function mouseReleased(buttons, x, y, modifiers)
if buttons.left and not self.cancel then
if modifiers.alt then
local layerName = pickEmptyLayer4(x, y)
local tile = map:tile(CURDATA.dir4.w)
local tile2 = map:tile(CURDATA.dir4.n)
local tile3 = map:tile(CURDATA.dir4.e)
local tile4 = map:tile(CURDATA.dir4.s)
if layerName then
self.ok = true
if tile then map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURDATA.dir4.w)) end
if tile2 then map:tileLayer(layerName):setTile(self.x, self.y-1, map:tile(CURDATA.dir4.n)) end
if tile3 then map:tileLayer(layerName):setTile(self.x+1, self.y, map:tile(CURDATA.dir4.e)) end
if tile4 then map:tileLayer(layerName):setTile(self.x+1, self.y-1, map:tile(CURDATA.dir4.s)) end	
self:applyChanges('Draw '..CURDATA.label)
end
elseif modifiers.control then
local layerName = pickEmptyLayer3(x, y)
local tile = map:tile(CURDATA.dir3.w)
local tile2 = map:tile(CURDATA.dir3.n)
local tile3 = map:tile(CURDATA.dir3.e)
local tile4 = map:tile(CURDATA.dir3.s)
if layerName then
self.ok = true
if tile then map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURDATA.dir3.w)) end
if tile2 then map:tileLayer(layerName):setTile(self.x, self.y-1, map:tile(CURDATA.dir3.n)) end
if tile3 then map:tileLayer(layerName):setTile(self.x+1, self.y, map:tile(CURDATA.dir3.e)) end
if tile4 then map:tileLayer(layerName):setTile(self.x+1, self.y-1, map:tile(CURDATA.dir3.s)) end	
self:applyChanges('Draw '..CURDATA.label)
end
elseif modifiers.shift then
local layerName = pickEmptyLayer2(x, y)
local tile = map:tile(CURDATA.dir2.w)
local tile2 = map:tile(CURDATA.dir2.n)
local tile3 = map:tile(CURDATA.dir2.e)
local tile4 = map:tile(CURDATA.dir2.s)
if layerName then
self.ok = true
if tile then map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURDATA.dir2.w)) end
if tile2 then map:tileLayer(layerName):setTile(self.x, self.y-1, map:tile(CURDATA.dir2.n)) end
if tile3 then map:tileLayer(layerName):setTile(self.x+1, self.y, map:tile(CURDATA.dir2.e)) end
if tile4 then map:tileLayer(layerName):setTile(self.x+1, self.y-1, map:tile(CURDATA.dir2.s)) end	
self:applyChanges('Draw '..CURDATA.label)
end
else
local layerName = pickEmptyLayer1(x, y)
local tile = map:tile(CURDATA.dir1.w)
local tile2 = map:tile(CURDATA.dir1.n)
local tile3 = map:tile(CURDATA.dir1.e)
local tile4 = map:tile(CURDATA.dir1.s)
if layerName then
self.ok = true
if tile then map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURDATA.dir1.w)) end
if tile2 then map:tileLayer(layerName):setTile(self.x, self.y-1, map:tile(CURDATA.dir1.n)) end
if tile3 then map:tileLayer(layerName):setTile(self.x+1, self.y, map:tile(CURDATA.dir1.e)) end
if tile4 then map:tileLayer(layerName):setTile(self.x+1, self.y-1, map:tile(CURDATA.dir1.s)) end	
self:applyChanges('Draw '..CURDATA.label)
end
end
end
end

function pickEmptyLayer1(x, y)
	for _,layerName in ipairs(LAYERS) do
		local layer = map:tileLayer(layerName)
		if layer then
			local tile = layer:tileAt(x, y)
			if not tile then
				return layerName
			end
		end
	end
	return nil
end

function pickEmptyLayer2(x, y)
	for _,layerName in ipairs(LAYERS) do
		local layer = map:tileLayer(layerName)
		if layer then
			local tile = layer:tileAt(x, y)
			if not tile then
				return layerName
			end
		end
	end
	return nil
end

function pickEmptyLayer3(x, y)
	for _,layerName in ipairs(LAYERS) do
		local layer = map:tileLayer(layerName)
		if layer then
			local tile = layer:tileAt(x, y)
			if not tile then
				return layerName
			end
		end
	end
	return nil
end

function pickEmptyLayer4(x, y)
	for _,layerName in ipairs(LAYERS) do
		local layer = map:tileLayer(layerName)
		if layer then
			local tile = layer:tileAt(x, y)
			if not tile then
				return layerName
			end
		end
	end
	return nil
end