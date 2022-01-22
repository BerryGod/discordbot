if game.PlaceId == 8380203210 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
	local Forums = Library.new("Obliteration Orbs")

	local autofarms = Forums:NewSection("Auto-Farm")
	local autokills = Forums:NewSection("Auto-Kill")
	local miscs = Forums:NewSection("Misc")
	local creditss = Forums:NewSection("Credits")

	getgenv().fireball = false
	getgenv().blackhole = false
	getgenv().meteor = false
	getgenv().collectOrbsToggle = false

	autokills:NewToggle(
		"auto fireball",
		function(bool)
			getgenv().fireball = bool
			if bool then
				sendfireball()
			end
		end
	)
	autokills:Seperator()
	autokills:NewToggle(
		"auto blackhole",
		function(bool)
			getgenv().fireball = bool
			if bool then
				sendfireball()
			end
		end
	)
	autokills:Seperator()
	autokills:NewToggle(
		"auto meteor",
		function(bool)
			getgenv().fireball = bool
			if bool then
				sendfireball()
			end
		end
	)

	autofarms:NewToggle(
		"auto collect orbs",
		function(bool)
			getgenv().collectOrbsToggle = bool
			if bool then
				autoballs()
			end
		end
	)

	miscs:NewButton(
		"Infinte Yield",
		function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end
	)
	miscs:Seperator()
	miscs:NewButton(
		"CMD-X",
		function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
		end
	)
	miscs:Seperator()
	miscs:NewButton(
		"Dark Dex",
		function()
			loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
		end
	)

	creditss:NewButton(
		"Main dev: BerryGod",
		function()
			setclipboard("BerryGod")
		end
	)

	creditss:Seperator()
	creditss:NewButton(
		"Dev: LULIPUP",
		function()
			setclipboard("LULIPUP")
		end
	)
	creditss:Seperator()
	creditss:NewButton(
		"Dev: PumpkinMan",
		function()
			setclipboard("PumpkinMan")
		end
	)
	creditss:Seperator()
	creditss:NewButton(
		"UI lib: xHeptc",
		function()
			setclipboard("xHeptc")
		end
	)

	function sendfireball()
		spawn(
			function()
				while getgenv().fireball == true do
					game:GetService("ReplicatedStorage").Events.AttemptToSpawnFireball_Event:FireServer()
					wait()
				end
			end
		)
	end
	function sendblackhole()
		spawn(
			function()
				while getgenv().fireball == true do
					game:GetService("ReplicatedStorage").Events.AttemptToSpawnBlackHole_Event:FireServer()
					wait()
				end
			end
		)
	end
	function sendmeteor()
		spawn(
			function()
				while getgenv().meteor == true do
					game:GetService("ReplicatedStorage").Events.AttemptToSpawnMeteor_Event:FireServer()
					wait()
				end
			end
		)
	end
	function autoballs()
		spawn(
			function()
				while wait() do
					if collectOrbsToggle == true then
						for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
							if v.Name == "TouchInterest" and v.Parent then
								firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 0)
								wait(.001)
								firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 1)
								break
							end
						end
					end
				end
			end
		)
	end
end
