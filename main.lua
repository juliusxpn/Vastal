local base = "https://raw.githubusercontent.com/juliusxpn/Vastal/main/games/"
local url  = base .. game.PlaceId .. "/script.lua"

local success, result = pcall(function()
    return game:HttpGet(url, true)
end)

if success and result then
    loadstring(result)()
else
    loadstring(game:HttpGet(base .. "universal.lua", true))()
end
