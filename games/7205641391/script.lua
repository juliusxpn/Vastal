if game.PlaceId ~= 7205641391 then
	loadstring(game:HttpGet('https://github.com/juliusxpn/Vastal/raw/refs/heads/main/main.lua', true))()
	return
end

for _, v in ipairs(game.CoreGui:GetDescendants()) do
	if v.Name:find("WindUI") then
		v:Destroy()
	end
end

local can_toggle_auto_player = true

pcall(function()
	makefolder("vastal")
	writefile(
		"vastal/startup.mp3",
		game:HttpGet("https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/7205641391/startup.mp3")
	)
    makefolder('vastal/mmm/cache')
end)

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
	Title  = "Vesta's Autoplayer (2026, Status: " .. status_icon .. ")",
	Icon   = "star",
    Theme  = 'Vast',
	Author = "Created by Vesta (Julius), working for all executors",
	Folder = "VestaAutoPlayer",
	Size   = UDim2.fromOffset(600, 333),
    Radius = 9
})

window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#4278ff"),
    Radius = 13,
})

local mainTab = window:Tab({ Title = "Utility", Icon = "axe" })
pcall(function()
    mainTab:Select()
    window:Divider()
end)
local creditsTab = window:Tab({ Title = "Credits", Icon = "users" })

creditsTab:Button({
    Title = "Vesta (Click to copy LINK)",
    Desc = "Click to copy Vesta's Github",
    Locked = false,
    Callback = function()
        setclipboard('https://github.com/juliusxpn')
    end
})

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

local selected_mode = "4K"
local selected_side
if math.random(1,2) == 1 then
    selected_side = "Left"
else
    selected_side = "Right"
end

local auto_player_enabled = true
local autoplay_toggle

local key_maps = {
    -- Normal FNF
	["4K"] = {
		order = { "Left", "Down", "Up", "Right" },
		keys = {
			Left  = Enum.KeyCode.A,
			Down  = Enum.KeyCode.S,
			Up    = Enum.KeyCode.D,
			Right = Enum.KeyCode.F
		}
	},
    -- EXE: Triple Trouble
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
    -- Shaggy, Revenge
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
    -- Shaggy 2.0 version or whaterver idk
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
    -- Hell
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

mainTab:Dropdown({
	Title = "What side are you playing on?\nThis is ur left: <--\nThis is ur right: -->",
	Values = { "Left", "Right" },
	Value = selected_side,
	Callback = function(v)
        if autoplay_toggle then
            pcall(function()
                autoplay_toggle:Set(false)
                task.wait(0.1)
                autoplay_toggle:Set(true)
            end)
        end
		selected_side = v
	end
})

mainTab:Dropdown({
	Title = "What are your notes?",
	Values = { "4K", "6K", "5K", "7K", "9K" },
	Value = selected_mode,
	Callback = function(v)
		selected_mode = v
	end
})

local Toggle = mainTab:Toggle({
    Title = "Click me to toggle the Autoplayer!",
    Type = "Checkbox",
    Value = true,
    Callback = function(state) 
        can_toggle_auto_player = state
    end
})

autoplay_toggle = mainTab:Toggle({
	Title = "ignore me lol",
	Type = "Checkbox",
	Default = true,
	Callback = function(v)
		auto_player_enabled = v
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

local another_slider_offset = 0
local base_hit_window = 0
local slider_offset = 0

local hit_window_randomizer_slider = mainTab:Slider({
    Title = "Hit window randomizer",
    Desc = "Move the slider! It will change how bad the bot is depending on how high it is.",
    Step = 0.0001,
    Value = { Min = 0, Max = 200, Default = 0 },
    Callback = function(value) another_slider_offset = value end
})

local change_hit_window_slider = mainTab:Slider({
    Title = "Change hit window",
    Desc = "Move the slider! It changes what the distance notes will be hit at. Higher is late, lower is close. 0 for 100 accuracy",
    Step = 0.0001,
    Value = { Min = -200, Max = 200, Default = 0 },
    Callback = function(value) base_hit_window = value end
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
        if can_toggle_auto_player and autoplay_toggle then
            pcall(function()
                autoplay_toggle:Set(false)
                autoplay_toggle:Set(true)
            end)
        elseif autoplay_toggle then
            pcall(function()
                autoplay_toggle:Set(false)
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

local release_delay = 0.02

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

local base_release_delay = 0.05
local release_randomizer = 0

mainTab:Slider({
    Title = "Change Release delay",
    Desc = "How long the bot holds a key before releasing it.\n\n⚠ WARNING: May make you miss.",
    Step = 0.0001,
    Value = {
        Min = 0,
        Max = 5,
        Default = 0.01,
    },
    Callback = function(value)
        base_release_delay = value
    end
})

mainTab:Slider({
    Title = "Release randomizer",
    Desc = "Randomizes release delay every release. 0 = disabled.\n\n⚠ WARNING: May make you miss.",
    Step = 0.0001,
    Value = {
        Min = 0,
        Max = 5,
        Default = 0,
    },
    Callback = function(value)
        release_randomizer = value
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

local make_mistakes = false

mainTab:Toggle({
    Title = "Mistakes.",
    Type = "Checkbox",
    Desc = "When this is toggle the bot will make mistakes if many notes appear at such a time.\n\n⚠ WARNING: May make you miss.",
    Default = false,
    Callback = function(value)
        make_mistakes = value
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

                        if make_mistakes and #notes:GetChildren() > 2 and math.random() < 0.1 then
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

if mainTab and player then
    local hide_cache = get_or_create_cache("cache")
    local hide_enabled = false

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

    mainTab:Toggle({
        Title = "Disable some GUI'S (This prevents SOME lag? But doesn't prevent those huge massive lagspikes.)",
        Type = "Checkbox",
        Default = false,
        Callback = function(state)
            hide_enabled = state
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
