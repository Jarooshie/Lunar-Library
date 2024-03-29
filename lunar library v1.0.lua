-- Made by: Jarooshie#5081 --

if game.CoreGui:FindFirstChild("_LunarLibrary") then
	game.CoreGui["_LunarLibrary"]:Destroy()
end

local TweenService = game:GetService("TweenService")

local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end

local settings = {
    minX = 150,
    minY = 150,
    mainSize = UDim2.new(0, 1000, 0, 500)
}

local library = {}

function library:Window(t)
    local win = {}
 
    local ScreenGui = Instance.new("ScreenGui")
    local contents = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Icon = Instance.new("ImageLabel")
    local title = Instance.new("TextLabel")
    local Padding = Instance.new("Frame")
    local tab = Instance.new("TextButton")
    local close = Instance.new("TextButton")
    local Border = Instance.new("Frame")
    local LeftHover = Instance.new("Frame")
    local RightHover = Instance.new("Frame")
    local TopHover = Instance.new("Frame")
    local BottomHover = Instance.new("Frame")
    local White = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local Container = Instance.new("Frame")
    local Resizers = Instance.new("Frame")
    local Resizer = Instance.new("ImageButton")
    local UIListLayout = Instance.new("UIListLayout")

    function onCls() end

    function win.setIcon(img)
        Icon.Image = "rbxassetid://"..tostring(img)
    end
    function win.setIconColor(clr)
        Icon.BackgroundColor3 = clr
    end
    function win.setSize(size)
        contents.Size = size
        TopBar.Size = UDim2.new(0,size.X.Offset,0,25)
    end
    function win:onClose(callback)
        callback = typeof(callback) == "function" and callback or function()end
        onCls = callback
    end


    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "_LunarLibrary"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    contents.Name = "contents"
    contents.Parent = ScreenGui
    contents.BackgroundColor3 = Color3.fromRGB(18, 22, 28)
    contents.BorderSizePixel = 0
    contents.Position = UDim2.new(0, 150, 0, 300)
    contents.Size = settings.mainSize
    contents.ZIndex = 2
    contents.ClipsDescendants = false

    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0,8)

    function getItemsSize()
        local sizeX = 0
        local sizeY = 0
        for i,v in pairs(Container:GetChildren()) do
            if not v:IsA("UIListLayout") then
                sizeX = sizeX+v.Size.X.Offset
                sizeY = sizeY+v.Size.Y.Offset
                
            end
        end
        return sizeX, sizeY
    end

    function ShowMessageBox(message,callback)
        callback = typeof(callback) == "function" and callback or function()end
        if not contents:FindFirstChild("MsgBox - "..message) then
            local MsgBox = Instance.new("Frame")
            local Buttons = Instance.new("Frame")
            local ui = Instance.new("UIListLayout")
            local Yes = Instance.new("ImageButton")
            local Label = Instance.new("TextLabel")
            local No = Instance.new("ImageButton")
            local Label_2 = Instance.new("TextLabel")
            local Section = Instance.new("Frame")
            local _Border = Instance.new("ImageLabel")
            local Frame = Instance.new("Frame")
            local Content = Instance.new("TextLabel")

            MsgBox.Name = "MsgBox - "..message
            MsgBox.Parent = contents
            MsgBox.Active = true
            MsgBox.AnchorPoint = Vector2.new(0.5, 0.5)
            MsgBox.BackgroundColor3 = Color3.fromRGB(18, 22, 28)
            MsgBox.BorderColor3 = Color3.fromRGB(192, 111, 24)
            MsgBox.Position = UDim2.new(0.5, 0, 0.5, 0)
            MsgBox.Size = UDim2.new(0, 211, 0, 105)
            MsgBox.ZIndex = 500

            Buttons.Name = "Buttons"
            Buttons.Parent = MsgBox
            Buttons.AnchorPoint = Vector2.new(0, 1)
            Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Buttons.BackgroundTransparency = 1.000
            Buttons.BorderSizePixel = 0
            Buttons.Position = UDim2.new(0, 0, 1, 0)
            Buttons.Size = UDim2.new(1, -11, 0, 29)

            ui.Parent = Buttons
            ui.FillDirection = Enum.FillDirection.Horizontal
            ui.HorizontalAlignment = Enum.HorizontalAlignment.Right
            ui.SortOrder = Enum.SortOrder.LayoutOrder
            ui.Padding = UDim.new(0, 10)

            Yes.Name = "Yes"
            Yes.Parent = Buttons
            Yes.AnchorPoint = Vector2.new(1, 0)
            Yes.BackgroundColor3 = Color3.fromRGB(26, 32, 40)
            Yes.BorderColor3 = Color3.fromRGB(246, 142, 31)
            Yes.Position = UDim2.new(1, -110, 1, -29)
            Yes.Size = UDim2.new(0, 90, 0, 18)
            Yes.MouseButton1Click:Connect(function()
                MsgBox:Destroy()
                pcall(callback)
                
            end)

            Label.Name = "Label"
            Label.Parent = Yes
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Position = UDim2.new(0, 0, 0, -1)
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.Font = Enum.Font.Code
            Label.Text = "Yes"
            Label.TextColor3 = Color3.fromRGB(246, 142, 31)
            Label.TextSize = 12.000

            No.Name = "No"
            No.Parent = Buttons
            No.AnchorPoint = Vector2.new(1, 0)
            No.BackgroundColor3 = Color3.fromRGB(26, 32, 40)
            No.BorderColor3 = Color3.fromRGB(246, 142, 31)
            No.Position = UDim2.new(1, -110, 1, -29)
            No.Size = UDim2.new(0, 90, 0, 18)
            No.MouseButton1Click:Connect(function()
                MsgBox:Destroy()
            end)

            Label_2.Name = "Label"
            Label_2.Parent = No
            Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label_2.BackgroundTransparency = 1.000
            Label_2.Position = UDim2.new(0, 0, 0, -1)
            Label_2.Size = UDim2.new(1, 0, 1, 0)
            Label_2.Font = Enum.Font.Code
            Label_2.Text = "No"
            Label_2.TextColor3 = Color3.fromRGB(246, 142, 31)
            Label_2.TextSize = 12.000

            Section.Name = "Section"
            Section.Parent = MsgBox
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.ClipsDescendants = true
            Section.Position = UDim2.new(0, 10, 0, 10)
            Section.Size = UDim2.new(1, -20, 1, -50)

            _Border.Name = "_Border"
            _Border.Parent = Section
            _Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Border.BackgroundTransparency = 1.000
            _Border.BorderSizePixel = 0
            _Border.Size = UDim2.new(1, 0, 1, 0)
            _Border.Image = "rbxassetid://2090664413"
            _Border.ImageColor3 = Color3.fromRGB(123, 69, 15)
            _Border.ScaleType = Enum.ScaleType.Slice
            _Border.SliceCenter = Rect.new(4, 4, 396, 86)

            Frame.Parent = _Border
            Frame.AnchorPoint = Vector2.new(1, 0)
            Frame.BackgroundColor3 = Color3.fromRGB(123, 69, 15)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(1, -4, 0, 0)
            Frame.Size = UDim2.new(1, -8, 0, 1)

            Content.Name = "Content"
            Content.Parent = Section
            Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content.BackgroundTransparency = 1.000
            Content.Position = UDim2.new(0, 10, 0, 10)
            Content.Selectable = true
            Content.Size = UDim2.new(1, -20, 1, -20)
            Content.Font = Enum.Font.Code
            Content.Text = tostring(message)
            Content.TextColor3 = Color3.fromRGB(246, 142, 31)
            Content.TextSize = 16.000
            Content.TextWrapped = true
        end
    end


    function dragify(Frame)
        local dragToggle = nil
        local dragSpeed = 0
        local dragInput = nil
        local dragStart = nil
        local dragPos = nil
        
        function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, math.clamp(startPos.X.Offset + Delta.X,0,1918-contents.Size.X.Offset+1), startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed), {Position = Position}):Play()
        print(Position)
        end
        
        Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
        if (input.UserInputState == Enum.UserInputState.End) then
        dragToggle = false
        end
        end)
        end
        end)
        
        Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        dragInput = input
        end
        end)
        
        game:GetService("UserInputService").InputChanged:Connect(function(input)
        if (input == dragInput and dragToggle) then
        updateInput(input)
        end
        end)
    end
        
    dragify(contents)

    TopBar.Name = "TopBar"
    TopBar.Parent = contents
    TopBar.BackgroundColor3 = Color3.fromRGB(192, 111, 24)
    TopBar.BorderColor3 = Color3.fromRGB(18, 22, 28)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(0, contents.Size.X.Offset, 0, 25)
    TopBar.ZIndex = 2
    TopBar.ClipsDescendants = true

    Icon.Name = "Icon"
    Icon.Parent = TopBar
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Size = UDim2.new(0, 25, 0, 25)

    title.Name = "title"
    title.Parent = TopBar
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1.000
    title.Position = UDim2.new(0, 25, 0, 0)
    title.Size = UDim2.new(0, 200, 0, 25)
    title.Font = Enum.Font.Code
    title.Text = tostring(t)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14.000
    title.TextXAlignment = Enum.TextXAlignment.Left
    settings["minX"] = title.TextBounds.X + 80
    settings["minY"] = settings["minX"]


    Padding.Name = "Padding"
    Padding.Parent = TopBar
    Padding.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Padding.BackgroundTransparency = 1.000
    Padding.Position = UDim2.new(0.451055676, 0, 0, 0)
    Padding.Size = UDim2.new(0, 227, 0, 25)

    tab.Name = "tab"
    tab.Parent = TopBar
    tab.BackgroundColor3 = Color3.fromRGB(213, 141, 53)
    tab.BackgroundTransparency = 1.000
    tab.Size = UDim2.new(0, 25, 0, 25)
    tab.Font = Enum.Font.SourceSans
    tab.Text = "_"
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.TextSize = 14.000
    tab.BorderSizePixel = 0
    tab.Position = UDim2.new(1,-50,0,0)
    tab.AutoButtonColor = false
    tab.MouseEnter:Connect(function()
        Resize(tab,{BackgroundTransparency = 0.5},0.3)
    end)
    tab.MouseLeave:Connect(function()
        Resize(tab,{BackgroundTransparency = 1},0.3)
    end)
    local tab_on = false
    local NEW_Y = contents.Size.Y.Offset
    tab.MouseButton1Click:Connect(function()
        tab_on = not tab_on
        if tab_on == true then
            Resize(contents,{Size = UDim2.new(0,contents.Size.X.Offset,0,25)},0.4)
            Resizer.Visible = false
        else
            Resizer.Visible = true
            Resize(contents,{Size = UDim2.new(0,contents.Size.X.Offset,0,NEW_Y)},0.4)
        end
    end)
    close.Name = "close"
    close.Parent = TopBar
    close.BackgroundColor3 = Color3.fromRGB(255, 82, 82)
    close.BackgroundTransparency = 1.000
    close.AutoButtonColor = false
    close.BorderSizePixel = 0
    close.Size = UDim2.new(0, 25, 0, 25)
    close.Font = Enum.Font.SourceSans
    close.Text = "X"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextSize = 14.000
    close.Position = UDim2.new(1,-25,0,0)
    close.MouseEnter:Connect(function()
        Resize(close,{BackgroundTransparency = 0.5},0.3)
    end)
    close.MouseLeave:Connect(function()
        Resize(close,{BackgroundTransparency = 1},0.3)
    end)
    
    function cls()
        onCls()
        Resizer:Destroy()
        Resize(contents,{Size = UDim2.new(0,contents.Size.X.Offset,0,25)},0.5)
        wait(0.5)
        Resize(contents,{Size = UDim2.new(0,0,0,contents.Size.Y.Offset)},0.5)
        Resize(TopBar,{Size = UDim2.new(0,0,0,contents.Size.Y.Offset)},0.5)
        wait(0.5) ScreenGui:Destroy()
    end
    close.MouseButton1Click:Connect(function()
        ShowMessageBox("Are you sure you want to close?",cls)
    end)

    Container.Name = "Container"
    Container.Parent = Main
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0,15,0,40)
    Container.Size = UDim2.new(1, -15, 1, -40)

    Resizers.Name = "Resizers"
    Resizers.Parent = contents
    Resizers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Resizers.BackgroundTransparency = 1.000
    Resizers.Size = UDim2.new(1, 0, 1, 0)
    Resizers.ZIndex = 2

    Resizer.Name = "Resizer"
    Resizer.Parent = Resizers
    Resizer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Resizer.BackgroundTransparency = 0.500
    Resizer.BorderSizePixel = 0
    Resizer.AutoButtonColor = false
    Resizer.Position = UDim2.new(1, -10, 1, -10)
    Resizer.Size = UDim2.new(0, 10, 0, 10)
    Resizer.ZIndex = 2


    local held = false


    local UIS = game:GetService("UserInputService")

    Resizer.MouseButton1Down:Connect(function(x,y)
        held = true
    end)
    UIS.InputEnded:Connect(function(input,gP)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if held == true then
                held = false
            end
        end
    end)
    local mouse = game.Players.LocalPlayer:GetMouse()



    game:GetService("RunService").RenderStepped:Connect(function()
        if held then
            local xS = contents.Size.X.Scale
            local yS = contents.Size.Y.Scale

            local x = mouse.X-contents.AbsolutePosition.X
            local y = mouse.Y-contents.AbsolutePosition.Y
            
            if x >= settings["minX"] and y >= settings["minY"] then
            contents.Size = UDim2.new(xS,x,yS,y)
            NEW_Y = y
            elseif x >= settings["minX"] then
                contents.Size = UDim2.new(xS,x,yS,settings["minY"])
            elseif x >= settings["minY"] then
                contents.Size = UDim2.new(xS,settings["minX"],yS,y)
                NEW_Y = y
            else
                contents.Size = UDim2.new(xS,settings["minX"],yS,math.clamp(y,settings["minY"],math.huge))
            end
            TopBar.Size = UDim2.new(0, contents.Size.X.Offset, 0, 25)
            close.Position = UDim2.new(1,-25,0,0)
            tab.Position = UDim2.new(1,-50,0,0)
            title.Position = UDim2.new(0,25,0,0)
        end
    end)
    ---------------------------------------------------------------------------
    Border.Name = "Border"
    Border.Parent = contents
    Border.BackgroundColor3 = Color3.fromRGB(192, 111, 24)
    Border.BorderSizePixel = 0
    Border.Position = UDim2.new(0, -1, 0, -1)
    Border.Size = UDim2.new(1, 2, 1, 2)
    Border.ZIndex = -1

    LeftHover.Name = "LeftHover"
    LeftHover.Parent = Border
    LeftHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LeftHover.BackgroundTransparency = 1.000
    LeftHover.BorderSizePixel = 0
    LeftHover.Position = UDim2.new(0, 0, 0, 1)
    LeftHover.Size = UDim2.new(0, 1, 1, -2)
    LeftHover.ZIndex = -1

    RightHover.Name = "RightHover"
    RightHover.Parent = Border
    RightHover.AnchorPoint = Vector2.new(1, 0)
    RightHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RightHover.BackgroundTransparency = 1.000
    RightHover.BorderSizePixel = 0
    RightHover.Position = UDim2.new(1, 0, 0, 1)
    RightHover.Size = UDim2.new(0, 1, 1, -2)
    RightHover.ZIndex = -1

    TopHover.Name = "TopHover"
    TopHover.Parent = Border
    TopHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopHover.BackgroundTransparency = 1.000
    TopHover.BorderSizePixel = 0
    TopHover.Size = UDim2.new(1, 0, 0, 1)
    TopHover.ZIndex = -1

    BottomHover.Name = "BottomHover"
    BottomHover.Parent = Border
    BottomHover.AnchorPoint = Vector2.new(0, 1)
    BottomHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BottomHover.BackgroundTransparency = 1.000
    BottomHover.BorderSizePixel = 0
    BottomHover.Position = UDim2.new(0, 0, 1, 0)
    BottomHover.Size = UDim2.new(1, 0, 0, 1)
    BottomHover.ZIndex = -1

    White.Name = "White"
    White.Parent = Border
    White.BackgroundColor3 = Color3.fromRGB(251, 251, 251)
    White.BackgroundTransparency = 0.910
    White.BorderSizePixel = 0
    White.Size = UDim2.new(1, 0, 1, 0)
    White.ZIndex = -1
    ----------------------------------------------------------------------------
    Main.Name = "Main"
    Main.Parent = contents
    Main.BackgroundColor3 = Color3.fromRGB(18, 22, 28)
    Main.BorderSizePixel = 0
    Main.Size = UDim2.new(1, 0, 1, 0)
    Main.ClipsDescendants = true
    function win:Checkmark(text,callback)
        callback = typeof(callback) == "function" and callback or function()end
        bool = bool or false
        local toggled = false
        local blocked = false
        
        local Checkmark = Instance.new("ImageButton")
        local Checked = Instance.new("ImageLabel")
        local LabelArea = Instance.new("ImageButton")
        local Label = Instance.new("TextLabel")
        local None = Instance.new("Frame")

        Checkmark.Name = tostring(text)
        Checkmark.Parent = Container
        Checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Checkmark.BackgroundTransparency = 1.000
        Checkmark.Position = UDim2.new(0, 98, 0, 61)
        Checkmark.Size = UDim2.new(0, 14, 0, 14)
        Checkmark.Image = "rbxassetid://2091383617"
        Checkmark.ImageColor3 = Color3.fromRGB(246, 142, 31)

        Checked.Name = "Checked"
        Checked.Parent = Checkmark
        Checked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Checked.BackgroundTransparency = 1.000
        Checked.Size = UDim2.new(0, 14, 0, 14)
        Checked.ZIndex = 2
        Checked.Image = "rbxassetid://2091377346"
        Checked.ImageColor3 = Color3.fromRGB(246, 142, 31)
        Checked.ImageTransparency = 1.000

        LabelArea.Name = "LabelArea"
        LabelArea.Parent = Checkmark
        LabelArea.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
        LabelArea.BackgroundTransparency = 1.000
        LabelArea.Position = UDim2.new(0, 19, 0, 0)
        LabelArea.Selectable = false
        LabelArea.Size = UDim2.new(0, 102, 1, 0)
        LabelArea.ZIndex = 2

        Label.Name = "Label"
        Label.Parent = LabelArea
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Position = UDim2.new(0, 0, 0, 2)
        Label.Size = UDim2.new(1, 0, 0, 8)
        Label.ZIndex = 2
        Label.Font = Enum.Font.Code
        Label.Text = tostring(text)
        Label.TextColor3 = Color3.fromRGB(246, 142, 31)
        Label.TextSize = 12.000
        Label.TextXAlignment = Enum.TextXAlignment.Left

        None.Name = "None"
        None.Parent = Checkmark
        None.AnchorPoint = Vector2.new(0.5, 0.5)
        None.BackgroundColor3 = Color3.fromRGB(246, 142, 31)
        None.BackgroundTransparency = 1.000
        None.BorderSizePixel = 0
        None.Position = UDim2.new(0.5, 0, 0.5, 0)
        None.Size = UDim2.new(0, 6, 0, 2)
        None.ZIndex = 2
        local data = {}
        Checkmark.MouseButton1Click:connect(function()
            if blocked == false then
                toggled = not toggled
                if toggled then
                    Resize(Checked,{ImageTransparency = 0},0.1)
                else
                    Resize(Checked,{ImageTransparency = 1},0.1)
                end
                pcall(callback,toggled)
            end
        end)
        function data:Block(b)
            if b == true then
                Checked.ImageTransparency = 1
                Resize(None,{Transparency = 0},0.1)
                blocked = true
            else
                if toggled == true then
                Checked.ImageTransparency = 0
                else
                    Checked.ImageTransparency = 1
                end
                Resize(None,{Transparency = 1},0.1)
                blocked = false
            end
        end
        function data:Set(b)
            if b then
                Resize(Checked,{ImageTransparency = 0},0.1)
                self:Block(false)
            else
                Resize(Checked,{ImageTransparency = 1},0.1)
            end
            pcall(callback,b)
        end
        return data, Checkmark
    end
    function win:Button(t,callback)
        callback = typeof(callback) == "function" and callback or function()end
        local Button = Instance.new("ImageButton")
        local Label = Instance.new("TextLabel")
        
        Label.Name = "Label"
        Label.Parent = Button
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Position = UDim2.new(0, 0, 0, -1)
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.Font = Enum.Font.Code
        Label.Text = tostring(t)
        Label.TextColor3 = Color3.fromRGB(246, 142, 31)
        Label.TextSize = 12.000

        Button.Name = tostring(t)
        Button.Parent = Container
        Button.AnchorPoint = Vector2.new(1, 0)
        Button.BackgroundColor3 = Color3.fromRGB(26, 32, 40)
        Button.BorderColor3 = Color3.fromRGB(246, 142, 31)
        Button.Position = UDim2.new(1, -110, 1, -29)
        Button.Size = UDim2.new(0, Label.TextBounds.X + 42, 0, 18)
        
        
        Button.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
        return Button
    end
    function win:Text(text)
        local t = {}
        local Label = Instance.new("TextLabel")
        
        Label.Name = "Label"
        Label.Parent = Container
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Position = UDim2.new(0, 0, 0, -1)
        Label.Size  = UDim2.new(0, Label.TextBounds.X + 42, 0, 18)
        Label.Font = Enum.Font.Code
        Label.Text = tostring(text)
        Label.TextColor3 = Color3.fromRGB(246, 142, 31)
        Label.TextSize = 15.000
        Label.TextXAlignment = Enum.TextXAlignment.Left
        
        function t:Edit(prop,tt)
            if prop:lower() == "text" then
                Label.Text = tostring(tt)
            end
            if prop:lower() == "textsize" then
                Label.TextSize = tonumber(tt)
            end
        end
        return t
    end
    function win:TextBox(t,callback)
        callback = typeof(callback) == "function" and callback or function()end
        local TextBox = Instance.new("TextLabel")
        local Frame = Instance.new("Frame")
        local Input = Instance.new("TextBox")
        
        TextBox.Name = tostring(t)
        TextBox.Parent = Container
        TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.BackgroundTransparency = 1.000
        TextBox.Position = UDim2.new(0, 0, 0, 24)
        TextBox.Size = UDim2.new(0, 48, 0, 14)
        TextBox.Font = Enum.Font.Code
        TextBox.Text = tostring(t)
        TextBox.TextColor3 = Color3.fromRGB(246, 142, 31)
        TextBox.TextSize = 12.000
        TextBox.TextXAlignment = Enum.TextXAlignment.Left
        
        Frame.Parent = TextBox
        Frame.AnchorPoint = Vector2.new(0, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Frame.BorderColor3 = Color3.fromRGB(200, 200, 200)
        Frame.ClipsDescendants = true
        Frame.Position = UDim2.new(0.208333328, TextBox.TextBounds.X, 0.375, 1)
        Frame.Size = UDim2.new(0, 84, 0, 12)
        
        Input.Name = "Input"
        Input.Parent = Frame
        Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Input.BackgroundTransparency = 1.000
        Input.Position = UDim2.new(0, 5, 0, -1)
        Input.Size = UDim2.new(1, -10, 1, 0)
        Input.Font = Enum.Font.Code
        Input.Text = ""
        Input.TextColor3 = Color3.fromRGB(255, 255, 255)
        Input.TextSize = 12.000
        Input.TextWrapped = false
        Input.TextXAlignment = Enum.TextXAlignment.Left
        Input.FocusLost:Connect(function(ep)
            if ep then
                if #Input.Text > 0 then
                    pcall(callback, Input.Text)
                end
            end
        end)
        Input.Changed:Connect(function(c)
            if c == "TextBounds" then
                if Input.TextBounds.X > 70 then
                    Frame.Size = UDim2.new(0, 84+(Input.TextBounds.X-72), 0, 12)
                end
                if Input.TextBounds.X < 70 then
                    Frame.Size = UDim2.new(0, 84, 0, 12)
                end
            end
        end)
        return TextBox
    end
    function win:Slider(tt,min,max,callback)
        callback = typeof(callback) == "function" and callback or function()end
        local MainSlider = Instance.new("Frame")
        local Slider = Instance.new("Frame")
        local SliderBtn = Instance.new("ImageButton")
        local Value = Instance.new("TextLabel")
        local title = Instance.new("TextLabel")
        local sliderClr = Instance.new("Frame")

        MainSlider.Name = "MainSlider"
        MainSlider.Parent = Container
        MainSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainSlider.BackgroundTransparency = 1.000
        MainSlider.Position = UDim2.new(0, 0, 0.471111119, 0)
        MainSlider.Size = UDim2.new(0, 100, 0, 34)

        Slider.Name = "Slider"
        Slider.Parent = MainSlider
        Slider.AnchorPoint = Vector2.new(0.5, 0)
        Slider.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        Slider.BorderSizePixel = 0
        Slider.Position = UDim2.new(0.5, 0, 0.550000012, -1)
        Slider.Size = UDim2.new(0, 100, 0, 2)
        Slider.ZIndex = 4

        sliderClr.Name = "SliderClr"
        sliderClr.Parent = Slider
        sliderClr.AnchorPoint = Vector2.new(0.5, 0)
        sliderClr.BackgroundColor3 = Color3.fromRGB(207, 145, 52)
        sliderClr.BorderSizePixel = 0
        sliderClr.Position = UDim2.new(0, 0, 0.5, 0)
        sliderClr.Size = UDim2.new(0, 0, 1, 0)
        sliderClr.ZIndex = 5
        sliderClr.AnchorPoint = Vector2.new(0.5,0.5)

        SliderBtn.Name = "SliderBtn"
        SliderBtn.Parent = Slider
        SliderBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderBtn.BackgroundColor3 = Color3.fromRGB(192, 111, 24)
        SliderBtn.BorderSizePixel = 0
        SliderBtn.Position = UDim2.new(0, 0, 0.5, 0)
        SliderBtn.Size = UDim2.new(0, 6, 0, 12)
        SliderBtn.ZIndex = 5
        SliderBtn.AutoButtonColor = false
        SliderBtn.ImageColor3 = Color3.fromRGB(246, 142, 31)

        local held = false

        SliderBtn.MouseButton1Down:Connect(function()
            held = true
        end)

        local UIS = game:GetService("UserInputService")

        UIS.InputEnded:Connect(function(input,gP)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if held == true then
                    held = false
                end
            end
        end)
        local mouse = game.Players.LocalPlayer:GetMouse()
        game:GetService("RunService").RenderStepped:Connect(function()
            if held == true then
                local x = (Slider.AbsoluteSize.X - (Slider.AbsoluteSize.X - ((mouse.X - Slider.AbsolutePosition.X)) + 1)) / Slider.AbsoluteSize.X

                local mine = 0
                local maxe = 1

                local size = mine
                if x >= mine and x <= maxe then
                    size = x
                elseif x < mine then
                    size = mine
                elseif x > maxe then
                    size = maxe
                end

                Resize(SliderBtn, {Position = UDim2.new(size or min, 0, 0.5, 0)}, 0.1)
                Resize(sliderClr, {Size = UDim2.new(size , 0, 1, 0),Position = UDim2.new(size/2, 0, 0.5, 0)}, 0.1)
                local p = math.floor((size or min) * 100)

                local maxv = max
                local minv = min
                local diff = maxv - minv

                local sel_value = math.floor(((diff / 100) * p) + minv)

                Value.Text = tostring(sel_value)
                pcall(callback, sel_value)

                --SliderBtn.Position = UDim2.new(0,mouse.X-Slider.AbsoluteSize.X+(Slider.AbsolutePosition.X/2),0,0)
                --local value = math.clamp(math.ceil(SliderBtn.AbsolutePosition.X-(Slider.AbsolutePosition.X)),min,max)
            end
        end)


        Value.Name = "Value"
        Value.Parent = MainSlider
        Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Value.BackgroundTransparency = 1.000
        Value.Position = UDim2.new(0, 0, 0, 24)
        Value.Size = UDim2.new(1, 0, 0, 10)
        Value.Font = Enum.Font.Code
        Value.Text = tostring(min)
        Value.TextColor3 = Color3.fromRGB(246, 142, 31)
        Value.TextSize = 12.000
        Value.TextXAlignment = Enum.TextXAlignment.Right

        title.Name = tostring(tt)
        title.Parent = MainSlider
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.Size = UDim2.new(1, 0, 0, 10)
        title.Font = Enum.Font.Code
        title.Text = tostring(tt)
        title.TextColor3 = Color3.fromRGB(246, 142, 31)
        title.TextSize = 12.000
        title.TextXAlignment = Enum.TextXAlignment.Left
        return MainSlider
    end
    function win:Dropdown(name,t,callback)
        local data = {}
        callback = typeof(callback) == "function" and callback or function()end
        t = typeof(t) == "table" and t or {}
        local opened = false
        local Dropdown = Instance.new("TextButton")
        local ImageLabel = Instance.new("ImageLabel")
        local FakeItems = Instance.new("Frame")
        local DdItems = Instance.new("ScrollingFrame")
        local DdText = Instance.new("TextLabel")
        local UIListLayoutt = Instance.new("UIListLayout")
        
        DdText.Name = "DdText"
        DdText.Parent = Dropdown
        DdText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DdText.BackgroundTransparency = 1
        DdText.Position = UDim2.new(0, 16, 0, 0)
        DdText.BorderSizePixel = 0
        DdText.Text = tostring(name)
        DdText.Size = UDim2.new(0, DdText.TextBounds.X + 16, 0, 16)
        DdText.Font = Enum.Font.Code
        DdText.TextColor3 = Color3.fromRGB(246, 142, 31)
        DdText.TextSize = 12.000
        DdText.TextXAlignment = Enum.TextXAlignment.Left

        Dropdown.Name = tostring(name)
        Dropdown.Text = ""--tostring(name)
        Dropdown.Parent = Container
        Dropdown.Active = false
        Dropdown.AnchorPoint = Vector2.new(0, 0.5)
        Dropdown.BackgroundColor3 = Color3.fromRGB(26, 32, 40)
        Dropdown.BorderColor3 = Color3.fromRGB(246, 142, 31)
        Dropdown.Position = UDim2.new(0.208333328, 4, 0.375, 1)
        Dropdown.Selectable = false
        Dropdown.Size = UDim2.new(0, DdText.TextBounds.X + 32, 0, 16)
        Dropdown.AutoButtonColor = false
        Dropdown.Font = Enum.Font.Code
        Dropdown.TextColor3 = Color3.fromRGB(246, 142, 31)
        Dropdown.TextSize = 12.000
        Dropdown.ZIndex = 10
        Dropdown.MouseButton1Click:Connect(function()
            opened = not opened
            if opened == true then
                Resize(FakeItems,{Size = UDim2.new(1,0,0,96)},0.1)
                Resize(ImageLabel,{Rotation = 90},0.1)
            else
                Resize(FakeItems,{Size = UDim2.new(1,0,0,0)},0.1)
                Resize(ImageLabel,{Rotation = 0},0.1)
            end
        end)




        ImageLabel.Parent = Dropdown
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.Size = UDim2.new(0, 16, 0, 16)
        ImageLabel.Image = "rbxassetid://71659683"
        ImageLabel.ImageColor3 = Color3.fromRGB(246, 142, 31)

        FakeItems.Name = "FakeItems"
        FakeItems.Parent = Dropdown
        FakeItems.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        FakeItems.BorderColor3 = Color3.fromRGB(27, 42, 53)
        FakeItems.BorderSizePixel = 0
        FakeItems.ClipsDescendants = true
        FakeItems.Position = UDim2.new(0, 0, 1, 1)
        FakeItems.Size = UDim2.new(1, 0, 0, 0)

        DdItems.Name = "DdItems"
        DdItems.Parent = FakeItems
        DdItems.BackgroundColor3 = Color3.fromRGB(28, 31, 40)
        DdItems.BorderSizePixel = 0
        DdItems.Selectable = false
        DdItems.Size = UDim2.new(1, 0, 0, 96)
        DdItems.CanvasSize = UDim2.new(0, 0, 1, 0)
        DdItems.ScrollBarThickness = 1

        UIListLayoutt.Parent = DdItems
        UIListLayoutt.SortOrder = Enum.SortOrder.LayoutOrder
        for i,v in pairs(t) do
            local DdButton = Instance.new("TextButton")

            DdButton.Name = tostring(v)
            DdButton.Parent = DdItems
            DdButton.Active = false
            DdButton.BackgroundColor3 = Color3.fromRGB(30, 37, 47)
            DdButton.BorderSizePixel = 0
            DdButton.Text = tostring(v)
            DdButton.Selectable = false
            DdButton.Size = UDim2.new(1, 0, 0, 16)
            DdButton.Font = Enum.Font.Code
            DdButton.TextColor3 = Color3.fromRGB(246, 163, 90)
            DdButton.TextScaled = true
            DdButton.TextSize = 12.000
            DdButton.TextWrapped = true
            DdButton.MouseButton1Click:Connect(function()
                pcall(callback,tostring(v))
                DdText.Text = tostring(v)
                Resize(FakeItems,{Size = UDim2.new(1,0,0,0)},0.1)
                Resize(ImageLabel,{Rotation = 0},0.1)
            end)
            if #t > 6 then
                DdItems.CanvasSize = UDim2.new(0,0,1,16*(#t-6))
            end
        end
        function data:Add(n)
            local addData = {}
            local DdButton = Instance.new("TextButton")

            DdButton.Name = tostring(n)
            DdButton.Parent = DdItems
            DdButton.Active = false
            DdButton.BackgroundColor3 = Color3.fromRGB(30, 37, 47)
            DdButton.BorderSizePixel = 0
            DdButton.Text = tostring(n)
            DdButton.Selectable = false
            DdButton.Size = UDim2.new(1, 0, 0, 16)
            DdButton.Font = Enum.Font.Code
            DdButton.TextColor3 = Color3.fromRGB(246, 163, 90)
            DdButton.TextScaled = true
            DdButton.TextSize = 12.000
            DdButton.TextWrapped = true
            DdButton.MouseButton1Click:Connect(function()
                pcall(callback,tostring(n))
            end)
            if #DdItems:GetChildren()-1 > 6 then
                Resize(DdItems,{CanvasSize = UDim2.new(0,0,1,16*(#DdItems:GetChildren()-7))},0.1)
            end
            function addData:Remove()
                DdButton:Destroy()
            end
            return DdButton
        end
        function data:Remove(n)
            if DdItems:FindFirstChild(n) and n ~= "UIListLayout" then
                DdItems:FindFirstChild(n):Destroy()
            end
            if #DdItems:GetChildren()-1 > 6 then
                Resize(DdItems,{CanvasSize = UDim2.new(0,0,1,16*(#DdItems:GetChildren()-7))},0.1)
            end
        end
        return data,Dropdown
    end
    function win:Folder(n)
        local folder_data = {}
        local open = false
        
        local Folder = Instance.new("Frame")
        local FolderName = Instance.new("TextLabel")
        local items = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local Button = Instance.new("ImageButton")

        Folder.Name = tostring(n)
        Folder.Parent = Container
        Folder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Folder.BackgroundTransparency = 1
        Folder.ClipsDescendants = true
        Folder.Position = UDim2.new(0, 0, 0.195555553, 0)
        Folder.Size = UDim2.new(0, 140, 0, 18)

        FolderName.Name = "FolderName"
        FolderName.Parent = Folder
        FolderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderName.BackgroundTransparency = 1.000
        FolderName.Position = UDim2.new(0, 19, 0, 0)
        FolderName.Size = UDim2.new(0, 117, 0, 18)
        FolderName.Font = Enum.Font.Code
        FolderName.Text = tostring(n)
        FolderName.TextColor3 = Color3.fromRGB(246, 142, 31)
        FolderName.TextSize = 12.000
        FolderName.TextXAlignment = Enum.TextXAlignment.Left

        items.Name = "items"
        items.Parent = Folder
        items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        items.BackgroundTransparency = 1
        items.ClipsDescendants = false
        items.Position = UDim2.new(0, 14, 0, 18)
        items.Size = UDim2.new(1, 0, 0, 76)

        UIListLayout.Parent = items
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 8)

        UIPadding.Parent = items
        UIPadding.PaddingLeft = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        Button.Name = "Button"
        Button.Parent = Folder
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.Size = UDim2.new(0, 18, 0, 18)
        Button.Image = "rbxassetid://71659683"
        Button.ImageColor3 = Color3.fromRGB(246, 142, 31)

        

        Button.MouseButton1Click:Connect(function()
            local size = 0
            local padding = 8
            for i,v in pairs(items:GetChildren()) do
                if v.Name~="UIListLayout" and v.Name~="UIPadding" then
                    size = size+v.Size.Y.Offset
                end
            end
            size = size+((#items:GetChildren()-2)*padding)
            --print(size)
            items.Size = UDim2.new(1, 0, 0, (size))
            if open == true then
                Resize(Button,{Rotation = 90},0.1)
                Resize(Folder,{Size = UDim2.new(1, 0, 0, 18+(size))},0.1)
            else
                Resize(Button,{Rotation = 0},0.1)
                Resize(Folder,{Size = UDim2.new(1, 0, 0, 18)},0.1)
            end
            open = not open
        end)
        for i,v in next, win do
            folder_data[i] = function(...)
                local data, object
                local ret = {v(...)}
                if typeof(ret[1]) == "table" then
                    data = ret[1]
                    object = ret[2]
                    object.Parent = items
                    return data, object
                else
                    object = ret[1]
                    object.Parent = items
                    return object
                end
            end
        end
        return folder_data, Folder
    end
    return win
end
return library
