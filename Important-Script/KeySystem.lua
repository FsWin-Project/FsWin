local UtilisatorName = "FsWin-Project"
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/"..UtilisatorName.."/FsWin/Important-Script/Ui/Script-Loading/Main.Lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/"..UtilisatorName.."/FsWin/Important-Script/Ui/Script-Loading/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/"..UtilisatorName.."/FsWin/Important-Script/Ui/Script-Loading/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local PlayerId = LocalPlayer.UserId
local Hwid = gethwid()

local function Notify(title, content, duration)
    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = duration
    })
end

local function JoinDiscord()
    local inviteCode = "hPKhDaP62z"
    local http_request = (syn and syn.request) or (http and http.request) or request

    if http_request then
        http_request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                args = { code = inviteCode },
                nonce = HttpService:GenerateGUID(false)
            })
        })
         Notify("Exploit supported", "Discord link copied too.", 5)
        setclipboard(inviteCode)
    else
        Notify("Unsupported Exploit", "Your exploit doesn't support Discord RPC. The invite link has been copied.", 5)
        setclipboard(inviteCode)
    end
end

local Window = Fluent:CreateWindow({
    Title = "FsWin " .. Fluent.Version,
    SubTitle = "by After x",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Humanoid = Window:AddTab({ Title = "Humanoid", Icon = "person-standing" }),
    ServerUtility = Window:AddTab({ Title = "Server Utility", Icon = "wrench" }),
    ClientUtility = Window:AddTab({ Title = "Client Utility", Icon = "hammer" }),
    Troll = Window:AddTab({ Title = "Troll", Icon = "alert-triangle" }),
    Animator = Window:AddTab({ Title = "Animation", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Tabs.Info:AddParagraph({
    Title = "What is FsWin?",
    Content = "FsWin is a Roblox cheat script with multiple utilities, created by After x."
})

Tabs.Info:AddParagraph({
    Title = "Why use FsWin?",
    Content = "FsWin offers custom features, a clean interface, and more."
})

Tabs.Info:AddParagraph({
    Title = "Is FsWin detectable?",
    Content = "FsWin itself is not detectable, but your executor might be. Use it at your own risk."
})

Tabs.Info:AddParagraph({
    Title = "Need help? Join our Discord!",
    Content = "We are not responsible for what happens on Discord."
})

Tabs.Info:AddButton({
    Title = "Join now!",
    Description = "Opens the official FsWin Discord link.",
    Callback = JoinDiscord
})

local HumanoidSpeedSlider = Tabs.Humanoid:AddSlider("Humanoid Speed", {
    Title = "Humanoid Speed",
    Description = "Adjust your character speed.",
    Default = 16,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end
})

local HumanoidSpeedSlider = Tabs.Humanoid:AddSlider("Humanoid Speed", {
    Title = "Humanoid JumpPower",
    Description = "Adjust your character Jump Power.",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        if Humanoid then
            Humanoid.JumpPower = Value
        end
    end
})



HumanoidSpeedSlider:SetValue(16)
local NoclipConnection = nil
local NoclipActive = false

local function EnableNoclip()
    NoclipActive = true
    local Player = game.Players.LocalPlayer

    NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
        if Player.Character and NoclipActive then
            for _, part in ipairs(Player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function DisableNoclip()
    NoclipActive = false
    if NoclipConnection then
        NoclipConnection:Disconnect()
        NoclipConnection = nil
    end
end

local Noclip = Tabs.Humanoid:AddToggle("Noclip", {
    Title = "Noclip",
    Default = false,
    Callback = function(state)
        if state then
            EnableNoclip()
        else
            DisableNoclip()
        end
    end
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local GodmodeConnection

local function EnableGodmode()
    GodmodeConnection = RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") and v.Name:lower() == "hitbox" then
                    v:Destroy()
                end
            end
        end
    end)
end

local function DisableGodmode()
    if GodmodeConnection then
        GodmodeConnection:Disconnect()
        GodmodeConnection = nil
    end
end

local Godmode = Tabs.Humanoid:AddToggle("Godmode", {
    Title = "Godmode",
    Default = false,
    Callback = function(state)
        if state then
            EnableGodmode()
        else
            DisableGodmode()
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function SetInvisible(state)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    for _, part in ipairs(Character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") or part:IsA("Texture") then
            part.Transparency = state and 1 or 0
        elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
            part.Handle.Transparency = state and 1 or 0
        end
    end
end

local InvisibilityToggle = Tabs.Humanoid:AddToggle("Invisibility", {
    Title = "Invisibility",
    Default = false,
    Callback = function(state)
        SetInvisible(state)
    end
})



 Options.InvisibilityToggle:SetValue(false)

local InfiniteJump = Tabs.Humanoid:AddToggle("Infinite Jump", {
    Title = "Infinite jump",
    Default = false,
    Callback = function(state)

    end
})

 Options.InfiniteJump:SetValue(false)


 Tabs.ServerUtility:AddButton({
        Title = "Surpware(Chat bypasser)",
        Description = "Script to bypass Roblox chat moderation security",
        Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisAintComputin/SurpOfficial/refs/heads/main/surpware/scriptcache.lua"))()
        end
})

Tabs.ServerUtility:AddButton({
        Title = "Flying",
        Description = "Allows you to flying (Be careful, this script can be detected)",
        Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/"..UtilisatorName.."/FsWin/Utility/Server-Utility/Flying.lua"))()       
   end
})

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ClickTPEnabled = false

local ClickTP = Tabs.ServerUtility:AddToggle("ClickTP", {
    Title = "Click TP",
    Default = false,
    Callback = function(state)
        ClickTPEnabled = state
    end
})

Mouse.Button1Down:Connect(function()
    if ClickTPEnabled then
        local target = Mouse.Hit
        if target then
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character:MoveTo(target.Position)
            end
        end
    end
end)


 Options.ClickTP:SetValue(false)


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
