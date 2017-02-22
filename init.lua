local function mapfix(minp, maxp)
	local vm = minetest.get_voxel_manip(minp, maxp)
	vm:update_liquids()
	vm:write_to_map()
	vm:update_map()
end

local previous = os.time()

local default_size = tonumber(minetest.setting_get("mapfix_default_size")) or 24
local max_size = tonumber(minetest.setting_get("mapfix_max_size")) or 32
local delay = tonumber(minetest.setting_get("mapfix_delay")) or 15

minetest.register_chatcommand("mapfix", {
	params = "<size>",
	description = "Recalculate the flowing liquids and the light of a chunk",
	func = function(name, param)
		local pos = vector.round(minetest.get_player_by_name(name):getpos())
		local size = tonumber(param) or default_size
		local privs = minetest.check_player_privs(name, {server=true})
		local time = os.time()

		if not privs then
			if size > max_size then
				return false, "You need the server privilege to exceed the radius of " .. max_size .. " blocks"
			elseif time - previous < delay then
				return false, "Wait at least " .. delay .. " seconds from the previous \"/mapfix\"."
			end
			previous = time
		end

		size = math.max(math.floor(size - 8), 0) -- When passed to get_voxel_manip, positions are rounded up, to a multiple of 16 nodes in each direction. By subtracting 8 it's rounded to the nearest chunk border. max is used to avoid negative radius.

		local minp = vector.subtract(pos, size)
		local maxp = vector.add(pos, size)

		minetest.log("action", name .. " uses mapfix at " .. minetest.pos_to_string(vector.round(pos)) .. " with radius " .. size)
		mapfix(minp, maxp)
		return true, "Done."
	end,
})
