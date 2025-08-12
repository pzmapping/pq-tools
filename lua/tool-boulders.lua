--[[
    pq-tools - Boulder Tool
    Author: Pabbiqo
    Repository: https://github.com/pzmapping/pq-tools
]]

DATA = {
    { label = '### Medium Boulders ###' },

    { label = 'Small 8',  dir = { { w = 'boulders_8' } } },
    { label = 'Small 9',  dir = { { w = 'boulders_9' } } },
    { label = 'Small 10', dir = { { w = 'boulders_10' } } },
    { label = 'Small 11', dir = { { w = 'boulders_11' } } },
    { label = 'Small 12', dir = { { w = 'boulders_12' } } },
    { label = 'Small 13', dir = { { w = 'boulders_13' } } },
    { label = 'Small 14', dir = { { w = 'boulders_14' } } },
    { label = 'Small 15', dir = { { w = 'boulders_15' } } },
    { label = 'Small 48', dir = { { w = 'boulders_48' } } },
    { label = 'Small 49', dir = { { w = 'boulders_49' } } },
    { label = 'Small 50', dir = { { w = 'boulders_50' } } },
    { label = 'Small 51', dir = { { w = 'boulders_51' } } },
    { label = 'Small 52', dir = { { w = 'boulders_52' } } },
    { label = 'Small 53', dir = { { w = 'boulders_53' } } },
    { label = 'Small 54', dir = { { w = 'boulders_54' } } },
    { label = 'Small 55', dir = { { w = 'boulders_55' } } },

    { label = '### Medium Boulders ###' },
    { label = 'Medium 0',  dir = { { w = 'boulders_0' } } },
    { label = 'Medium 1',  dir = { { w = 'boulders_1' } } },
    { label = 'Medium 2',  dir = { { w = 'boulders_2' } } },
    { label = 'Medium 3',  dir = { { w = 'boulders_3' } } },
    { label = 'Medium 4',  dir = { { w = 'boulders_4' } } },
    { label = 'Medium 5',  dir = { { w = 'boulders_5' } } },
    { label = 'Medium 6',  dir = { { w = 'boulders_6' } } },
    { label = 'Medium 7',  dir = { { w = 'boulders_7' } } },
    { label = 'Medium 40', dir = { { w = 'boulders_40' } } },
    { label = 'Medium 41', dir = { { w = 'boulders_41' } } },
    { label = 'Medium 42', dir = { { w = 'boulders_42' } } },
    { label = 'Medium 43', dir = { { w = 'boulders_43' } } },
    { label = 'Medium 44', dir = { { w = 'boulders_44' } } },
    { label = 'Medium 45', dir = { { w = 'boulders_45' } } },
    { label = 'Medium 46', dir = { { w = 'boulders_46' } } },
    { label = 'Medium 47', dir = { { w = 'boulders_47' } } },
    { label = 'Medium 56', dir = { { w = 'boulders_56' } } },
    { label = 'Medium 57', dir = { { w = 'boulders_7' } } },
    { label = 'Medium 58', dir = { { w = 'boulders_7' } } },
    { label = 'Medium 59', dir = { { w = 'boulders_59' } } },
    { label = 'Medium 60', dir = { { w = 'boulders_60' } } },
    { label = 'Medium 61', dir = { { w = 'boulders_61' } } },
    { label = 'Medium 62', dir = { { w = 'boulders_62' } } },
    { label = 'Medium 63', dir = { { w = 'boulders_63' } } },

    { label = '## Large Boulders ##' },
    { label = 'Large 1', dir = { { w = 'boulders_16', n = 'boulders_19', e = 'boulders_17', s = 'boulders_18' } } },
    { label = 'Large 2', dir = { { w = 'boulders_20', n = 'boulders_23', e = 'boulders_21', s = 'boulders_22' } } },
    { label = 'Large 3', dir = { { w = 'boulders_24', n = 'boulders_27', e = 'boulders_25', s = 'boulders_26' } } },
    { label = 'Large 4', dir = { { w = 'boulders_28', n = 'boulders_31', e = 'boulders_29', s = 'boulders_30' } } },
    { label = 'Large 5', dir = { { w = 'boulders_32', n = 'boulders_33' } } },
    { label = 'Large 6', dir = { { w = 'boulders_34', e = 'boulders_35' } } },
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

-- eine Funktion für alle Layer
function pickEmptyLayer(x, y)
    for _, layerName in ipairs(LAYERS) do
        local layer = map:tileLayer(layerName)
        if layer and not layer:tileAt(x, y) then
            return layerName
        end
    end
    return nil
end

local offsets = { w={0,0}, n={0,-1}, e={1,0}, s={1,-1} }

local function previewTiles(dirIndex, x, y)
    local layerName = pickEmptyLayer(x, y)
    if not layerName or not CURDATA or not CURDATA.dir[dirIndex] then return false end
    for k, pos in pairs(offsets) do
        local tileId = CURDATA.dir[dirIndex][k]
        if tileId then
            local tile = map:tile(tileId)
            if tile then
                self:setToolTile(layerName, x + pos[1], y + pos[2], tile)
            end
        end
    end
    return true
end

local function placeTiles(dirIndex)
    local x, y = self.x, self.y
    local layerName = pickEmptyLayer(x, y)
    if not layerName or not CURDATA or not CURDATA.dir[dirIndex] then return false end
    for k, pos in pairs(offsets) do
        local tileId = CURDATA.dir[dirIndex][k]
        if tileId then
            local tile = map:tile(tileId)
            if tile then
                map:tileLayer(layerName):setTile(x + pos[1], y + pos[2], tile)
            end
        end
    end
    self:applyChanges('Draw ' .. CURDATA.label)
    return true
end

local function getDirIndex(modifiers)
    if modifiers.alt then return 4 end
    if modifiers.control then return 3 end
    if modifiers.shift then return 2 end
    return 1
end

function mouseMoved(buttons, x, y, modifiers)
    self:clearToolTiles()
    if x < 0 or y < 0 or x >= map:width() or y >= map:height() then
        self.ok = false
        return
    end
    self.ok = previewTiles(getDirIndex(modifiers), x, y)
end

function mousePressed(buttons, x, y, modifiers)
    if buttons.left then
        self.cancel = false
        self.x, self.y = x, y
    elseif buttons.right then
        self.cancel = true
    end
end

function mouseReleased(buttons, x, y, modifiers)
    if buttons.left and not self.cancel then
        self.ok = placeTiles(getDirIndex(modifiers))
    end
end
