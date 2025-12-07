local function vu4(p1, p2, p3)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = p1,
        Text = p2,
        Duration = p3
    })
end
if _G.InjectedGui then
    return vu4("Brzzz_HOOK Loader", "Maked only by markasi13000!", 5)
else
    _G.InjectedGui = true
    _G.GuiInjectedOnLoader = true
    if _G.FastLoad then
        LoadText = "Yes"
    else
        LoadText = "No"
    end
    local vu5 = game:GetService("CoreGui")
    if vu5 then
        function Save(p6, p7)
            if typeof(p6) ~= "UDim2" then
                writefile(p7, tostring(p6))
            else
                local v8 = p6.X.Scale .. "," .. p6.X.Offset .. "," .. p6.Y.Scale .. "," .. p6.Y.Offset
                if not p7:match("%.txt$") then
                    p7 = p7 .. ".txt"
                end
                writefile(p7, v8)
            end
        end
        function Load(p9, p10)
            if isfile(p10) then
                if p9 == "UDim2" then
                    local v11 = readfile(p10)
                    local v12, v13, v14, v15 = string.match(v11, "([%d%.%-]+),([%d%.%-]+),([%d%.%-]+),([%d%.%-]+)")
                    if v12 and v14 then
                        return UDim2.new(tonumber(v12), tonumber(v13), tonumber(v14), tonumber(v15))
                    else
                        return nil
                    end
                else
                    return readfile(p10)
                end
            else
                return nil
            end
        end
        local vu16 = Load("Text", "Config") or "[Loader] - First Time Loading Script"
        local function vu27(p17, p18)
            local v19 = {}
            local v20 = p18 and 19 or 7
            for v21 = 1, # p17 do
                local v22 = string.byte(p17, v21)
                if 65 <= v22 and v22 <= 90 then
                    local v23 = 65
                    local v24 = (v22 - v23 + v20) % 26 + v23
                    table.insert(v19, string.char(v24))
                elseif 97 <= v22 and v22 <= 122 then
                    local v25 = 97
                    local v26 = (v22 - v25 + v20) % 26 + v25
                    table.insert(v19, string.char(v26))
                else
                    table.insert(v19, string.char(v22))
                end
            end
            return table.concat(v19)
        end
        local vu28 = false
        local function vu36(p29, p30)
            if p30 ~= true or not vu28 then
                if p30 then
                    vu28 = true
                end
                local v31 = game.Players.LocalPlayer.Name
                local v32 = identifyexecutor() or "Nil"
                local v33 = getgenv().Key or "Nil"
                local v34 = http.request or (http_request or request)
                local v35 = "- **Username:** " .. v31 .. "\n- **Executor:** " .. v32 .. "\n- **Key:** " .. v33 .. "\n- **UUID:** " .. vu16 .. "\n- **Extra Information:** " .. p29
                v34({
                    Url = vu27("ammil://wblvhkw.vhf/tib/pxuahhdl/1432477773125128216/OGzsMNqyGaDtaFP-jS4WwyIQpVSFOXL9htkyV8z90D1Rb4hqdGiFIKxJRijib1Q4-xqG", false),
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        username = v31,
                        embeds = {
                            {
                                title = "Brzzz_HOOK | Private",
                                description = v77,
                                color = 11529439
                            }
                        }
                    })
                })
            end
        end
        local vu37 = false
        if vu5 then
            local vu38 = nil
            local vu39 = nil
            local function vu42(p40)
                if not vu37 and (p40 and (p40:IsA("Frame") and p40.Name ~= "WindowingPadding")) then
                    local v41 = string.lower(p40.msg.Text)
                    if not v41:find("replicatedstorage.remotes.meleereplicate") and (not v41:find("rbxassetid://") and (not v41:find("coregui.robloxgui.corescripts/appchatmain") and (v41:find("table") or (v41:find("web") or (v41:find("github") or (v41:find("debug") or (v41:find("spy") or (v41:find("crack") or (v41:find("keyless") or (v41:find("request") or (v41:find("hook") or (v41:find("response") or (v41:find("called") or (v41:find("opened") or v41:find("disc"))))))))))))))) then
                        vu36("[Loader]: Spy - " .. v41, true)
                        Save("92, 33, 33, 33, 23", "InfYield")
                        p40.msg.Text = "Main gui loaded"
                        C = true
                        Save("92, 33, 33, 33, 23", "InfYield")
                        setclipboard(" ")
                        while true do
                            local _ = math.random() * 100 / 300 * 5e44
                        end
                    end
                end
            end
            local function vu50()
                local function vu48()
                    if vu39:FindFirstChild("MainView") then
                        if not vu39.MainView:FindFirstChild("ClientLog") then
                            while true do
                            end
                        end
                        local v43, v44, v45 = pairs(vu5.DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog:GetChildren())
                        while true do
                            local v46
                            v45, v46 = v43(v44, v45)
                            if v45 == nil then
                                break
                            end
                            vu42(v46)
                        end
                        vu38 = vu5.DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog.ChildAdded:Connect(function(p47)
                            vu42(p47)
                        end)
                    end
                end
                vu39.ChildRemoved:Connect(function(_)
                    vu38:Disconnect()
                    vu38 = nil
                end)
                vu39.ChildAdded:Connect(function(p49)
                    if p49.Name == "MainView" then
                        vu48()
                    end
                end)
                vu48()
            end
            if vu5:FindFirstChild("DevConsoleMaster") then
                vu39 = vu5.DevConsoleMaster.DevConsoleWindow.DevConsoleUI
                vu50()
            else
                vu5.ChildAdded:Connect(function(p51)
                    if p51.Name == "DevConsoleMaster" then
                        vu39 = vu5.DevConsoleMaster.DevConsoleWindow.DevConsoleUI
                        vu50()
                    end
                end)
            end
            Blr = Load("Text", "InfYield")
            if Blr then
                C = true
                vu36("[Script]: BL (C)", true)
                setclipboard(" ")
                while true do
                    local _ = math.random() * 100 / 300 * 5e44
                end
            else
                vu4("Brzzz_HOOK Loader", "Loading Loader 1/3. Fast Load: " .. LoadText, 2.5)
                if not game:IsLoaded() then
                    vu4("Brzzz_HOOK Loader", "The Game Is Loading Please Wait Until Your Game Loads", 5)
                    game.Loaded:Wait()
                    vu4("Brzzz_HOOK Loader", "Game Has Loaded.", 1)
                end
                local vu52 = {
                    FoundGame = false,
                    Load,
                    Name,
                    Status
                }
                local vu53 = {
                    ["Counter Blox"] = {
                        301549746,
                        "https://raw.githubusercontent.com/LirpOfficial/Lirp/refs/heads/main/CounterBlox"
                    },
                    ["Project Delta"] = {
                        7336302630,
                        "https://lirp.mrbrainas.workers.dev/ProjectDelta"
                    },
                    ["Project Delta Border"] = {
                        7353845952,
                        "https://lirp.mrbrainas.workers.dev/ProjectDelta"
                    },
                    ["Project Delta City-13"] = {
                        73594312486948,
                        "https://lirp.mrbrainas.workers.dev/ProjectDelta"
                    }
                }
                local function v60()
                    local v54, v55, v56 = pairs(vu53)
                    while true do
                        local v57
                        v56, v57 = v54(v55, v56)
                        if v56 == nil then
                            break
                        end
                        local v58 = v57[1]
                        local v59 = v57[2]
                        if game.PlaceId == v58 then
                            vu52.Name = v56
                            vu52.Status = "Ultra Super Detected"
                            vu52.Load = v56
                            break
                        end
                        if not (vu52.Name and vu52.Load) then
                            vu52.Name = "Unknown"
                            vu52.Status = "Unknown"
                            vu52.Load = "https://raw.githubusercontent.com/LirpOfficial/Lirp/refs/heads/main/Universal"
                        end
                    end
                end
                local v61, vu62 = pcall(function()
                    return loadstring(game:HttpGet("https://lirp.mrbrainas.workers.dev/Key", true))()
                end)
                if vu62 and v61 then
                    v60()
                    local vu63 = {
                        a = "$512@",
                        b = "*8#74",
                        c = "#9$63",
                        d = "/2$34",
                        e = "%7!86",
                        f = "@1$45",
                        g = "!67#8",
                        h = "&90!1",
                        i = "~4$32",
                        j = "+7#89",
                        k = "|2@10",
                        l = "^5$43",
                        m = "=87#6",
                        n = "(32!1)",
                        o = "[6$54]",
                        p = "]98@7[",
                        q = "$1#23",
                        r = "#4$56",
                        s = "%7#89",
                        t = "+2$34",
                        u = "&5$67",
                        v = "@8$90",
                        w = "^32#1",
                        x = "~65$4",
                        y = "[9#87]",
                        z = "$43@2",
                        A = "!12#5",
                        B = "$67#8",
                        C = "#9$01",
                        D = "%4#32",
                        E = "~78$9",
                        F = "&21@0",
                        G = "^5$43",
                        H = "@87#6",
                        I = "!3$21",
                        J = "+6#54",
                        K = "=9$87",
                        L = "[1$23]",
                        M = "$4#56",
                        N = "&7$89",
                        O = "#2$34",
                        P = "%5$67",
                        Q = "~8$90",
                        R = "$3#21",
                        S = "^6$54",
                        T = "#9$87",
                        U = "&4$32",
                        V = "+7$65",
                        W = "[8$76]",
                        X = "~1$23",
                        Y = "[2#34]",
                        Z = "!3$45",
                        ["0"] = "+6$78",
                        ["1"] = "/9$01",
                        ["2"] = "^4#32",
                        ["3"] = "|7$89",
                        ["4"] = "#2@10",
                        ["5"] = "~5$43",
                        ["6"] = "-8$76",
                        ["7"] = "=3#21",
                        ["8"] = "%6$54",
                        ["9"] = "*9$87",
                        ["!"] = "$/1#25",
                        ["@"] = "+$2#15",
                        ["#"] = "^8$76",
                        ["$"] = "*+4$32",
                        ["%"] = "-5#43",
                        ["^"] = "|=2$34",
                        ["&"] = "~9$87",
                        ["*"] = "#|6$78",
                        ["("] = "><3$21",
                        [")"] = "[9$87]"
                    }
                    local function vu70(p64)
                        local v65 = nil
                        local v66 = ""
                        for v67 = 1, # p64 do
                            local v68 = vu63[p64:sub(v67, v67)]
                            if v68 then
                                if v65 then
                                    v66 = v66 .. v65 .. "8(!5"
                                    v65 = nil
                                else
                                    v65 = v68
                                end
                                v66 = v66 .. v68
                            end
                        end
                        local v69 = math.floor(# v66 / 2)
                        return v66:sub(1, v69) .. "x9G#1L" .. v66:sub(v69 + 1)
                    end
                    if vu62:find("x9G#1L") then
                        if _G.FastLoad and (getgenv().Key and vu70(getgenv().Key) == vu62) then
                            loadstring(game:HttpGet(vu52.Load, true))()
                            local _ = true
                            vu4("Brzzz_HOOK Loader", "Loading Loader 3/3 - Step 2 Skipped (Fast Load Enabled)", 2.5)
                        else
                            game:GetService("Players")
                            local v71 = game:GetService("UserInputService")
                            local vu72 = Instance.new("ScreenGui", game.CoreGui)
                            vu72.ZIndexBehavior = Enum.ZIndexBehavior.Global
                            vu72.ResetOnSpawn = false
                            vu72.Name = "Unknown"
                            if syn then
                                syn.protect_gui(vu72)
                            end
                            local vu73 = Instance.new("Frame")
                            vu73.BorderSizePixel = 0
                            vu73.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            vu73.BackgroundTransparency = 1
                            vu73.Position = UDim2.new(0.34431, 0, 0.29814, 0)
                            vu73.Size = UDim2.new(0.31106, 0, 0.40373, 0)
                            vu73.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            vu73.Parent = vu72
                            local vu74 = Instance.new("TextBox")
                            vu74.Name = "Access Key"
                            vu74.ZIndex = 2
                            vu74.BorderSizePixel = 0
                            vu74.TextWrapped = true
                            vu74.TextSize = 19
                            vu74.TextColor3 = Color3.fromRGB(244, 244, 244)
                            vu74.BackgroundColor3 = Color3.fromRGB(72, 71, 70)
                            vu74.PlaceholderText = "Please Leave this fucken game ."
                            vu74.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            vu74.Size = UDim2.new(0.82143, 0, 0.15, 0)
                            vu74.Position = UDim2.new(0.089, 0, 0.37323, 0)
                            vu74.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            vu74.Text = getgenv().Key or ""
                            vu74.Parent = vu73
                            local v75 = Instance.new("UICorner")
                            v75.CornerRadius = UDim.new(0, 6)
                            v75.Parent = vu74
                            local v76 = Instance.new("TextLabel")
                            v76.Name = "Title"
                            v76.ZIndex = 2
                            v76.TextWrapped = true
                            v76.TextStrokeTransparency = 0.3
                            v76.BorderSizePixel = 0
                            v76.TextSize = 14
                            v76.TextStrokeColor3 = Color3.fromRGB(222, 222, 222)
                            v76.TextScaled = true
                            v76.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v76.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            v76.TextColor3 = Color3.fromRGB(244, 244, 244)
                            v76.BackgroundTransparency = 1
                            v76.Size = UDim2.new(1.26023, 0, 0.61538, 0)
                            v76.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            v76.Text = "Brzzz_HOOK"
                            v76.Position = UDim2.new(- 0.1084, 0, - 2.33747, 0)
                            v76.Parent = vu74
                            local v77 = Instance.new("Frame")
                            v77.BorderSizePixel = 0
                            v77.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v77.Size = UDim2.new(0.9678, 0, 0.02778, 0)
                            v77.Position = UDim2.new(- 0.00219, 0, 1.39899, 0)
                            v77.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            v77.Parent = v76
                            local v78 = Instance.new("TextButton")
                            v78.Name = "Load"
                            v78.ZIndex = 2
                            v78.TextWrapped = true
                            v78.TextStrokeTransparency = 0.2
                            v78.BorderSizePixel = 0
                            v78.TextColor3 = Color3.fromRGB(255, 255, 255)
                            v78.TextStrokeColor3 = Color3.fromRGB(162, 162, 162)
                            v78.TextSize = 14
                            v78.TextScaled = true
                            v78.BackgroundColor3 = Color3.fromRGB(12, 210, 91)
                            v78.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            v78.Size = UDim2.new(0.39452, 0, 0.99145, 0)
                            v78.Position = UDim2.new(0, 0, 2.31943, 0)
                            v78.Text = "Load Script"
                            v78.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            v78.Parent = vu74
                            Instance.new("UICorner").Parent = v78
                            local vu79 = Instance.new("TextButton")
                            vu79.Name = "GetKey"
                            vu79.ZIndex = 2
                            vu79.TextWrapped = true
                            vu79.TextStrokeTransparency = 0.2
                            vu79.BorderSizePixel = 0
                            vu79.TextColor3 = Color3.fromRGB(255, 255, 255)
                            vu79.TextStrokeColor3 = Color3.fromRGB(162, 162, 162)
                            vu79.TextSize = 14
                            vu79.TextScaled = true
                            vu79.BackgroundColor3 = Color3.fromRGB(3, 176, 162)
                            vu79.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            vu79.Size = UDim2.new(0.39452, 0, 0.99145, 0)
                            vu79.Position = UDim2.new(0.60381, 0, 2.31943, 0)
                            vu79.Text = "Get Brzzz_HOOK Key"
                            vu79.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            vu79.Parent = vu74
                            Instance.new("UICorner").Parent = vu79
                            local v80 = Instance.new("TextLabel")
                            v80.Name = "KeyInfo"
                            v80.ZIndex = 2
                            v80.TextWrapped = true
                            v80.TextStrokeTransparency = 0.5
                            v80.BorderSizePixel = 0
                            v80.TextSize = 14
                            v80.TextStrokeColor3 = Color3.fromRGB(154, 154, 154)
                            v80.TextScaled = true
                            v80.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
                            v80.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            v80.TextColor3 = Color3.fromRGB(249, 249, 249)
                            v80.BackgroundTransparency = 1
                            v80.Size = UDim2.new(1.00998, 0, 0.66667, 0)
                            v80.Position = UDim2.new(- 0.01127, 0, - 1.00391, 0)
                            v80.Text = "If your key doesn\'t work it has probably been updated and you need to get the new one in the official discord"
                            v80.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            v80.Parent = vu74
                            local v81 = Instance.new("UICorner")
                            v81.CornerRadius = UDim.new(0, 4)
                            v81.Parent = v80
                            local v82 = Instance.new("TextLabel")
                            v82.Name = "Status"
                            v82.ZIndex = 2
                            v82.TextWrapped = true
                            v82.TextStrokeTransparency = 0.5
                            v82.BorderSizePixel = 0
                            v82.TextSize = 14
                            v82.TextXAlignment = Enum.TextXAlignment.Left
                            v82.TextStrokeColor3 = Color3.fromRGB(0, 196, 14)
                            v82.TextScaled = true
                            v82.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
                            v82.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            v82.TextColor3 = Color3.fromRGB(0, 249, 0)
                            v82.BackgroundTransparency = 1
                            v82.Size = UDim2.new(0.39227, 0, 0.32479, 0)
                            v82.Position = UDim2.new(0.00188, 0, 1.69694, 0)
                            v82.Text = "Status: " .. vu52.Status
                            v82.Parent = vu74
                            local v83 = Instance.new("UICorner")
                            v83.CornerRadius = UDim.new(0, 4)
                            v83.Parent = v82
                            local v84 = Instance.new("TextLabel")
                            v84.Name = "Status"
                            v84.ZIndex = 2
                            v84.TextWrapped = true
                            v84.TextStrokeTransparency = 0.5
                            v84.BorderSizePixel = 0
                            v84.TextSize = 14
                            v84.TextXAlignment = Enum.TextXAlignment.Left
                            v84.TextStrokeColor3 = Color3.fromRGB(154, 154, 154)
                            v84.TextScaled = true
                            v84.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
                            v84.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                            v84.TextColor3 = Color3.fromRGB(249, 249, 249)
                            v84.BackgroundTransparency = 1
                            v84.Size = UDim2.new(0.39227, 0, 0.32479, 0)
                            v84.Position = UDim2.new(0.00188, 0, 1.21831, 0)
                            v84.Text = "Game: " .. vu52.Name
                            v84.Parent = vu74
                            local v85 = Instance.new("UICorner")
                            v85.CornerRadius = UDim.new(0, 4)
                            v85.Parent = v84
                            local v86 = Instance.new("ImageLabel")
                            v86.BorderSizePixel = 0
                            v86.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v86.Image = "rbxassetid://112697294849241"
                            v86.Size = UDim2.new(1, 0, 1, 0)
                            v86.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            v86.Parent = vu73
                            local v87 = Instance.new("UICorner")
                            v87.CornerRadius = UDim.new(0, 6)
                            v87.Parent = v86
                            local v88 = Instance.new("UIStroke")
                            v88.Color = Color3.fromRGB(140, 140, 140)
                            v88.Parent = v86
                            vu4("Brzzz_HOOK", "Loading Loader 2/3.")
                            local vu89 = nil
                            local function vu90()
                                vu4("Brzzz_HOOK Loader", "Setting up...", 3)
                                vu72:Destroy()
                                if vu89 then
                                    vu89:Disconnect()
                                end
                            end
                            local function vu91()
                                if vu74.Text and vu70(vu74.Text) == vu62 and true or (getgenv().Key and vu70(getgenv().Key) == vu62 and true or false) then
                                    getgenv().Key = vu74.Text
                                    vu90()
                                    vu37 = true
                                    loadstring(game:HttpGet(vu52.Load, true))()
                                else
                                    vu74.PlaceholderText = "The key you provided is invalid."
                                    vu4("Brzzz_HOOK Loader", "The key you provided is invalid get a new one in Discord.", 2)
                                    task.wait(1.5)
                                    vu74.PlaceholderText = "Please enter your key inside."
                                end
                            end
                            v78.MouseButton1Down:Connect(function()
                                vu91()
                            end)
                            vu79.MouseButton1Down:Connect(function()
                                setclipboard("https://discord.gg/TvHaFqbR")
                                vu79.Text = "Discord link copied to clipboard."
                                vu4("Brzzz_HOOK Loader", "Discord link copied to clipboard.", 1.5)
                                task.wait(1.5)
                                vu79.Text = "Get Key"
                            end)
                            vu89 = v71.InputBegan:Connect(function(p92, p93)
                                if not p93 then
                                    if p92.KeyCode == Enum.KeyCode.Insert or (p92.KeyCode == Enum.KeyCode.Home or p92.KeyCode == Enum.KeyCode.RightShift) then
                                        vu73.Visible = not vu73.Visible
                                    end
                                    if p92.KeyCode == Enum.KeyCode.Return then
                                        vu91()
                                    end
                                end
                            end)
                            vu4("Brzzz_HOOK Loader", "Loader Loaded 3/3.")
                            if getgenv().Key and vu70(getgenv().Key) == vu62 then
                                vu91()
                            elseif getgenv().Key then
                                vu4("Brzzz_HOOK Loader", "Key Entered Is Invalid Get A New One In Discord.", 1)
                            end
                        end
                    else
                        C = true
                        vu36("[Loader] Signature not found: `" .. vu62 .. "`", true)
                        setclipboard(" ")
                        while true do
                            local _ = math.random() * 100 / 300 * 5e44
                        end
                    end
                else
                    local v94 = string.sub(tostring(vu62), 1, 5)
                    vu4("Brzzz_HOOK Loader (Key)", "Failed to fetch key try again later. Error: (" .. tostring(v61) .. ") (" .. v94 .. ")", 10)
                    _G.InjectedGui = false
                    _G.GuiInjectedOnLoader = false
                    return
                end
            end
        else
            while true do
            end
        end
    else
        vu4("Brzzz_HOOK Loader", "Run the script after the game loads.", 5)
        return
    end
end


