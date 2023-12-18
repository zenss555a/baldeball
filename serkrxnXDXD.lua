do
	local ui = game.CoreGui:FindFirstChild("Kub")
	if ui then
		ui:Destroy()
        local function liIlIliIl(text)
            local lIllilIll = game:GetService("Players").LocalPlayer
            lIllilIll:Kick(text)
        end
        liIlIliIl("\nDon't execute for 2 times")
        wait(1)
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        local pid = game.PlaceId
        ts:Teleport(pid, p)
	end
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local library = {}

function library:AddWindow(text,keybind)
    local currenttab = ""
    local uihide = false
    local abc = false
    keybind = keybind or Enum.KeyCode.RightControl
    yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local Kub = Instance.new("ScreenGui")
    Kub.Name = "Kub"
    Kub.Parent = game.CoreGui
    Kub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = Kub
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.ClipsDescendants = true
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.Position = UDim2.new(0.5, 0, 0.499, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)

    local MainCorner = Instance.new("UICorner")
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.Size = UDim2.new(0, 656, 0, 27)

    local TopCorner = Instance.new("UICorner")
    TopCorner.Name = "TopCorner"
    TopCorner.Parent = Top

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 12, 0, 0)
    NameHub.Size = UDim2.new(0, 61, 0, 27)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 17.000

    local NameHub2 = Instance.new("TextLabel")
    NameHub2.Name = "NameHub2"
    NameHub2.Parent = Top
    NameHub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub2.BackgroundTransparency = 1.000
    NameHub2.Position = UDim2.new(0, 71, 0, 0)
    NameHub2.Size = UDim2.new(0, 61, 0, 27)
    NameHub2.Font = Enum.Font.GothamSemibold
    NameHub2.Text = ""
    NameHub2.TextColor3 = Color3.fromRGB(255,0,0)
    NameHub2.TextSize = 17.000
    NameHub2.TextXAlignment = Enum.TextXAlignment.Left

    local BindButton = Instance.new("TextButton")
    BindButton.Name = "BindButton"
    BindButton.Parent = Top
    BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundTransparency = 1.000
    BindButton.Position = UDim2.new(0, 550, 0, 0)
    BindButton.Size = UDim2.new(0, 100, 0, 27)
    BindButton.Font = Enum.Font.GothamSemibold
    BindButton.Text = "[ "..string.gsub(tostring(keybind),"Enum.KeyCode.","").." ]"
    BindButton.TextColor3 = Color3.fromRGB(103, 103, 103)
    BindButton.TextSize = 11.000

    BindButton.MouseButton1Click:Connect(function ()
        BindButton.Text = "[ ... ]"
        local inputwait = game:GetService("UserInputService").InputBegan:wait()
        local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

        if
        shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" and shiba.Name ~= "Focus"
        then
            BindButton.Text = "[ "..shiba.Name.." ]"
            yoo = shiba.Name
        end
    end)

    
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.Position = UDim2.new(0, 12, 0, 40)
    Tab.Size = UDim2.new(0, 633, 0, 29)

    local TabCorner = Instance.new("UICorner")
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    
    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 633, 0, 29)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = ScrollTab
    UIPadding.PaddingLeft = UDim.new(0, 10)

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "TabList"
    TabList.Parent = ScrollTab
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    MakeDraggable(Top,Main)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[yoo] then
			if uihide == false then
				uihide = true
				Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
			else
				uihide = false
				Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
			end
		end
	end)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.Position = UDim2.new(0, 11, 0, 80)
    Page.Size = UDim2.new(0, 633, 0, 305)

    local PageCorner = Instance.new("UICorner")
    PageCorner.Name = "PageCorner"
    PageCorner.Parent = Page

    local PageFolder = Instance.new("Folder")
    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Page

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageFolder
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.Padding = UDim.new(0, 10)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false


    local Ui = {}
    function Ui:AddTab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 100, 0, 29)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 15.000
        TabButton.Text = text
        TabButton.TextTransparency = 0.500
        
        local MainPage = Instance.new("Frame")

        MainPage.Name = "MainPage"
        MainPage.Parent = PageFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Position = UDim2.new(0.00157977885, 0, 0, 0)
        MainPage.Size = UDim2.new(0, 632, 0, 305)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            for i,v in next, PageFolder:GetChildren() do 
                if v.Name == "MainPage" then
                    currenttab = v.Name
                end
                UIPageLayout:JumpTo(MainPage)
            end
		end)

		if abc == false then
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
			abc = true
		end

        local uitab = {}
        function uitab:AddPage()
            local MainFramePage = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local ScrollPage = Instance.new("ScrollingFrame")
            local PageList = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local UIPadding_2 = Instance.new("UIPadding")
            local UIListLayout_2 = Instance.new("UIListLayout")
        
            MainFramePage.Name = "MainFramePage"
            MainFramePage.Parent = MainPage
            MainFramePage.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            MainFramePage.Size = UDim2.new(0, 300, 0, 285)
        
            UICorner.Parent = MainFramePage
        
            ScrollPage.Name = "ScrollPage"
            ScrollPage.Parent = MainFramePage
            ScrollPage.Active = true
            ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollPage.BackgroundTransparency = 1.000
            ScrollPage.BorderSizePixel = 0
            ScrollPage.Size = UDim2.new(0, 300, 0, 285)
            ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollPage.ScrollBarThickness = 0
        
            PageList.Name = "PageList"
            PageList.Parent = ScrollPage
            PageList.SortOrder = Enum.SortOrder.LayoutOrder
            PageList.Padding = UDim.new(0, 13)
        
            UIPadding.Parent = ScrollPage
            UIPadding.PaddingLeft = UDim.new(0, 20)
            UIPadding.PaddingTop = UDim.new(0, 10)
        
            UIPadding_2.Parent = MainPage
            UIPadding_2.PaddingLeft = UDim.new(0, 10)
            UIPadding_2.PaddingTop = UDim.new(0, 10)
        
            UIListLayout_2.Parent = MainPage
            UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 13)

            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 26)
                    ScrollTab.CanvasSize = UDim2.new(0,TabList.AbsoluteContentSize.X + 10,0,0)
                end)
            end)

            local main = {}
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local Sep2 = Instance.new("TextLabel")
                local Sep3 = Instance.new("Frame")
                
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollPage
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.Size = UDim2.new(0, 260, 0, 20)
                
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 40, 0, 1)
                
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.BackgroundTransparency = 1.000
                Sep2.Position = UDim2.new(0, 80, 0, 0)
                Sep2.Size = UDim2.new(0, 100, 0, 20)
                Sep2.Font = Enum.Font.GothamSemibold
                Sep2.Text = text
                Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.TextSize = 14.000
                
                Sep3.Name = "Sep3"
                Sep3.Parent = Seperator
                Sep3.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep3.BorderSizePixel = 0
                Sep3.Position = UDim2.new(0, 220, 0, 10)
                Sep3.Size = UDim2.new(0, 40, 0, 1)
            end

            function main:AddLine()
                local Linee = Instance.new("Frame")
                local Line = Instance.new("Frame")
                
                Linee.Name = "Linee"
                Linee.Parent = ScrollPage
                Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Linee.BackgroundTransparency = 1.000
                Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
                Linee.Size = UDim2.new(0, 260, 0, 20)
                
                Line.Name = "Line"
                Line.Parent = Linee
                Line.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Line.BorderSizePixel = 0
                Line.Position = UDim2.new(0, 0, 0, 10)
                Line.Size = UDim2.new(0, 260, 0, 1)
            end

            function main:AddButton(text,callback)
                local Button = Instance.new("Frame")
                local ButtonCorner = Instance.new("UICorner")
                local Btn = Instance.new("TextButton")
                local BtnCorner = Instance.new("UICorner")
                
                Button.Name = "Button"
                Button.Parent = ScrollPage
                Button.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Button.Size = UDim2.new(0, 260, 0, 38)
                Button.BackgroundTransparency = 0.5
                
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.Parent = Button
                
                Btn.Name = "Btn"
                Btn.Parent = Button
                Btn.AutoButtonColor = false
                Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Btn.Position = UDim2.new(0, 1, 0, 1)
                Btn.Size = UDim2.new(0, 258, 0, 36)
                Btn.Font = Enum.Font.GothamSemibold
                Btn.TextColor3 = Color3.fromRGB(225, 225, 225)
                Btn.TextSize = 16.000
                Btn.Text = text
                Btn.TextTransparency = 0.500
                
                BtnCorner.CornerRadius = UDim.new(0, 5)
                BtnCorner.Name = "BtnCorner"
                BtnCorner.Parent = Btn

                Btn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                end)

                Btn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                end)

                Btn.MouseButton1Click:Connect(function()
                    callback()
                    Btn.TextSize = 9
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 16}
                    ):Play()
                end)
            end 

            function main:AddDropdown(text,option,callback)
                local Dropdown = Instance.new("Frame")
                local dropcorner = Instance.new("UICorner")
                local Dropdownn = Instance.new("Frame")
                local droppcorner = Instance.new("UICorner")
                local DropBtn = Instance.new("TextButton")
                local DropLabel = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local dpd = Instance.new("UIPadding")
                local dll = Instance.new("UIListLayout")
                local DropImage = Instance.new("ImageLabel")
                local isdropping = false

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollPage
                Dropdown.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Dropdown.BackgroundTransparency = 0.500
                Dropdown.Size = UDim2.new(0, 260, 0, 38) -- 114
                
                dropcorner.CornerRadius = UDim.new(0, 5)
                dropcorner.Name = "dropcorner"
                dropcorner.Parent = Dropdown
                
                Dropdownn.Name = "Dropdownn"
                Dropdownn.Parent = Dropdown
                Dropdownn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Dropdownn.ClipsDescendants = true
                Dropdownn.Position = UDim2.new(0, 1, 0, 1)
                Dropdownn.Size = UDim2.new(0, 258, 0, 36) -- 112
                
                droppcorner.CornerRadius = UDim.new(0, 5)
                droppcorner.Name = "droppcorner"
                droppcorner.Parent = Dropdownn
                
                DropBtn.Name = "DropBtn"
                DropBtn.Parent = Dropdownn
                DropBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropBtn.BackgroundTransparency = 1.000
                DropBtn.Size = UDim2.new(0, 258, 0, 36)
                DropBtn.Font = Enum.Font.SourceSans
                DropBtn.Text = ""
                DropBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropBtn.TextSize = 14.000
                
                DropLabel.Name = "DropLabel"
                DropLabel.Parent = Dropdownn
                DropLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropLabel.BackgroundTransparency = 1.000
                DropLabel.Position = UDim2.new(0, 15, 0, 0)
                DropLabel.Size = UDim2.new(0, 180, 0, 36)
                DropLabel.Font = Enum.Font.GothamSemibold
                DropLabel.Text = text
                DropLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropLabel.TextSize = 16.000
                DropLabel.TextTransparency = 0.500
                DropLabel.TextXAlignment = Enum.TextXAlignment.Left

                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdownn
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 230, 0, 9)
                DropImage.Rotation = 180.000
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://6031090990"
                DropImage.ImageTransparency = 0.500
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = DropLabel
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.105555557, 0, 1.11111116, 0)
                DropScroll.Size = UDim2.new(0, 258, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScroll.ScrollBarThickness = 3
                
                dpd.Name = "dpd"
                dpd.Parent = DropScroll
                dpd.PaddingLeft = UDim.new(0, 5)
                dpd.PaddingTop = UDim.new(0, 5)
                
                dll.Name = "dll"
                dll.Parent = DropScroll
                dll.SortOrder = Enum.SortOrder.LayoutOrder
                dll.Padding = UDim.new(0, 5)

                for i,v in next, option do
                    local Item = Instance.new("TextButton")
                    Item.Name = "Item"
                    Item.Parent = DropScroll
                    Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BackgroundTransparency = 1.000
                    Item.Size = UDim2.new(0, 248, 0, 29)
                    Item.Font = Enum.Font.GothamSemibold
                    Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                    Item.TextSize = 16.000
                    Item.Text = tostring(v)
                    Item.TextTransparency = 0.5

                    Item.MouseEnter:Connect(function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0}
                        ):Play()
                    end)
                    Item.MouseLeave:Connect(function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                    end)

                    Item.MouseButton1Click:Connect(function()
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                        callback(v)
                    end)
                end 

                DropScroll.CanvasSize = UDim2.new(0,0,0,dll.AbsoluteContentSize.Y + 10)

                DropBtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0}
                    ):Play()
                end)

                DropBtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0.5}
                    ):Play()
                end)

                DropBtn.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        Dropdown:TweenSize(UDim2.new(0,260,0,114),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,112),"Out","Quad",0.3,true)
                        DropBtn:TweenSize(UDim2.new(0,258,0,112),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                    else
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        DropBtn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                    end
                end)

                local drop = {}

                function drop:Clear()
                    DropLabel.Text = tostring(text).." :"
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,260,0,38),"Out","Quad",0.3,true)
                    Dropdownn:TweenSize(UDim2.new(0,258,0,36),"Out","Quad",0.3,true)
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local Item = Instance.new("TextButton")
                    Item.Name = "Item"
                    Item.Parent = DropScroll
                    Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BackgroundTransparency = 1.000
                    Item.Size = UDim2.new(0, 248, 0, 29)
                    Item.Font = Enum.Font.GothamSemibold
                    Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                    Item.TextSize = 16.000
                    Item.TextTransparency = 0.5
                    Item.Text = tostring(t)

                    Item.MouseButton1Click:Connect(function()
                        isdropping = false
                        Dropdown:TweenSize(UDim2.new(0,260,0,36),"Out","Quad",0.3,true)
                        Dropdownn:TweenSize(UDim2.new(0,260,0,34),"Out","Quad",0.3,true)
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Rotation = 180}
                        ):Play()
                        callback(t)
                    end)
                end
                return drop
            end

            function main:AddSlider(text,min,max,set,callback)
                local Slider = Instance.new("Frame")
                local slidercorner = Instance.new("UICorner")
                local sliderr = Instance.new("Frame")
                local sliderrcorner = Instance.new("UICorner")
                local SliderLabel = Instance.new("TextLabel")
                local HAHA = Instance.new("Frame")
                local AHEHE = Instance.new("TextButton")
                local bar = Instance.new("Frame")
                local bar1 = Instance.new("Frame")
                local bar1corner = Instance.new("UICorner")
                local barcorner = Instance.new("UICorner")
                local circlebar = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local slidervalue = Instance.new("Frame")
                local valuecorner = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollPage
                Slider.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Slider.BackgroundTransparency = 0.500
                Slider.Size = UDim2.new(0, 260, 0, 48)

                slidercorner.CornerRadius = UDim.new(0, 5)
                slidercorner.Name = "slidercorner"
                slidercorner.Parent = Slider

                sliderr.Name = "sliderr"
                sliderr.Parent = Slider
                sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                sliderr.Position = UDim2.new(0, 1, 0, 1)
                sliderr.Size = UDim2.new(0, 258, 0, 46)

                sliderrcorner.CornerRadius = UDim.new(0, 5)
                sliderrcorner.Name = "sliderrcorner"
                sliderrcorner.Parent = sliderr

                SliderLabel.Name = "SliderLabel"
                SliderLabel.Parent = sliderr
                SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderLabel.BackgroundTransparency = 1.000
                SliderLabel.Position = UDim2.new(0.0581395365, 0, 0, 0)
                SliderLabel.Size = UDim2.new(0, 180, 0, 26)
                SliderLabel.Font = Enum.Font.GothamSemibold
                SliderLabel.Text = text
                SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderLabel.TextSize = 16.000
                SliderLabel.TextTransparency = 0.500
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

                HAHA.Name = "HAHA"
                HAHA.Parent = sliderr
                HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HAHA.BackgroundTransparency = 1.000
                HAHA.Size = UDim2.new(0, 258, 0, 46)

                AHEHE.Name = "AHEHE"
                AHEHE.Parent = sliderr
                AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                AHEHE.BackgroundTransparency = 1.000
                AHEHE.Position = UDim2.new(0, 10, 0, 35)
                AHEHE.Size = UDim2.new(0, 238, 0, 5)
                AHEHE.Font = Enum.Font.SourceSans
                AHEHE.Text = ""
                AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
                AHEHE.TextSize = 14.000

                bar.Name = "bar"
                bar.Parent = AHEHE
                bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                bar.Size = UDim2.new(0, 238, 0, 5)

                bar1.Name = "bar1"
                bar1.Parent = bar
                bar1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                bar1.BackgroundTransparency = 0.500
                bar1.Size = UDim2.new(set/max, 0, 0, 5)

                bar1corner.CornerRadius = UDim.new(0, 5)
                bar1corner.Name = "bar1corner"
                bar1corner.Parent = bar1

                barcorner.CornerRadius = UDim.new(0, 5)
                barcorner.Name = "barcorner"
                barcorner.Parent = bar

                circlebar.Name = "circlebar"
                circlebar.Parent = bar1
                circlebar.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
                circlebar.Position = UDim2.new(1, -2, 0, -3)
                circlebar.Size = UDim2.new(0, 10, 0, 10)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = circlebar

                slidervalue.Name = "slidervalue"
                slidervalue.Parent = sliderr
                slidervalue.BackgroundColor3 = Color3.fromRGB(255,0,0)
                slidervalue.BackgroundTransparency = 0.500
                slidervalue.Position = UDim2.new(0, 185, 0, 5)
                slidervalue.Size = UDim2.new(0, 65, 0, 18)

                valuecorner.CornerRadius = UDim.new(0, 5)
                valuecorner.Name = "valuecorner"
                valuecorner.Parent = slidervalue

                TextBox.Parent = slidervalue
                TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextBox.Position = UDim2.new(0, 1, 0, 1)
                TextBox.Size = UDim2.new(0, 63, 0, 16)
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextBox.TextSize = 9.000
                TextBox.Text = set
                TextBox.TextTransparency = 0.500

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = TextBox

                HAHA.MouseEnter:Connect(function()
                    TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        SliderLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        circlebar,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(225,225,225)}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TextBox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                HAHA.MouseLeave:Connect(function()
                    TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        SliderLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        circlebar,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(180,180,180)}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        TextBox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")

                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                AHEHE.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                    circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                    moveconnection = mouse.Move:Connect(function()
                        TextBox.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                        circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 238), 0, 5)
                            circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 238) * bar1.AbsoluteSize.X) + tonumber(min))
                        TextBox.Text = Value
                    end
                end)

                TextBox.FocusLost:Connect(function()
                    if tonumber(TextBox.Text) > max then
                        TextBox.Text  = max
                    end
                    bar1.Size = UDim2.new((tonumber(TextBox.Text) or 0) / max, 0, 0, 5)
                    circlebar.Position = UDim2.new(1, -2, 0, -3)
                    TextBox.Text = tostring(tonumber(TextBox.Text) and math.floor( (tonumber(TextBox.Text) / max) * (max - min) + min) )
                    pcall(callback, TextBox.Text)
                end)
            end

            function main:AddTextbox(text,disappear,callback)
                local Textbox = Instance.new("Frame")
                local TextboxCorner = Instance.new("UICorner")
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxLabel = Instance.new("TextLabel")
                local txtbtn = Instance.new("TextButton")
                local RealTextbox = Instance.new("TextBox")
                local UICorner = Instance.new("UICorner")

                Textbox.Name = "Textbox"
                Textbox.Parent = ScrollPage
                Textbox.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Textbox.BackgroundTransparency = 0.500
                Textbox.Size = UDim2.new(0, 260, 0, 38)

                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.Parent = Textbox

                Textboxx.Name = "Textboxx"
                Textboxx.Parent = Textbox
                Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Textboxx.Position = UDim2.new(0, 1, 0, 1)
                Textboxx.Size = UDim2.new(0, 258, 0, 36)

                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx

                TextboxLabel.Name = "TextboxLabel"
                TextboxLabel.Parent = Textbox
                TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxLabel.BackgroundTransparency = 1.000
                TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
                TextboxLabel.Text = text
                TextboxLabel.Size = UDim2.new(0, 145, 0, 38)
                TextboxLabel.Font = Enum.Font.GothamSemibold
                TextboxLabel.TextColor3 = Color3.fromRGB(255,0,0)
                TextboxLabel.TextSize = 16.000
                TextboxLabel.TextTransparency = 0.500
                TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

                txtbtn.Name = "txtbtn"
                txtbtn.Parent = Textbox
                txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                txtbtn.BackgroundTransparency = 1.000
                txtbtn.Position = UDim2.new(0, 1, 0, 1)
                txtbtn.Size = UDim2.new(0, 258, 0, 36)
                txtbtn.Font = Enum.Font.SourceSans
                txtbtn.Text = ""
                txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                txtbtn.TextSize = 14.000

                RealTextbox.Name = "RealTextbox"
                RealTextbox.Parent = Textbox
                RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                RealTextbox.BackgroundTransparency = 0.500
                RealTextbox.Position = UDim2.new(0, 150, 0, 7)
                RealTextbox.Size = UDim2.new(0, 100, 0, 22)
                RealTextbox.Font = Enum.Font.GothamSemibold
                RealTextbox.Text = ""
                RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                RealTextbox.TextSize = 11.000
                RealTextbox.TextTransparency = 0.500

                txtbtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Textbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        TextboxLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                end)

                txtbtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Textbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        TextboxLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        RealTextbox,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                end)

                RealTextbox.FocusLost:Connect(function()
                    callback(RealTextbox.Text)
                    if disappear then
                        RealTextbox.Text = ""
                    end
                end)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = RealTextbox
            end

            function main:AddToggle(text,config,callback)
                local Toggle = Instance.new("Frame")
                local ToggleCorner = Instance.new("UICorner")
                local Tgle = Instance.new("Frame")
                local TgleCorner = Instance.new("UICorner")
                local tglebtn = Instance.new("TextButton")
                local ToggleLabel = Instance.new("TextLabel")
                local ToggleImage = Instance.new("Frame")
                local ToggleImageCorner = Instance.new("UICorner")
                local tgleimg = Instance.new("Frame")
                local tgleimg_2 = Instance.new("UICorner")

                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollPage
                Toggle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
                Toggle.BackgroundTransparency = 0.500
                Toggle.Size = UDim2.new(0, 260, 0, 38)

                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.Parent = Toggle

                Tgle.Name = "Tgle"
                Tgle.Parent = Toggle
                Tgle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Tgle.Position = UDim2.new(0, 1, 0, 1)
                Tgle.Size = UDim2.new(0, 258, 0, 36)

                TgleCorner.CornerRadius = UDim.new(0, 5)
                TgleCorner.Name = "TgleCorner"
                TgleCorner.Parent = Tgle

                tglebtn.Name = "tglebtn"
                tglebtn.Parent = Tgle
                tglebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tglebtn.BackgroundTransparency = 1.000
                tglebtn.Size = UDim2.new(0, 258, 0, 36)
                tglebtn.Font = Enum.Font.SourceSans
                tglebtn.Text = ""
                tglebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                tglebtn.TextSize = 14.000

                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Tgle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 190, 0, 36)
                ToggleLabel.Font = Enum.Font.GothamSemibold
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(233, 63, 63)
                ToggleLabel.TextSize = 16.000
                ToggleLabel.TextTransparency = 0.500
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Tgle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                ToggleImage.BackgroundTransparency = 0.500
                ToggleImage.Position = UDim2.new(0, 225, 0, 5)
                ToggleImage.Size = UDim2.new(0, 26, 0, 26)

                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.Parent = ToggleImage

                tgleimg.Name = "tgleimg"
                tgleimg.Parent = ToggleImage
                tgleimg.AnchorPoint = Vector2.new(0.5, 0.5)
                tgleimg.BackgroundColor3 = Color3.fromRGB(255,0,0)
                tgleimg.BackgroundTransparency = 0.500
                tgleimg.Position = UDim2.new(0, 13, 0, 13)
                tgleimg.Size = UDim2.new(0, 0, 0, 0)

                tgleimg_2.CornerRadius = UDim.new(0, 5)
                tgleimg_2.Name = "tgleimg_2"
                tgleimg_2.Parent = tgleimg

                tglebtn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        ToggleImage,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                    TweenService:Create(
                        tgleimg,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
				    ):Play()
                end)
                tglebtn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        ToggleImage,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                    TweenService:Create(
                        tgleimg,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
				    ):Play()
                end)
                if config == true then
                    istoggled = true
                    pcall(callback,istoggled)
                    tgleimg:TweenSize(UDim2.new(0, 26, 0, 26),"In","Bounce",0.1,true)
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(63,233,233)}
				    ):Play()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(63,233,233)}
                    ):Play()
                end

                local istoggled = config or false
                tglebtn.MouseButton1Click:Connect(function()
                    if istoggled == false then
                        istoggled = true
                        tgleimg:TweenSize(UDim2.new(0, 26, 0, 26),"In","Quad",0.1,true)
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(63,233,233)}
				        ):Play()
                        TweenService:Create(
                            ToggleLabel,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(63,233,233)}
                        ):Play()
                    else
                        istoggled = false
                        tgleimg:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(233,63,63)}
				        ):Play()
                        TweenService:Create(
                            ToggleLabel,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(233,63,63)}
                        ):Play()
                    end
                    pcall(callback,istoggled)
                end)
            end

            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollPage
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 260, 0, 20)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 16.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,15)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end

            return main
        end
        return uitab
    end
    return Ui
