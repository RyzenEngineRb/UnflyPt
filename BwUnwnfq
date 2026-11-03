-- Не удивляйтесь что нашли опен сурс скрипта, мои проекты изночально были опен сурс а ключ система сделана для поддержки и мотивации, дабы скрипты почаще обновлялись и я о них не забывал(:

do
	local g = (getgenv and getgenv()) or _G
	local HttpService = game:GetService("HttpService")
	local Players = game:GetService("Players")
	local LP = Players.LocalPlayer
	local API = "https://unflytm.vercel.app/api"
	local LOADER_URL = "https://raw.githubusercontent.com/RyzenEngineRb/QnAmeAplKnanKsbWRgs/refs/heads/main/Loader"
	local KEYFILE = "UnflyProject/key.txt"
	local MSG = "похоже вы не получили ключ):\nзагрузите лоудер нажмите гет кей и получить ключ на сайте!"

	local function trim(s)
		return (tostring(s or ""):match("^%s*(.-)%s*$")) or ""
	end
	local function http(url)
		local ok, body = pcall(function()
			if syn and syn.request then return syn.request({ Url = url, Method = "GET" }).Body end
			if http_request then return http_request({ Url = url, Method = "GET" }).Body end
			if request then return request({ Url = url, Method = "GET" }).Body end
			return game:HttpGet(url)
		end)
		return ok and body or nil
	end
	local function encode(s)
		s = tostring(s or "")
		if HttpService.UrlEncode then return HttpService:UrlEncode(s) end
		return (s:gsub("([^%w%-_%.~])", function(c) return string.format("%%%02X", string.byte(c)) end))
	end
	local function readKey()
		local k = trim(g.__unfly_key)
		if k ~= "" then return k end
		if isfile and readfile then
			local ok, ex = pcall(function() return isfile(KEYFILE) end)
			if ok and ex then
				local ok2, data = pcall(readfile, KEYFILE)
				if ok2 then return trim(data) end
			end
		end
		return ""
	end
	local function saveKey(k)
		k = trim(k)
		if k == "" then return end
		g.__unfly_key = k
		if writefile then
			pcall(function()
				if makefolder and not isfolder("UnflyProject") then makefolder("UnflyProject") end
				writefile(KEYFILE, k)
			end)
		end
	end
	local function checkKey(key)
		key = trim(key)
		if key == "" then return false end
		local body = http(API .. "?action=check&key=" .. encode(key) .. "&t=" .. tostring(os.time()))
		if not body then return false end
		local ok, data = pcall(function() return HttpService:JSONDecode(tostring(body)) end)
		if ok and type(data) == "table" then
			if data.ok == true or data.valid == true or data.status == "valid" then return true end
			if (tonumber(data.expires_in) or 0) > 0 then return true end
		end
		return string.lower(tostring(body)):find('"ok":true', 1, true) ~= nil
	end
	local function openLoader()
		warn(MSG)
		local src = http(LOADER_URL)
		if not src or #tostring(src) < 40 then
			pcall(function() LP:Kick(MSG) end)
			error(MSG, 0)
		end
		local fn = loadstring(src)
		if not fn then
			pcall(function() LP:Kick(MSG) end)
			error(MSG, 0)
		end
		pcall(fn)
		error(MSG, 0)
	end

	local key = readKey()
	if not (key ~= "" and checkKey(key)) then
		openLoader()
	end
	saveKey(key)
	g.__unfly_ok = true
	g.__unfly_from_launcher = true
	g.__unfly_key = trim(key)
	g.__unfly_session = os.time()
	print("[BwUnwnfq] key ok")
end



local env = (getgenv and getgenv()) or shared or _G

if env.UnflySplashActive then
    return
end
env.UnflySplashActive = true

pcall(function() local m=(getgenv and getgenv() or _G).__unfly_mark if m then m("feature") end end)
local SupportedGames = {
    [142823291] = {
        Name = "Murder Mystery 2",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Mjandk"
    },

    [14437001043] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [14896802601] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [16667550979] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [140260816701736] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [14908286297] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [124095328182831] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Rh7mQw"
    },
    [18687417158] = {
        Name = "Forsaken",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/NeverClouse/refs/heads/main/Kx9vNp"
    },
}

