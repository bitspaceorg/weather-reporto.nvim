-- Define a function to fetch information from a URL
local function fetch(lat, lon)
	--lat and lon are strings
	local url = "\"https://weather-api-support.vercel.app/?long=" .. lon .. "&lat=" .. lat .. "\""

	-- Use the system function to make a curl request to the URL
	local handle = io.popen("curl -s " .. url)
	local response = handle:read("*a")
	handle:close()
	-- Check if the request was successful (non-empty response)
	if response and response ~= "" then
		-- Return the response body (HTML content)
		-- Define a regex pattern to match HTML tags and extract their content
		local p1 = '"temperature":(.-),"'
		local p2 = '"weathercode":(.-),"'
		local p3 = '"is_day":(.-),"'

		-- Create a table to store the extracted data
		local parsed_data = {}
		-- Loop through the response and apply the regex pattern
		for match in response:gmatch(p1) do
			-- Add the extracted content to the parsed_data table
			parsed_data.temp = match
                        break
		end

		for match in response:gmatch(p2) do
			-- Add the extracted content to the parsed_data table
			parsed_data.condition = match
                        break
		end

		for match in response:gmatch(p3) do
			-- Add the extracted content to the parsed_data table
			parsed_data.isday = match
                        break
		end
		return parsed_data
	else
		print("Failed to fetch data from " .. url)
		return { temp = " ", condition = " ", isday = " " }
	end
end

return fetch
