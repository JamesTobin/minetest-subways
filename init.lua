local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

local lines = {
	"#ff1111",
	"#1111ff",
	"#ff9900",
	"#11ff11",
	"#9900ff",
	"#00ffff",
	"#ff9999",
	"#ff00ff",
	"#99ff00",
}

local function set_livery(self, puncher, itemstack,data)
	local meta = itemstack:get_meta()
	local color = meta:get_string("paint_color")
	local alpha = tonumber(meta:get_string("alpha"))
	if color and color:find("^#%x%x%x%x%x%x$") then
		data.livery = self.base_texture.."^("..self.base_livery.."^[colorize:"..color..":255)"
		data.door = self.door_texture.."^("..self.door_livery.."^[colorize:"..color..":255)"
		self:set_textures(data)
	end
end

local function	set_textures(self, data)
	if data.livery then
		self.object:set_properties({
				textures={data.livery, "green_subway_wagon_interior.png", data.door, "green_subway_wagon_seat.png"}
		})
	end
end

advtrains.register_wagon("green_subway_wagon", {
    mesh="green_subway_wagon.b3d",
    textures={
		"green_subway_wagon.png",
		"green_subway_wagon_interior.png",
		"green_subway_wagon_door.png",
		"green_subway_wagon_seat.png",
	},
    base_texture = "green_subway_wagon.png",
    base_livery = "green_subway_wagon_livery.png",
    door_texture = "green_subway_wagon_door.png",
    door_livery = "green_subway_wagon_door_livery.png",
    set_textures = set_textures,
    set_livery = set_livery,
    drives_on={default=true},
    max_speed=15,
    seats={
		{
			name="Driver stand",
			attach_offset={x=-4, y=0.5, z=18},
			view_offset={x=0, y=0.5, z=0},
			group="driver_stand",
		},
        {
			name="1",
			attach_offset={x=-4, y=0.5, z=10},-- 10
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="2",
			attach_offset={x=-4, y=0.5, z=8},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="3",
			attach_offset={x=-4, y=0.5, z=0},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="4",
			attach_offset={x=-4, y=0.5, z=-8},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="5",
			attach_offset={x=-4, y=0.5, z=-18},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="6",
			attach_offset={x=-4, y=0.5, z=-24},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="7",
			attach_offset={x=-4, y=0.5, z=8},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="8",
			attach_offset={x=-4, y=0.5, z=0},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="9",
			attach_offset={x=-4, y=0.5, z=-8},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="10",
			attach_offset={x=-4, y=0.5, z=-18},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
		{
			name="11",
			attach_offset={x=-4, y=0.5, z=-24},
			view_offset={x=0, y=0.5, z=0},
			group="passenger",
		},
    },
    seat_groups = {
		driver_stand={
			name = "Driver Stand",
			access_to = {"passenger"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
        passenger={
			name = "Passenger Area",
			access_to = {"driver_stand"},
			require_doors_open=true,
		},
	},
    assign_to_seat_group={"passenger", "driver_stand"},
    door_entry={-1, 1},
	doors={
		open={
			[-1]={frames={x=0, y=20}, time=1},
			[1]={frames={x=40, y=60}, time=1}
		},
		close={
			[-1]={frames={x=20, y=40}, time=1},
			[1]={frames={x=60, y=80}, time=1}
		}
	},
    is_locomotive=true,
    visual_size={x=1, y=1},
	wagon_span=3,
	collisionbox = {
		-1.0, -0.5, -1.0,
		1.0, 2.5, 1.0
	},
}, attrans("Green Subway Car"), "green_subway_wagon_inv.png")