end
local function loading()
	local Loading = Instance.new("ScreenGui")
	local Blur = Instance.new("Frame")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Logo = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local Load = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Bar = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local BAR1 = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local Top = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TextLabel_2 = Instance.new("TextLabel")
	local TextLabel_3 = Instance.new("TextLabel")

	--Properties:

	Loading.Name = "Loading"
	Loading.Parent = game.CoreGui
	Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Blur.Name = "Blur"
	Blur.Parent = Loading
	Blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Blur.BackgroundTransparency = 0.500
	Blur.Size = UDim2.new(1, 0, 1, 0)

	Main.Name = "Main"
	Main.Parent = Blur
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.499241263, 0)
	Main.Size = UDim2.new(0, 500, 0, 300)

	UICorner.Parent = Main

	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Logo.Position = UDim2.new(0.400000006, 0, 0.163333327, 0)
	Logo.Size = UDim2.new(0, 100, 0, 100)
	Logo.Image = "rbxassetid://8346185306"

	UICorner_2.CornerRadius = UDim.new(0, 100)
	UICorner_2.Parent = Logo

	Load.Name = "Load"
	Load.Parent = Main
	Load.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Load.Position = UDim2.new(0, 15, 0, 170)
	Load.Size = UDim2.new(0, 470, 0, 115)

	UICorner_3.Parent = Load

	Bar.Name = "Bar"
	Bar.Parent = Load
	Bar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Bar.Position = UDim2.new(0, 15, 0, 80)
	Bar.Size = UDim2.new(0, 440, 0, 15)

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = Bar

	BAR1.Name = "BAR1"
	BAR1.Parent = Bar
	BAR1.BackgroundColor3 = Color3.fromRGB(255,0,0)
	BAR1.Size = UDim2.new(0, 0, 0, 15)

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = BAR1

	TextLabel.Parent = Load
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0319148935, 0, 0.173913032, 0)
	TextLabel.Size = UDim2.new(0, 440, 0, 25)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "Loading"
	TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
	TextLabel.TextSize = 16.000
	spawn(function()
		for i = 1,5 do 
			wait(0.5)
			TextLabel.Text = "Loading."
			wait(0.5) 
			TextLabel.Text = "Loading.."
			wait(0.5)
			TextLabel.Text = "Loading..."
		end
	end)

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Top.Size = UDim2.new(0, 500, 0, 30)

	UICorner_6.Parent = Top

	TextLabel_2.Parent = Top
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.Position = UDim2.new(0.0299999993, 0, 0, 0)
	TextLabel_2.Size = UDim2.new(0, 61, 0, 30)
	TextLabel_2.Font = Enum.Font.GothamSemibold
	TextLabel_2.Text = "Serkrxn HUB"
	TextLabel_2.TextColor3 = Color3.fromRGB(225, 225, 225)
	TextLabel_2.TextSize = 17.000

	TextLabel_3.Parent = Top
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.Position = UDim2.new(0.151999995, 0, 0, 0)
	TextLabel_3.Size = UDim2.new(0, 61, 0, 30)
	TextLabel_3.Font = Enum.Font.GothamSemibold
	TextLabel_3.Text = ""
	TextLabel_3.TextColor3 = Color3.fromRGB(255,0,0)
	TextLabel_3.TextSize = 17.000
	TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
	
	BAR1:TweenSize(UDim2.new(0,440,0,15),"Out","Linear",5,true)
	wait(5)
    Main:TweenSize(UDim2.new(0,0,0,0),"Out","Quad",0.4,true)
    wait(0.4)
	
	do 
		local Load = game.CoreGui:FindFirstChild("Loading")
		if Load then
			Load:Destroy()
		end
	end
