local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local TPButton = Instance.new("TextButton")
local ESPFrame = Instance.new("Frame")
local ESPToggle = Instance.new("TextButton")
local ESPColor = Instance.new("TextButton")
local ESPStatusBox = Instance.new("Frame")  -- ESP Durum Kutusu
local TPFrame = Instance.new("Frame")
local PlayerDropdown = Instance.new("TextButton")
local TPToPlayer = Instance.new("TextButton")
local DeveloperLabel = Instance.new("TextLabel")
local PlayerMenuFrame = Instance.new("Frame")  -- TP Oyuncu Seçme Menüsü

-- GUI Özellikleri
ScreenGui.Parent = game.CoreGui  -- CoreGui'ye eklendiği yer
ScreenGui.ResetOnSpawn = false -- Bu, GUI'nin her respawn sonrası kaybolmasını engeller

MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Parent = ScreenGui

-- Başlık Barı
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TitleBar.Parent = MainFrame

TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Text = "Hile"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = TitleBar

CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Parent = TitleBar

MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
MinimizeButton.Parent = TitleBar

-- Butonlar
ESPButton.Size = UDim2.new(0, 180, 0, 30)
ESPButton.Position = UDim2.new(0, 10, 0, 40)
ESPButton.Text = "ESP"
ESPButton.Parent = MainFrame

TPButton.Size = UDim2.new(0, 180, 0, 30)
TPButton.Position = UDim2.new(0, 10, 0, 80)
TPButton.Text = "TP"
TPButton.Parent = MainFrame

-- ESP Menüsü
ESPFrame.Size = UDim2.new(0, 180, 0, 70)
ESPFrame.Position = UDim2.new(1, 10, 0, 0)  -- Ana menünün yanında açılacak
ESPFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ESPFrame.Visible = false
ESPFrame.Parent = MainFrame

ESPToggle.Size = UDim2.new(0, 160, 0, 30)
ESPToggle.Position = UDim2.new(0, 10, 0, 5)
ESPToggle.Text = "ESP Aç/Kapat"
ESPToggle.Parent = ESPFrame

ESPStatusBox.Size = UDim2.new(0, 30, 0, 30)
ESPStatusBox.Position = UDim2.new(0, 150, 0, 5)
ESPStatusBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Başlangıçta kırmızı
ESPStatusBox.Parent = ESPFrame

ESPColor.Size = UDim2.new(0, 160, 0, 30)
ESPColor.Position = UDim2.new(0, 10, 0, 40)
ESPColor.Text = "Renk Değiştir"
ESPColor.Parent = ESPFrame

-- TP Menüsü
TPFrame.Size = UDim2.new(0, 180, 0, 70)
TPFrame.Position = UDim2.new(1, 10, 0, 100)  -- Ana menünün yanında açılacak
TPFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TPFrame.Visible = false
TPFrame.Parent = MainFrame

PlayerDropdown.Size = UDim2.new(0, 160, 0, 30)
PlayerDropdown.Position = UDim2.new(0, 10, 0, 5)
PlayerDropdown.Text = "Oyuncu Seç"
PlayerDropdown.Parent = TPFrame

TPToPlayer.Size = UDim2.new(0, 160, 0, 30)
TPToPlayer.Position = UDim2.new(0, 10, 0, 40)
TPToPlayer.Text = "TP Git"
TPToPlayer.Parent = TPFrame

-- TP Seçim Menüsü
PlayerMenuFrame.Size = UDim2.new(0, 200, 0, 300)
PlayerMenuFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
PlayerMenuFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PlayerMenuFrame.Visible = false
PlayerMenuFrame.Parent = ScreenGui

-- Oyuncu Menüsü içinde Liste
local PlayerListFrame = Instance.new("Frame")
PlayerListFrame.Size = UDim2.new(1, 0, 1, 0)
PlayerListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerListFrame.Parent = PlayerMenuFrame

local function updatePlayerList()
    -- Listeyi temizle
    for _, child in pairs(PlayerListFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Listeye tüm oyuncuları ekle
    local yPos = 5
    for _, player in pairs(game.Players:GetPlayers()) do
        local playerButton = Instance.new("TextButton")
        playerButton.Size = UDim2.new(1, 0, 0, 30)
        playerButton.Position = UDim2.new(0, 0, 0, yPos)
        playerButton.Text = player.Name
        playerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.Parent = PlayerListFrame
        playerButton.MouseButton1Click:Connect(function()
            PlayerDropdown.Text = player.Name
            PlayerMenuFrame.Visible = false
        end)
        yPos = yPos + 35
    end
end

-- Yapımcı Bilgisi
DeveloperLabel.Size = UDim2.new(0, 180, 0, 30)
DeveloperLabel.Position = UDim2.new(0, 10, 0, 230)
DeveloperLabel.Text = "Yapımcı: SS Team"
DeveloperLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DeveloperLabel.Parent = MainFrame

-- Kapanma ve küçültme buton işlevleri
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local menuMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if menuMinimized then
        MainFrame.Size = UDim2.new(0, 200, 0, 150)
        ESPButton.Visible = true
        TPButton.Visible = true
        DeveloperLabel.Visible = true
        ESPFrame.Visible = false
        TPFrame.Visible = false
        PlayerMenuFrame.Visible = false
        menuMinimized = false
    else
        MainFrame.Size = UDim2.new(0, 200, 0, 30)
        ESPButton.Visible = false
        TPButton.Visible = false
        DeveloperLabel.Visible = false
        PlayerMenuFrame.Visible = false
        menuMinimized = true
    end
end)

-- ESP Aç/Kapat ve Durum Kutusu
local espEnabled = false
local espBoxes = {}

local function updateESP()
    -- Eski ESP kutuları temizlenir
    for _, box in pairs(espBoxes) do
        box:Destroy()
    end
    table.clear(espBoxes)
    
    if not espEnabled then return end
    
    -- Oyuncuların etrafına ESP kutuları eklenir
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = Vector3.new(4, 6, 4)
            box.Adornee = player.Character.HumanoidRootPart
            box.AlwaysOnTop = true
            box.ZIndex = 5
            box.Color3 = Color3.fromRGB(255, 0, 0)
            box.Transparency = 0.5
            box.Parent = game.CoreGui
            table.insert(espBoxes, box)
        end
    end
end

game.Players.PlayerAdded:Connect(updateESP)
game.Players.PlayerRemoving:Connect(updateESP)

ESPToggle.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    updateESP()
    if espEnabled then
        ESPStatusBox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Yeşil
    else
        ESPStatusBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Kırmızı
    end
end)

-- TP Menüsü
TPButton.MouseButton1Click:Connect(function()
    TPFrame.Visible = not TPFrame.Visible
    ESPFrame.Visible = false
    PlayerMenuFrame.Visible = false
end)

ESPButton.MouseButton1Click:Connect(function()
    ESPFrame.Visible = not ESPFrame.Visible
    TPFrame.Visible = false
    PlayerMenuFrame.Visible = false
end)

-- Oyuncu Seçme Menüsünü Aç
PlayerDropdown.MouseButton1Click:Connect(function()
    PlayerMenuFrame.Visible = true
    updatePlayerList()
end)

TPToPlayer.MouseButton1Click:Connect(function()
    local targetPlayer = game.Players:FindFirstChild(PlayerDropdown.Text)
    if targetPlayer and targetPlayer.Character then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)
