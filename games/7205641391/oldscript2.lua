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
	writefile(
		"vastal/startup.mp3",
		game:HttpGet("https://github.com/juliusxpn/Vastal/raw/refs/heads/main/games/7205641391/startup.mp3")
	)
    makefolder('vastal/mmm/cache')
end)

local clone = (cloneref or clonereference or function(obj) return obj end)
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
	"https://github.com/Footagesus/WindUI/releases/download/"..   "1.6.63"    .."/main.lua"
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
    -- Original was light but my eyes were actually hurting when i was coding this at night time LOL
    Theme  = 'Vast',
	Author = "Created by Vesta (Julius), working for all executors",
	Folder = "VestaAutoPlayer",
	Size   = UDim2.fromOffset(600, 333),
    Radius = 9
})

Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#4278ff"),
    Radius = 13,
})

local mainTab = Window:Tab({ Title = "Utility", Icon = "axe" })
pcall(function()
    mainTab:Select()
    window:Divider()
end)
local creditsTab = window:Tab({ Title = "Credits", Icon = "users" })

local boton = creditsTab:Button({
    Title = "Vesta (Click to copy LINK)",
    Desc = "Click to copy Vesta's Github",
    Locked = false,
    Callback = function()
        setclipboard('https://github.com/juliusxpn')
    end
})

if status_icon == "🔴" then
    local Dialog = Window:Dialog({
    Icon = "warning-shield",
    Title = "Vesta's Autoplayer isn't updated yet!",
    Content = "Are you sure that you want to run? The script will most definitely not work.",
    Buttons = {
        {
                Title = "Yes",
                Callback = function()
                    Dialog = nil
                end,
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

--eh
if math.random(1,2) == 1 then
    local selected_side = "Left"
else
    local selected_side = "Right"
end

local auto_player_enabled = true

mainTab:Dropdown({
	Title = "What side are you playing on?\nThis is ur left: <--\nThis is ur right: -->",
	Values = { "Left", "Right" },
	Value = selected_side,
	Callback = function(v)
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

mainTab:Toggle({
	Title = "Turn on AutoPlayer",
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

if shared.__AUTOPLAYER then shared.__AUTOPLAYER:Disconnect() end

local ArrowGui

player.PlayerGui.DescendantAdded:Connect(function(o)
	if o.Name == "ArrowGui" then
		ArrowGui = o
	end
end)

player.PlayerGui.DescendantRemoving:Connect(function(o)
	if o == ArrowGui then
		ArrowGui = nil
	end
end)

for _, o in ipairs(player.PlayerGui:GetDescendants()) do
	if o.Name == "ArrowGui" then
		ArrowGui = o
		break
	end
end

local function get_target_gui()
	return ArrowGui and ArrowGui:FindFirstChild("Title")
end

-- Change these if you want ig
local function get_offset(m)
	if m == "4K" or m == "7K" then
		return 90
	elseif m == "6K" then
		return 80
	else
		return 75
	end
end

-- Add your own keys or customize the keybinds! 
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

local function get_lane_container(name)
	if not ArrowGui then return end
	local side = ArrowGui:FindFirstChild(selected_side)
	return side and side:FindFirstChild("Notes") and side.Notes:FindFirstChild(name)
end

local function get_hold_container(name)
	if not ArrowGui then return end
	local side = ArrowGui:FindFirstChild(selected_side)
	return side and side:FindFirstChild("LongNotes") and side.LongNotes:FindFirstChild(name)
end

-- Stupid and old... I think
local function is_opponent(n)
	local a = n.Name:lower()
	local b = n.Parent and n.Parent.Name:lower() or ""
	return a:find("opp") or b:find("opp")
end

local active_holds = {}
local keys_pressed = {}

-- absolute position indexed nil?
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
				vim:SendKeyEvent(true, key, false, game)
				keys_pressed[lane] = true
				active_holds[lane] = new_hold
			end
		elseif active_holds[lane] then
			vim:SendKeyEvent(false, key, false, game)
			keys_pressed[lane] = nil
			active_holds[lane] = nil
		end

		if not active_holds[lane] then
			for _, n in ipairs(notes:GetChildren()) do
				if n:IsA("GuiObject") and not is_opponent(n) then
					local c = n.AbsolutePosition.Y + n.AbsoluteSize.Y / 2
					if c >= target_y and c <= target_bottom then
						vim:SendKeyEvent(true, key, false, game)
						vim:SendKeyEvent(false, key, false, game)
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

-- Doesn't work guess i suck at code lol
task.spawn(function()
    for _, v in ipairs(game.CoreGui:GetDescendants()) do
        if v.Name:find('WindUI') then
            repeat task.wait() until not v
            local hide_cache = get_or_create_cache("cache")
            local hide_enabled = false
            if shared.__AUTOPLAYER then shared.__AUTOPLAYER:Disconnect() shared.__AUTOPLAYER = nil end
        end
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
        Title = "Hide Notes/HUD Elements",
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