local TweenService = game:GetService("TweenService")
local HttpService   = game:GetService("HttpService")
local Players        = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")

local existing = PlayerGui:FindFirstChild("UnflySplash")
if existing then
    existing:Destroy()
end

local Theme = {
    Panel   = Color3.fromRGB(14, 14, 16),
    PanelLo = Color3.fromRGB(8, 8, 9),
    PanelHi = Color3.fromRGB(26, 26, 29),
    Line    = Color3.fromRGB(48, 48, 54),
    Ring    = Color3.fromRGB(230, 230, 235),
    RingDim = Color3.fromRGB(60, 60, 66),
    Text    = Color3.fromRGB(235, 235, 240),
    Dim     = Color3.fromRGB(150, 150, 158),
    Font    = Enum.Font.GothamSemibold,
    FontBody = Enum.Font.Gotham,
}

local TITLE      = "UnflyProject"
local AVATAR_URL = "https://raw.githubusercontent.com/RyzenEngineRb/UnflyPt/refs/heads/main/1793378326704.jpg"

local function new(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do inst[k] = v end
    for _, c in ipairs(children or {}) do c.Parent = inst end
    return inst
end

local function tween(inst, info, props)
    local t = TweenService:Create(inst, info, props)
    t:Play()
    return t
end

local W, H = 340, 220

local ScreenGui = new("ScreenGui", {
    Name = "UnflySplash",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 1000,
    IgnoreGuiInset = true,
})
ScreenGui.Parent = PlayerGui

local Main = new("Frame", {
    Size = UDim2.fromOffset(W, H),
    Position = UDim2.new(0.5, -W / 2, 0.5, -H / 2),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ClipsDescendants = true,
})
Main.Parent = ScreenGui
new("UICorner", { CornerRadius = UDim.new(0, 12) }).Parent = Main
local MainStroke = new("UIStroke", { Color = Theme.Line, Thickness = 1, Transparency = 1 })
MainStroke.Parent = Main

local Gradient = new("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.PanelLo),
        ColorSequenceKeypoint.new(0.5, Theme.PanelHi),
        ColorSequenceKeypoint.new(1, Theme.PanelLo),
    }),
    Rotation = 45,
})
Gradient.Parent = Main
task.spawn(function()
    while Main.Parent do
        tween(Gradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = 225 })
        task.wait(3)
        tween(Gradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = 45 })
        task.wait(3)
    end
end)

local AvatarRing = new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 24),
    Size = UDim2.fromOffset(72, 72),
    BackgroundColor3 = Theme.PanelLo,
    BorderSizePixel = 0,
})
new("UICorner", { CornerRadius = UDim.new(1, 0) }).Parent = AvatarRing
local AvatarStroke = new("UIStroke", { Color = Theme.Line, Thickness = 1.5, Transparency = 0.2 })
AvatarStroke.Parent = AvatarRing
AvatarRing.Parent = Main

local AvatarImage = new("ImageLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(1, -6, 1, -6),
    BackgroundTransparency = 1,
    Image = "",
    ImageTransparency = 1,
})
new("UICorner", { CornerRadius = UDim.new(1, 0) }).Parent = AvatarImage
AvatarImage.Parent = AvatarRing

task.spawn(function()
    if not (HttpService and game.HttpGet and getcustomasset and writefile and isfile) then
        return
    end
    local ok, result = pcall(function()
        local data = game:HttpGet(AVATAR_URL)
        local fileName = "UnflySplashAvatar.jpg"
        writefile(fileName, data)
        return getcustomasset(fileName)
    end)
    if ok and result then
        AvatarImage.Image = result
        tween(AvatarImage, TweenInfo.new(0.4), { ImageTransparency = 0 })
    end
end)

new("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 104),
    Size = UDim2.new(1, -30, 0, 20),
    BackgroundTransparency = 1,
    Font = Theme.Font,
    Text = TITLE,
    TextColor3 = Theme.Text,
    TextSize = 16,
    TextTransparency = 1,
}).Parent = Main

