-- Define a function to fetch information from a URLs
--
local fetchdata = require("weather.functions")
local icons = require("weather.devicons")
local math = require("math")

-- struct defaults
-- city : string
-- country : string
-- celsius : bool
-- displaycityname  : bool
--
--
-- struct contenot
-- condition : string
-- temp

local defaults = {
	latitude = "84.2044",
	longitude = "41.3220",
	celsius = false,
}

local content = {}

function content.setup(opts)
	opts = opts or {}
	for k, v in pairs(defaults) do
		if opts[k] == nil then
			opts[k] = v
		end
	end

	content.feed = fetchdata.fetch(opts.latitude, opts.longitude)
	local mg = function(x)
		return string.format("%s", x)
	end
	local arg = content.feed
	-- when there is no internet
	if arg.errcode == 2 then
		content.feed = {
			celtemp = "󱍢",
			temp = "󱍢",
		}
		content.kfeed = "󱍢"
		content.strfeed = "󱍢"
		content.cond = "󱍢"
		print("Err 404 : Failed to fetch info")
		-- when there is internal error
	elseif arg.errcode == 3 then
		content.feed = {
			celtemp = "",
			temp = "",
		}
		content.kfeed = ""
		content.strfeed = ""
		content.cond = ""
		print("Err 500 : Internal Error")
	else
		local fweathercode = icons[tonumber(arg.condition)]
		content.cond = fweathercode[1]
		arg.celtemp = math.floor(tonumber(arg.temp))
		arg.temp = math.floor((9 / 5) * (tonumber(arg.temp))) + 32

		-- if celsius is true , it will concatenate celsius temp , else farenheit temp --
		content.strfeed = fweathercode[tonumber(arg.isday) + 2]
			.. " "
			.. ((opts.celsius and mg(arg.celtemp)) or mg(arg.temp))
			.. ((opts.celsius and "°C ") or "°F ")
			.. " "
		content.kfeed = " "
			.. tostring(arg.temp + 241)
			.. "K "
			.. fweathercode[tonumber(arg.isday) + 2]
			.. " "
			.. fweathercode[1]
	end
end

return content
