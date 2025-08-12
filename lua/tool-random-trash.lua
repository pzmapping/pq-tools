--[[
    Trash Tool by BeeArr#8231
    https://github.com/TheBeeArr/beearr-tiles-and-tools/
    Licensed under GNU GPL v3

    Used here with permission from BeeArr.
    Modified by Pabbiqo.
    Original rights fully retained.
]]
PLANTS = {
	'trash_01_02',
	'trash_01_03',
	'trash_01_04',
	'trash_01_05',
	'trash_01_06',
	'trash_01_07',
	'trash_01_08',
	'trash_01_09',
	'trash_01_10',
	'trash_01_11',
	'trash_01_12',
	'trash_01_16',
	'trash_01_17',
	'trash_01_18',
	'trash_01_19',
	'trash_01_20',
	'trash_01_21',
	'trash_01_22',
	'trash_01_23',
	'trash_01_24',
	'trash_01_25',
	'trash_01_26',
	'trash_01_27',
	'trash_01_28',
	'trash_01_29',
	'trash_01_30',
	'trash_01_31',
	'trash_01_32',
	'trash_01_33',
	'trash_01_34',
	'trash_01_35',
	'trash_01_36',
	'trash_01_37',
	'trash_01_38',
	'trash_01_39',
	'trash_01_40',
	'trash_01_41',
	'trash_01_42',
	'trash_01_43',
	'trash_01_44',
	'trash_01_45',
	'trash_01_46',
	'trash_01_47',
	'trash_01_48',
	'trash_01_49',
	'trash_01_50',
	'trash_01_51',
	'trash_01_52',
	'trash_01_53',
}

   

LAYERS = {
	'0_FloorOverlay',
	'0_FloorOverlay1',
	'0_FloorOverlay2',
	'0_FloorOverlay3',
	'0_FloorOverlay4',
	'0_FloorOverlay5'
}

function activate()
end

function deactivate()
end

function mouseMoved(buttons, x, y, modifiers)
	self:clearToolTiles()
	if x < 0 or y < 0 or x >= map:width() or y >= map:height() then
		self.ok = false
		return
	end

	CURRENT_PLANT = PLANTS[map:bmp(0):rand(x, y) % #PLANTS + 1]
	local tile = map:tile(CURRENT_PLANT)
	local layerName = pickEmptyLayer(x, y)
	if tile and layerName then
		self.ok = true
		self:setToolTile(layerName, x, y, tile)
	else
		self.ok = false
	end
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
	if buttons.left and self.ok and not self.cancel then
		local layerName = pickEmptyLayer(x, y)
		map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURRENT_PLANT))
		self:applyChanges('Random Trash')
	end
end

function pickEmptyLayer(x, y)
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