local SubLabel = new("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 126),
    Size = UDim2.new(1, -30, 0, 30),
    BackgroundTransparency = 1,
    Font = Theme.FontBody,
    Text = "ID check...",
    TextColor3 = Theme.Dim,
    TextSize = 11,
    TextWrapped = true,
    TextTransparency = 1,
})
SubLabel.Parent = Main

local SpinnerHolder = new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 165),
    Size = UDim2.fromOffset(28, 28),
    BackgroundTransparency = 1,
})
SpinnerHolder.Parent = Main

local SpinnerRingBase = new("ImageLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Image = "rbxasset://textures/ui/InspectMenu/icon_loading.png",
    ImageTransparency = 1,
    ImageColor3 = Theme.RingDim,
})
SpinnerRingBase.Parent = SpinnerHolder

local Spinner = new("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
})
Spinner.Parent = SpinnerHolder

do
    local SEGMENTS = 8
    for i = 1, SEGMENTS do
        local angle = (i - 1) * (360 / SEGMENTS)
        local dot = new("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(4, 4),
            BackgroundColor3 = Theme.Ring,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        })
        new("UICorner", { CornerRadius = UDim.new(1, 0) }).Parent = dot
        local radius = 13
        local rad = math.rad(angle)
        dot.Position = UDim2.new(0.5, math.cos(rad) * radius, 0.5, math.sin(rad) * radius)
        dot:SetAttribute("Order", i)
        dot.Parent = Spinner
    end
end

task.spawn(function()
    local dots = Spinner:GetChildren()
    while Spinner.Parent do
        for _, dot in ipairs(dots) do
            local order = dot:GetAttribute("Order") or 1
            task.delay((order - 1) * 0.07, function()
                if dot.Parent then
                    tween(dot, TweenInfo.new(0.3), { BackgroundTransparency = 0 })
                    task.delay(0.3, function()
                        if dot.Parent then
                            tween(dot, TweenInfo.new(0.5), { BackgroundTransparency = 1 })
                        end
                    end)
                end
            end)
        end
        task.wait(0.8)
    end
end)

tween(Main, TweenInfo.new(0.4), { BackgroundTransparency = 0 })
tween(MainStroke, TweenInfo.new(0.4), { Transparency = 0.2 })
for _, label in ipairs(Main:GetChildren()) do
    if label:IsA("TextLabel") then
        tween(label, TweenInfo.new(0.4), { TextTransparency = 0 })
    end
end

local function closeSplash()
    tween(Main, TweenInfo.new(0.5), { BackgroundTransparency = 1 })
    tween(MainStroke, TweenInfo.new(0.5), { Transparency = 1 })
    for _, label in ipairs(Main:GetDescendants()) do
        if label:IsA("TextLabel") or label:IsA("ImageLabel") or label:IsA("Frame") then
            pcall(function() tween(label, TweenInfo.new(0.5), { BackgroundTransparency = 1 }) end)
            pcall(function() tween(label, TweenInfo.new(0.5), { TextTransparency = 1 }) end)
            pcall(function() tween(label, TweenInfo.new(0.5), { ImageTransparency = 1 }) end)
        end
    end
    task.wait(0.5)
    ScreenGui:Destroy()
    env.UnflySplashActive = false
end

task.spawn(function()
    task.wait(1.5)
    SubLabel.Text = "Checking game support..."
    task.wait(1.5)

    local currentPlaceId = game.PlaceId
    local gameData = SupportedGames[currentPlaceId]

    if gameData then
        SubLabel.Text = "The game is supported, loading the script, please wait a bit..."
        task.wait(2)

        SubLabel.Text = "Success! Uploading the script to " .. gameData.Name
        task.wait(1.5)

        closeSplash()

        if gameData.ScriptUrl and gameData.ScriptUrl ~= "" then
            pcall(function()
                (function(...) pcall(function() local m=(getgenv and getgenv() or _G).__unfly_mark if m then m("ui") m("loop") end end) return loadstring(...) end)(game:HttpGet(gameData.ScriptUrl))()
            end)
        end
    else
        SubLabel.Text = "Unfortunately, this game is not supported."
        task.wait(2)
        closeSplash()
        LocalPlayer:Kick("This game is not supported, we apologize for the inconvenience.")
    end
end)
