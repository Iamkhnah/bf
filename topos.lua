
local ggggg = setmetatable({}, {
	__index = function(ar, i)
		if i == "2753915549" then
			return {
				['Sky_Island_1'] = Vector3.new(-4652, 873, -1754),
				['Sky_Island_2'] = Vector3.new(-7895, 5547, -380),
				['Under_Water_Island'] = Vector3.new(61164, 5, 1820),
				['Under_Water_Island_Entrance'] = Vector3.new(3865, 5, -1926)
			}
		elseif i == "4442272183" then
			return {
				['Flamingo_Mansion'] = Vector3.new(-317, 331, 597),
				['Flamingo_Room'] = Vector3.new(2283, 15, 867),
				['Cursed_Ship'] = Vector3.new(923, 125, 32853),
				['Zombie_Island'] = Vector3.new(-6509, 83, -133)
			}
		elseif i  == "7449423635" then
			return {
				["Mansion"] = Vector3.new(-12471, 374, -7551),
				['Hydra'] = Vector3.new(5659, 1013, -341),
				['Caslte_On_The_Sea'] = Vector3.new(-5092, 315, -3130),
				['Floating_Turtle'] = Vector3.new(-12001, 332, -8861),
				['Beautiful_Pirate'] = Vector3.new(5319, 23, -93),
				['Temple_Of_Time'] = Vector3.new(28286, 14897, 103)
			}
		else
			return
		end
	end
})

function getdis(v, v2)
	if not v2 then
		v2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
	return (v.Position - v2.Position).Magnitude
end
function cd(p)
	if ggggg[tostring(game.PlaceId)] then
		local aa = {
			math.huge,
			nil
		}
		for i, v in pairs(ggggg[tostring(game.PlaceId)]) do
			if getdis(CFrame.new(v), p)  < aa[1] then
				aa[1] = getdis(CFrame.new(v), p)
				aa[2] = v
			end
		end
		if getdis(p) > aa[1] then
			game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", aa[2])
			wait(1)
		end
	end
end

return function(p)
	local f = game:GetService("TweenService")
	spawn(function()
		cd(p)
	end)
	local dfy = p.Position.Y
	if math.floor(math.abs(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y - dfy)) > 5 then
		local tr = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tr.X, dfy, tr.Z)
		wait(0.5)
	end
	if getdis(p) < 200 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
	else
		local troi = f:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(getdis(p) / (getgenv().TweenSpeed or 300), Enum.EasingStyle.Linear), {
			CFrame = p
		})
		troi:Play()
	end
end