end
loading()

if string.lower(game:GetService("RbxAnalyticsService"):GetClientId()) == game:GetService("RbxAnalyticsService"):GetClientId() then
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")

    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.Image = "rbxassetid://8622542227"
    ImageButton.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
end

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("Do not Support, Please wait...")
end


function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end       

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

spawn(function()
while wait() do
    pcall(function()
        if MobESP then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("MobEap") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "MobEap"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.MobEap.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("MobEap") then
                    v.MobEap:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if SeaESP then
            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("Seaesps") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "Seaesps"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.Seaesps.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Seaesps") then
                    v.Seaesps:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if NpcESP then
            for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("NpcEspes") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "NpcEspes"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.NpcEspes.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild("NpcEspes") then
                    v.NpcEspes:Destroy()
                end
            end
        end
    end)
end
end)

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    pcall(function()
        if MirageIslandESP then 
            if v.Name == "Mirage Island" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AfdESP then 
            if v.Name == "Advanced Fruit Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end



function InfAb()
    if InfAbility then
        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            local inf = Instance.new("ParticleEmitter")
            inf.Acceleration = Vector3.new(0,0,0)
            inf.Archivable = true
            inf.Drag = 20
            inf.EmissionDirection = Enum.NormalId.Top
            inf.Enabled = true
            inf.Lifetime = NumberRange.new(0,0)
            inf.LightInfluence = 0
            inf.LockedToPart = true
            inf.Name = "Agility"
            inf.Rate = 500
            local numberKeypoints2 = {
                NumberSequenceKeypoint.new(0, 0);
                NumberSequenceKeypoint.new(1, 4); 
            }
            inf.Size = NumberSequence.new(numberKeypoints2)
            inf.RotSpeed = NumberRange.new(9999, 99999)
            inf.Rotation = NumberRange.new(0, 0)
            inf.Speed = NumberRange.new(30, 30)
            inf.SpreadAngle = Vector2.new(0,0,0,0)
            inf.Texture = ""
            inf.VelocityInheritance = 0
            inf.ZOffset = 2
            inf.Transparency = NumberSequence.new(0)
            inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
            inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        end
    else
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end

local LocalPlayer = game:GetService'Players'.LocalPlayer
local originalstam = LocalPlayer.Character.Energy.Value
function infinitestam()
    LocalPlayer.Character.Energy.Changed:connect(function()
        if InfiniteEnergy then
            LocalPlayer.Character.Energy.Value = originalstam
        end 
    end)
end

spawn(function()
    pcall(function()
        while wait(.1) do
            if InfiniteEnergy then
                wait(0.1)
                originalstam = LocalPlayer.Character.Energy.Value
                infinitestam()
            end
        end
    end)
end)

function NoDodgeCool()
    if nododgecool then
        for i,v in next, getgc() do
            if game:GetService("Players").LocalPlayer.Character.Dodge then
                if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(v2) == "0.1" then
                        repeat wait(.1)
                            setupvalue(v,i2,0)
                        until not nododgecool
                        end
                    end
                end
            end
        end
    end
end

function fly()
    local mouse=game:GetService("Players").LocalPlayer:GetMouse''
    localplayer=game:GetService("Players").LocalPlayer
    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    local speedSET=25
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="EPIXPOS"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        gyro.CFrame = torso.CFrame
        repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand=true
                local new=gyro.CFrame - gyro.CFrame.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                speed=1
                end
                if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+speedSET
                end
                if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+speedSET
                end
                if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed+speedSET
                end
                if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed+speedSET
                end
                if speed>speedSET then
                speed=speedSET
                end
                pos.position=new.p
                if keys.w then
                gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                elseif keys.s then
                gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                else
                gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                end
        until not Fly
        if gyro then 
                gyro:Destroy() 
        end
        if pos then 
                pos:Destroy() 
        end
        flying=false
        localplayer.Character.Humanoid.PlatformStand=false
        speed=0
    end
    e1=mouse.KeyDown:connect(function(key)
        if not torso or not torso.Parent then 
                flying=false e1:disconnect() e2:disconnect() return 
        end
        if key=="w" then
            keys.w=true
        elseif key=="s" then
            keys.s=true
        elseif key=="a" then
            keys.a=true
        elseif key=="d" then
            keys.d=true
        end
    end)
    e2=mouse.KeyUp:connect(function(key)
        if key=="w" then
            keys.w=false
        elseif key=="s" then
            keys.s=false
        elseif key=="a" then
            keys.a=false
        elseif key=="d" then
            keys.d=false
        end
    end)
    start()
end

function Click()
    wait(.1)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(ToolSe)
    if not _G.NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

spawn(function()
while wait() do
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
        pcall(function()
            if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
                v:Destroy()
            end
        end)
    end
end
end)

function Check_Sword(Sword_Name)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventory")) do
        if (v.Type == "Sword") then
            if v.Name == Sword_Name then
                return true
            end
        end
    end
end

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

function BTP(P)
	repeat wait(1)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
	until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TelePPlayer(P)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end
    
    function TP(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 10000
    elseif Distance < 50 then
        Speed = 2000
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 750 then
        Speed = 250
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

    function TP1(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 25 then
            Speed = 5000
        elseif Distance < 50 then
            Speed = 2000
        elseif Distance < 150 then
            Speed = 800
        elseif Distance < 250 then
            Speed = 600
        elseif Distance < 500 then
            Speed = 300
        elseif Distance < 750 then
            Speed = 250
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
end

    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 25 then
            Speed = 5000
        elseif Distance < 50 then
            Speed = 2000
        elseif Distance < 150 then
            Speed = 800
        elseif Distance < 250 then
            Speed = 600
        elseif Distance < 500 then
            Speed = 300
        elseif Distance < 750 then
            Speed = 250
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
end

function TPB(CFgo)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

getgenv().ToTargets = function(p)
task.spawn(function()
    pcall(function()
        if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 250 then 
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
        elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
            local K = Instance.new("Part",game.Players.LocalPlayer.Character)
            K.Size = Vector3.new(1,0.5,1)
            K.Name = "Root"
            K.Anchored = true
            K.Transparency = 1
            K.CanCollide = false
            K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
        end
        local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
        local z = game:service("TweenService")
        local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
        local S,g = pcall(function()
        local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
        q:Play()
    end)
    if not S then 
        return g
    end
    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
            pcall(function()
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                    spawn(function()
                        pcall(function()
                            if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            else 
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                            end
                        end)
                    end)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                end
            end)
        end
    end)
end)
end

Type = 1
spawn(function()
while wait(.1) do
    if Type == 1 then
        Pos = CFrame.new(0,PosY,0)
    elseif Type == 2 then
        Pos = CFrame.new(0,PosY,-30)
    elseif Type == 3 then
        Pos = CFrame.new(30,PosY,0)
    elseif Type == 4 then
        Pos = CFrame.new(0,PosY,30)	
    elseif Type == 5 then
        Pos = CFrame.new(-30,PosY,0)
    elseif Type == 6 then
        Pos = CFrame.new(0,35,0)
    end
    end
end)

spawn(function()
while wait(.1) do
    Type = 1
    wait(0.5)
    Type = 2
    wait(0.5)
    Type = 3
    wait(0.5)
    Type = 4
    wait(0.5)
    Type = 5
    wait(0.5)
end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmNearest and AutoFarmNearestMagnet or SelectMag and _G.BringMonster then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                        if InMyNetWork(v.HumanoidRootPart) then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                        end
                    end
                end
            end
        end)
    end
    end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate then
        if not game:GetService("Workspace"):FindFirstChild("LOL") then
            local LOL = Instance.new("Part")
            LOL.Name = "LOL"
            LOL.Parent = game.Workspace
            LOL.Anchored = true
            LOL.Transparency = 1
            LOL.Size = Vector3.new(30,-0.5,30)
        elseif game:GetService("Workspace"):FindFirstChild("LOL") then
            game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
        end
    else
        if game:GetService("Workspace"):FindFirstChild("LOL") then
            game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
        end
    end
end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoVampire or AutoFarmChest or _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.AutoKai or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.AutoRace or _G.RaidPirate == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function InstancePos(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

function TP3(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFactory or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.d or _G.Autowaden or _G.Autogay or _G.AutoObservationHakiV2 or _G.AutoFarmMaterial or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoRaidPirate or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.AttackDummy or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Farmfast or _G.RaidPirate == true then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end)
        end    
    end
end)

spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AutoClick or Fastattack then
         pcall(function()
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
        end)
    end
end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

spawn(function()
    pcall(function()
        while wait() do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then 
                        SelectWeaponGun = v.Name
                    end
                end
            end
        end
    end)
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function CheckItem(ah)
    for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == ah then
            return v
        end
    end
end

function CheckSea(e)
    if game.PlaceId == 2753915549 then
        if e == 1 then
            return true
        end
    elseif game.PlaceId == 4442272183 then
        if e == 2 then
            return true
        end
    elseif game.PlaceId == 7449423635 then
        if e == 3 then
            return true
        end
    end
    return false
end
w = task.wait
t = task

TempleOfTimeCFrame =
CFrame.new(
28734.3945,
14888.2324,
-109.071777,
-0.650207579,
4.1780531e-08,
-0.759756625,
1.97876595e-08,
1,
3.80575109e-08,
0.759756625,
9.71147784e-09,
-0.650207579
)

spawn(
        function()
            while task.wait() do
                if _G.AutoDooHee then
                    MoveCamtoMoon()
                end
            end
        end
    )
    Memayto = false
    DaGatCan = false
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
        DaGatCan = true
    end
    function PullLever()
        local bn =
            CFrame.new(
            28576.4688,
            14939.2832,
            76.5164413,
            -1,
            0,
            0,
            0,
            0.707134247,
            -0.707079291,
            -0,
            -0.707079291,
            -0.707134247
        )
        local bo =
            CFrame.new(
            28576.4688,
            14935.9512,
            75.469101,
            -1,
            -4.22219593e-08,
            1.13133396e-08,
            0,
            -0.258819044,
            -0.965925813,
            4.37113883e-08,
            -0.965925813,
            0.258819044
        )
        local bp = 0.2
        if
            game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or
                game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp
         then
            CheckAndTweenTemple()
            topos(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
            for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    end
	function IsMirageIsland2()
		if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
			return true
		else
			return false
		end
	end
	function TweenTemple()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
			"requestEntrance",
			Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
		)
	end
function TweenTempleLegit()
		AllNPCS = getnilinstances()
		for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
			table.insert(AllNPCS, v)
		end
		for r, v in pairs(AllNPCS) do
			if v.Name == "Mysterious Force" then
				TempleMysteriousNPC1 = v
			end
			if v.Name == "Mysterious Force3" then
				TempleMysteriousNPC2 = v
			end
		end
		topos(TempleMysteriousNPC2.HumanoidRootPart.CFrame)
		wait(0.5)
		if
			(TempleMysteriousNPC2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
				15
		 then
			game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
		end
		if
			(TempleMysteriousNPC1.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
				15
		 then
			game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
         end
	end
	function CheckAndTweenTemple()
		if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
			TweenTemple()
		end
		if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
			TweenTemple()
		end
	end
    function MoonTextureId()
        if Sea1 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea2 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea3 then
            return game:GetService("Lighting").Sky.MoonTextureId
        end
    end
	function CheckMoon()
		moon8 = "http://www.roblox.com/asset/?id=9709150401"
		moon7 = "http://www.roblox.com/asset/?id=9709150086"
		moon6 = "http://www.roblox.com/asset/?id=9709149680"
		moon5 = "http://www.roblox.com/asset/?id=9709149431"
		moon4 = "http://www.roblox.com/asset/?id=9709149052"
		moon3 = "http://www.roblox.com/asset/?id=9709143733"
		moon2 = "http://www.roblox.com/asset/?id=9709139597"
		moon1 = "http://www.roblox.com/asset/?id=9709135895"
		moonreal = MoonTextureId()
		cofullmoonkothangbeo = "Bad Moon"
		if moonreal == moon5 or moonreal == moon4 then
			if moonreal == moon5 then
				cofullmoonkothangbeo = "Full Moon"
			elseif moonreal == moon4 then
				cofullmoonkothangbeo = "Next Night"
			end
		end
		return cofullmoonkothangbeo
	end
	function getBlueGear()
		if game.workspace.Map:FindFirstChild("MysticIsland") then
			for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
				if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
					return v
				end
			end
		end
	end
	function getHighestPoint()
		if not game.workspace.Map:FindFirstChild("MysticIsland") then
			return nil
		end
		for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
			if v:IsA("MeshPart") then
				if v.MeshId == "rbxassetid://6745037796" then
					return v
				end
			end
		end
	end
	spawn(function()
        if TwenetoHighestPoint then
		HighestPoint = getHighestPoint()
		if HighestPoint then
			topos(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
		end
    end
	end)
	function MoveCamtoMoon()
		workspace.CurrentCamera.CFrame =
			CFrame.new(
			workspace.CurrentCamera.CFrame.Position,
			game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
		)
	end

	spawn(function()
    if TweentoBlueGear then
		BlueGear = getBlueGear()
		if BlueGear then
			topos(BlueGear.CFrame)
		end
    end
	end)

    local Client = game.Players.LocalPlayer
    local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
    local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    spawn(function()
        while task.wait() do
            pcall(function()
                if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
                if not shared.cpc then shared.cpc = STOP.play end
                    STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                    local Hits = STOPRL.getBladeHits(b,c,d)
                    if Hits then
                        if _G.FastAttack then
                            STOP.play = function() end
                            a:Play(0.01,0.01,0.01)
                            func(Hits)
                            STOP.play = shared.cpc
                            wait(a.length * 0.5)
                            a:Stop()
                        else
                            a:Play()
                        end
                    end
                end
            end)
        end
    end)

function GetBladeHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local p13 = CmrFwLib.activeController
    local weapon = p13.blades[1]
    if not weapon then 
        return weapon
    end
    while weapon.Parent ~= game.Players.LocalPlayer.Character do
        weapon = weapon.Parent 
    end
    return weapon
end
function AttackHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local plr = game.Players.LocalPlayer
    for i = 1, 1 do
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            pcall(function()
                CmrFwLib.activeController.timeToNextAttack = 1
                CmrFwLib.activeController.attacking = false
                CmrFwLib.activeController.blocking = false
                CmrFwLib.activeController.timeToNextBlock = 0
                CmrFwLib.activeController.increment = 3
                CmrFwLib.activeController.hitboxMagnitude = 120
                CmrFwLib.activeController.focusStart = 0
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
            end)
        end
    end
end
spawn(function()
    while wait(.1) do
        if _G.FastAttack then
            pcall(function()
                repeat task.wait(_G.FastAttackDelay)
                    AttackHit()
                until not _G.FastAttack
            end)
        end
    end
end)

local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
CamShake:Stop()

    HttpService = game:GetService("HttpService")
    local i = "Night Hub"
    local j = "-BloxFruit.json"
    local l = game.Players.LocalPlayer.Name .. j
    if Adel then
        HttpService = game:GetService("HttpService")
        local i = "Night Hub"
        local j = "-BloxFruit.json"
        local l = game.Players.LocalPlayer.Name .. j
    end
    function SaveSettings(m, n)
        if m ~= nil then
            h[m] = n
        end
        HttpService = game:GetService("HttpService")
        if not isfolder(i) then
            makefolder(i)
        end
        writefile(i .. "/" .. l, HttpService:JSONEncode(h))
    end
    function ReadSetting()
        local s, o =
            pcall(
            function()
                HttpService = game:GetService("HttpService")
                if not isfolder(i) then
                    makefolder(i)
                end
                return HttpService:JSONDecode(readfile(i .. "/" .. l))
            end
        )
        if s then
            return o
        else
            SaveSettings()
            return ReadSetting()
        end
    end

    function MoonTextureId()
        if Sea1 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea2 then
            return game:GetService("Lighting").FantasySky.MoonTextureId
        elseif Sea3 then
            return game:GetService("Lighting").Sky.MoonTextureId
        end
    end

    function CheckMoon()
        moon8 = "http://www.roblox.com/asset/?id=9709150401"
        moon7 = "http://www.roblox.com/asset/?id=9709150086"
        moon6 = "http://www.roblox.com/asset/?id=9709149680"
        moon5 = "http://www.roblox.com/asset/?id=9709149431"
        moon4 = "http://www.roblox.com/asset/?id=9709149052"
        moon3 = "http://www.roblox.com/asset/?id=9709143733"
        moon2 = "http://www.roblox.com/asset/?id=9709139597"
        moon1 = "http://www.roblox.com/asset/?id=9709135895"
        moonreal = MoonTextureId()
        cofullmoonkothangbeo = "Bad Moon"
        if moonreal == moon5 or moonreal == moon4 then
            if moonreal == moon5 then
                cofullmoonkothangbeo = "Full Moon"
            elseif moonreal == moon4 then
                cofullmoonkothangbeo = "Next Night"
            end
        end
        return cofullmoonkothangbeo
    end

    function function7()
        GameTime = "Error"
        local c = game.Lighting
        local ao = c.ClockTime
        if ao >= 18 or ao < 5 then
            GameTime = "Night"
        else
            GameTime = "Day"
        end
        return GameTime
    end
    function function6()
        return math.floor(game.Lighting.ClockTime)
    end
    function getServerTime()
        RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
        RealTime = tostring(game.Lighting.ClockTime)
        RealTimeTable = RealTime:split(".")
        Minute, Second = RealTimeTable[1], tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
        return Minute, Second
    end
    function function8()
        local c = game.Lighting
        local ao = c.ClockTime
        if CheckMoon() == "Full Moon" and ao <= 5 then
            return tostring(function6()) .. " ( Will End Moon In " .. math.floor(5 - ao) .. " Minutes )"
        elseif CheckMoon() == "Full Moon" and (ao > 5 and ao < 12) then
            return tostring(function6()) .. " ( Fake Moon )"
        elseif CheckMoon() == "Full Moon" and (ao > 12 and ao < 18) then
            return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
        elseif CheckMoon() == "Full Moon" and (ao > 18 and ao <= 24) then
            return tostring(function6()) .. " ( Will End Moon In " .. math.floor(24 + 6 - ao) .. " Minutes )"
        end
        if CheckMoon() == "Next Night" and ao < 12 then
            return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
        elseif CheckMoon() == "Next Night" and ao > 12 then
            return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 + 12 - ao) .. " Minutes )"
        end
        return tostring(function6())
    end

    function CheckAcientOneStatus()
        if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
            return "You have yet to achieve greatness"
        end
        local v227 = nil
        local v228 = nil
        local v229 = nil
        v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
        if v229 == 1 then
            return "Required Train More"
        elseif v229 == 2 or v229 == 4 or v229 == 7 then
            return "Can Buy Gear With " .. v227 .. " Fragments"
        elseif v229 == 3 then
            return "Required Train More"
        elseif v229 == 5 then
            return "You Are Done Your Race."
        elseif v229 == 6 then
            return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
        end
        if v229 ~= 8 then
            if v229 == 0 then
                return "Ready For Trial"
            else
                return "You have yet to achieve greatness"
            end
        end
        return "Remaining " .. 10 - v228 .. " training sessions."
    end

spawn(function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do
            if v.Name == "DataLoaded" or v.Name == "DataPreloaded" then
                v:Destroy()
            end
        end
    end
end)

spawn(function() 
    repeat
        task.wait()
    until game:IsLoaded()
    repeat
        task.wait()
    until game.Players
    repeat
        task.wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Team ~= nil 
    wait(1.5)
    require(game.ReplicatedStorage.Notification).new("<Color=Yellow>Serkrxn Hub<Color=/>"):Display()
    wait(.14)
end)

BoatsName = {}

for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
  table.insert(BoatsName ,v.Name)
end

local win = library:AddWindow("Serkrxn")

local MainTab = win:AddTab("Main")
local Main1 = MainTab:AddPage()
local Main2 = MainTab:AddPage()
local Main3 = MainTab:AddPage()
local Main4 = MainTab:AddPage()

Main1:AddSeperator("Welcome to Hub")

Main1:AddLabel("Game : Blox Fruits")

local timelabel = Main1:AddLabel("Server Time")

spawn(function()
    while Wait() do 
        pcall(function()
            local GameTime = math.floor(workspace.DistributedGameTime+0.5)
            local Hour = math.floor(GameTime/(60^2))%24
            local Minute = math.floor(GameTime/(60^1))%60
            local Second = math.floor(GameTime/(60^0))%60
            timelabel:Set("Server Time : "..Hour.."h "..Minute.."m "..Second.."s")
        end)
    end
end)



Main1:AddSeperator("Script : Boat Tool")

local Boats = Main1:AddDropdown("Selected Boats",BoatsName,function(plys)
  _G.SelectB = plys
end)

Main1:AddButton("Refresh Boat List",function()
    BoatsName = {}
    Boats:Clear()
    for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
       Boats:Add(v.Name)
    end
end)

Main1:AddToggle("Spectate Boats",Config,function(bool)
    Sp = bool
    local plr1 = game.Players.LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Workspace").Boats:FindFirstChild(_G.SelectB)
    repeat wait(.1)
       game.Workspace.Camera.CameraSubject = game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat
    until Sp == false 
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)



Main1:AddButton("Bring Boat",function()
    game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.CFrame = game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame
end)

Main1:AddButton("Speed Boat",function()
    game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.MaxSpeed = 350
end)

Main1:AddTextbox("Rage Fly","Number", function(v)
    _G.flyb = tonumber(v) or _G.flyb
end)

Main1:AddButton("Set Fly boat range", function()
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, _G.flyb, 1000)
end)

Main1:AddButton("Remove Fog", function()
    game:GetService("Lighting").FogEnd = 100000 for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do if v:IsA("Atmosphere") then v:Destroy() end end
end)

Main2:AddSeperator("FUN")

Playerslist = {}
    
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local SelectedPly = Main2:AddDropdown("Selected Player",Playerslist,function(value)
    _G.SelectPly = plys
  end)

Main2:AddButton("Refresh Player", function()
        Playerslist = {}
        SelectedPly:Clear()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
end)

Main2:AddToggle("Teleport Boat To Player",Config,function(bool)
    _G.flyty = bool
    while _G.flyty do
        wait()
        pcall(function()
game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.CFrame = game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame
        end)
    end
end)


Main3:AddSeperator("Mirage Island")

Main3:AddToggle("Teleport To Mirage Island",Config,function(Value)
    _G.AutoMysticIsland = Value
    StopTween(_G.AutoMysticIsland)
end)


spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoMysticIsland then
                    repeat
                        wait()
                    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                        AllNPCS = getnilinstances()
                        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for r, v in pairs(AllNPCS) do
                            if v.Name == "Advanced Fruit Dealer" then
                                topos(v.HumanoidRootPart.CFrame)
                            end
                        end
                    end
                end
            end
    end)
end)

Main3:AddToggle("Teleport To Advanced Fruit Dealer",Config,function(Value)
    _G.afdd = Value
    StopTween(_G.afdd)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.afdd then
                    repeat
                        wait()
                    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                        AllNPCS = getnilinstances()
                        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for r, v in pairs(AllNPCS) do
                            if v.Name == "Advanced Fruit Dealer" then
                                topos(v.HumanoidRootPart.CFrame)
                            end
                        end
                    end
                end
            end
    end)
end)

Main4:AddSeperator("Server")

Main4:AddTextbox("Job id","", function(Value)
    _G.Job = Value 
end)

Main4:AddButton("Join Job id", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
end)

