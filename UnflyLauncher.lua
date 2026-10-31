local env = (getgenv and getgenv()) or shared or _G

if env.UnflySplashActive then
    return
end
env.UnflySplashActive = true

local SupportedGames = {
    [142823291] = {
        Name = "Murder Mystery 2",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/Script.lua/refs/heads/main/Unfly_mm2.lua"
    },
    -- Residence Massacre (lobby / worlds)
    [14437001043] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/Script.lua/refs/heads/main/ResidenceHorror.lua"
    },
    [14896802601] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/Script.lua/refs/heads/main/ResidenceHorror.lua"
    },
    [16667550979] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/Script.lua/refs/heads/main/ResidenceHorror.lua"
    },
    [140260816701736] = {
        Name = "Residence Massacre",
        ScriptUrl = "https://raw.githubusercontent.com/RyzenEngineRb/Script.lua/refs/heads/main/ResidenceHorror.lua"
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
                loadstring(game:HttpGet(gameData.ScriptUrl))()
            end)
        end
    else
        SubLabel.Text = "Unfortunately, this game is not supported."
        task.wait(2)
        closeSplash()
        LocalPlayer:Kick("This game is not supported, we apologize for the inconvenience.")
    end
end)
