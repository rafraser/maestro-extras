
maestro.command("skeleton", {"player:target"}, function(caller, targets)
	if #targets == 0 then return true, "Query matched no players." end
	
	for i = 1, #targets do
		local ply = targets[i]
		
		if not ply:Alive() then
			if #targets == 1 then return true, "Player is dead!" end
			continue
		end
		
		local skeletonPos, skeletonDirection = ply:GetPos() + ply:GetForward() * 1000 + Vector(0, 0, 12), ply:GetForward() * -1
		local skeleton = ents.Create("prop_physics")
		skeleton:SetModel("models/player/skeleton.mdl")
		skeleton:SetAngles(skeletonDirection:Angle() + Angle(0, 270, 0))
		skeleton:SetPos(skeletonPos)
		skeleton:Spawn()
		skeleton:Activate()
		skeleton:EmitSound("items/halloween/spooky02.wav", 100, 150,0.8)
		local phys = skeleton:GetPhysicsObject()
		phys:SetVelocity(skeletonDirection * 100000)
		
		timer.Simple(3, function()
			skeleton:Remove()
		end)
	end
	
	return false, "skeleton'd %1"
end, [[
Spooky scary skeletons and shivers down your spine.]])
--Plugin by FluffyXVI--
