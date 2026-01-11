if game.PlaceId ~= 7205641391 then
	loadstring(game:HttpGet('https://github.com/juliusxpn/Vastal/raw/refs/heads/main/main.lua', true))()
	return
end

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
local vim = clone(game:GetService("VirtualInputManager"))
local players = clone(game:GetService("Players"))
local player = players.LocalPlayer
local coreGui = clone(game:GetService('CoreGui'))

local sound = Instance.new("Sound")
sound.Parent = clone(game:GetService("SoundService"))
sound.SoundId = getcustomasset("vastal/startup.mp3")
sound:Play()

local WindUI = loadstring(game:HttpGet(
	"https://github.com/Footagesus/WindUI/releases/download/1.6.63/main.lua"
))()

local status_link = "https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/" .. game.PlaceId .. "/status.txt"
local status_icon = ""
if game:HttpGet(status_link):find('!true') then
    status_icon = "🟢"
else
    status_icon = "🔴"
end

WindUI:AddTheme({
    Name = "Vast",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#0f0c15"),
    BackgroundTransparency = 0,
    Outline = Color3.fromHex("#3f3f46"),
    Text = Color3.fromHex("#e0e0ff"),
    Placeholder = Color3.fromHex("#7a7a9c"),
    Button = Color3.fromHex("#2c2c3c"),
    Icon = Color3.fromHex("#b0a1ff"),
    Hover = Color3.fromHex("#dcdcff"),
    WindowBackground = Color3.fromHex("#0f0c15"),
    WindowShadow = Color3.fromHex("#000000"),
    DialogBackground = Color3.fromHex("#0f0c15"),
    DialogBackgroundTransparency = 0,
    DialogTitle = Color3.fromHex("#e0e0ff"),
    DialogContent = Color3.fromHex("#ccccff"),
    DialogIcon = Color3.fromHex("#b0a1ff"),
    WindowTopbarButtonIcon = Color3.fromHex("#b0a1ff"),
    WindowTopbarTitle = Color3.fromHex("#e0e0ff"),
    WindowTopbarAuthor = Color3.fromHex("#ccccff"),
    WindowTopbarIcon = Color3.fromHex("#e0e0ff"),
    TabBackground = Color3.fromHex("#1f1b2b"),
    TabTitle = Color3.fromHex("#e0e0ff"),
    TabIcon = Color3.fromHex("#b0a1ff"),
    ElementBackground = Color3.fromHex("#6b6086"),
    ElementTitle = Color3.fromHex("#e0e0ff"),
    ElementDesc = Color3.fromHex("#ccccff"),
    ElementIcon = Color3.fromHex("#b0a1ff"),
    PopupBackground = Color3.fromHex("#0f0c15"),
    PopupBackgroundTransparency = 0,
    PopupTitle = Color3.fromHex("#e0e0ff"),
    PopupContent = Color3.fromHex("#ccccff"),
    PopupIcon = Color3.fromHex("#b0a1ff"),
    Toggle = Color3.fromHex("#2c2c3c"),
    ToggleBar = Color3.fromHex("#b0a1ff"),
    Checkbox = Color3.fromHex("#2c2c3c"),
    CheckboxIcon = Color3.fromHex("#b0a1ff"),
    Slider = Color3.fromHex("#2c2c3c"),
    SliderThumb = Color3.fromHex("#b0a1ff"),
})

local window = WindUI:CreateWindow({
	Title  = "Vastal Autoplayer (2026, Status: " .. status_icon .. ")",
	Icon   = "star",
    Theme  = 'Vast',
	Author = "Created by Vesta (Julius), working for all executors",
	Folder = "VestaAutoPlayer",
	Size   = UDim2.fromOffset(600, 333),
    Radius = 9
})

window:Tag({
    Title = "WIP",
    Color = Color3.fromHex("#4278ff"),
    Radius = 13,
})

local mainTab = window:Tab({ Title = "Utility", Icon = "axe" })
pcall(function()
    mainTab:Select()
    window:Divider()
end)
local configTab = window:Tab({ Title = "Configs", Icon = "save" })
local creditsTab = window:Tab({ Title = "Credits", Icon = "users" })

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
end

local function delete_config(name)
    local path = "vastal/mmm/" .. name .. ".json"
    if isfile(path) then
        delfile(path)
    end
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
                configTab:Notify({
                    Title = "Config Loaded",
                    Content = "Loaded " .. cfg_name .. " successfully!",
                    Duration = 3
                })
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
        configTab:Notify({
            Title = "Config Saved",
            Content = "Saved as " .. name,
            Duration = 3
        })
        
        config_name_value = ""
        
        refresh_config_list()
    end
})

configTab:Divider()
refresh_config_list()

if status_icon == "🔴" then
    local Dialog = window:Dialog({
        Icon = "warning-shield",
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
			Left = Enum.KeyCode.A,
            Down = Enum.KeyCode.S,
            Space = Enum.KeyCode.Space,
            Up = Enum.KeyCode.D,
            Right = Enum.KeyCode.F
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
	Desc  = "Use up scroll!\n\n4K: A S D F\n6K: S D F J K L\n7K: S D F SPACE J K L\n9K: A S D F SPACE J K L ;\n\nAutoplayer doesn't work?\n\n1. 🔴 = no work\n2. Rejoin\n3. Exploit may not support virtual input manager\n4. Contact my github or discord (at my github!)\n5. Or maybe change your note settings, possibly others to default",
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
    Step = 1,
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
