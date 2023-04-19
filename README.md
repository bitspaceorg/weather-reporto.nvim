<div align="center">
    <img src="https://cdn.discordapp.com/attachments/1098174922951495680/1098174923232510002/Bit_Space.png" width="100" alt="Logo"/><br/>
    <h1 align="center">Weather-Reporto.nvim</h1>
  <img src="https://img.shields.io/github/downloads/t-aswath/Weather-Reporto.nvim/total.svg" width="200"/>
  <img src="https://img.shields.io/badge/Editor%20Config-E0EFEF?style=for-the-badge&logo=editorconfig&logoColor=000"/>
  <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>
  <img src="https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black"/>
    <h3>Bring Weather Forecasts to Your Neovim Editor for Ultimate Productivity</h3>
</div>



weather-reporto.nvim is a sleek and efficient Neovim plugin that brings weather forecasts right to your editor, empowering you to stay informed and productive no matter the weather conditions. With weather.nvim, you can seamlessly integrate weather information into your Neovim workflow, helping you plan your day, stay organized, and optimize your productivity.

Featuring a simple and intuitive interface, weather-reporto.nvim provides up-to-date weather forecasts for your desired location, giving you real-time information on temperature and weather condition. The plugin is highly customizable, allowing you to configure the appearance and behavior to suit your preferences.

With weather-reporto.nvim, you'll never be caught off guard by sudden weather changes again. Stay ahead of the weather and plan your tasks accordingly, all without leaving your editor. Whether you're a developer, writer, or just someone who wants to stay informed, weather-reporto.nvim is your ultimate productivity companion for Neovim.

Install weather-reporto.nvim from GitHub at github.com/bitspaceorg/weather-reporto.nvim and experience the convenience and efficiency of having weather forecasts at your fingertips in Neovim. Stay productive, rain or shine!

# Requirements

-> [cURL](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux)

-> [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

-> [Nerdfonts](https://www.nerdfonts.com)

# Install

### Packer
```lua
use ('bitspaceorg/weather-reporto.nvim')
```

### Vim-plug
```lua
Plug 'bitspaceorg/weather-reporto.nvim'
```

# How to use

After adding our plugin to your Neovim Config

This plugins works only when `setup` file  is called
```lua
-- provide the latitude and longitude of the location as string values 
require("weather").setup({
	latitude = "12.12345",   
	longitude = "34.12345",  
	celsius = true,          -- default farenheit
})
```

Here is a example were we are about to use our plugin in Dashboard and Status line

so, we have to call our plugin config file before dashboard and statusline config

![image_2023-04-19_131816009 (1)](https://user-images.githubusercontent.com/119417646/233014626-27ac0f59-39a5-4cec-9b39-fe488af254e2.jpg)

**Dashboard**

Now lets display weather in our dashboard

```lua 
local var = require("weather") -- add this at the top of the file
```
Now 

`var.strfeed` is gonna give as temperature 

`var.cond`    is gonna give as weather condition 

you can use this variable were ever you want in your dashboard config.

**Status line**

Similarly you can do in your status line config 

Specify in which section of your status line you want to have weather

> lualine.nvim

here is example were I use our plugin in status line (lualine)

<img width="318" alt="image" src="https://user-images.githubusercontent.com/119417646/233025558-3903e057-9df5-416d-9b25-54b13292baba.png">

we need to write a small funtion as in above image in lualine config to work .

```lua
local var = require("weather")

local line = function()
	return var.strfeed
end
```

> feline

In feline there is no need to create such function as in lualine by just calling our plugin in your feline config and specify in which part you want to disply.
```lua
--example
local c = {
    weather_reporto = {
        provider = var.cond, 
        icon = {
            str = var.strfeed,
        },
        hl = {
            fg = "#8f96a0",
            bg = "#0c0e18",
            style = "bold"
        },
    }
}
local left = {}

local middle = {
    c.weather_reporto,
}

local right = {}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        middle
    },
}

feline.setup({
    components = components,
})
```

# Screeshots

>lualine

![image](https://user-images.githubusercontent.com/119417646/233079492-ebbedf0d-961b-46a1-8d6f-61c6751283f9.png)
<img width="946" alt="image" src="https://user-images.githubusercontent.com/119417646/233091534-a6077bd8-13c9-403d-acc3-da91a5f76656.png">

>feline

![image](https://user-images.githubusercontent.com/119417646/233079588-5e15b3c3-4da0-48fb-9a5e-6aaebb225911.png)

<img src="https://user-images.githubusercontent.com/119417646/233079656-2cb49e4b-8290-4d2e-9f5d-4a7b37e1d038.png" width=200/> <img src="https://user-images.githubusercontent.com/119417646/233079679-281c134f-2874-4160-9dc8-ab390a3ea8e5.png" width=205/>

<img src="https://user-images.githubusercontent.com/119417646/233079697-58abbed3-48d0-4e1a-b36f-d6a097b6f0f2.png" width=200/> <img src="https://user-images.githubusercontent.com/119417646/233079721-e8ee7424-6406-4ec8-bfc5-3bd84b170beb.png" width=210/>


>Dashboard

<img src="https://user-images.githubusercontent.com/119417646/233080586-38f36947-6666-4f9b-b2bc-9c2b563100c1.png" width=500/>

<img src="https://user-images.githubusercontent.com/119417646/233082680-44fb5b11-5a36-4d7f-b720-19e92932c4fd.png" width=500/>

\
