-- Define a function to fetch information from a URL
local function fetch(lat, lon)
	--lat and lon are strings
	local url = '"https://weather-api-support.vercel.app/?long=' .. lon .. "&lat=" .. lat .. '"'

	-- Check if the request was successful (non-empty response)
	local status, err = pcall(function()
		io.popen("curl -s " .. url)
	end) -- error handling

	if status == true then
		-- Use the system function to make a curl request to the URL
		local handle = io.popen("curl -s " .. url)
		local response = handle:read("*a")
		handle:close()
		-- Return the response body (HTML content)
		-- Define a regex pattern to match HTML tags and extract their content
		local p1 = ',"temperature":([-]?[0-9.]*),'
		local p2 = ',"weathercode":([0-9.]*)}'
		local p3 = ',"is_day":([01]),"'

		-- Create a table to store the extracted data
		local parsed_data = {}
		-- Loop through the response and apply the regex pattern
		for match in response:gmatch(p1) do
			-- Add the extracted temperature to the parsed_data table
			parsed_data.temp = match
			break
		end

		for match in response:gmatch(p2) do
			-- Add the extracted weather condition to the parsed_data table
			parsed_data.condition = match
			break
		end

		for match in response:gmatch(p3) do
			-- Add the extracted daytime to the parsed_data table
			parsed_data.isday = match
			break
		end
		if tonumber(parsed_data.temp) == nil then
			return { temp = "", condition = "", isday = "", errcode = 3 }
		end
		return parsed_data
	else
		return { temp = " ", condition = " ", isday = " ", errcode = 2 }
	end
end

local module = {}
module.fetch = fetch
return module
