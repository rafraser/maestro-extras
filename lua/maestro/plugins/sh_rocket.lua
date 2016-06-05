
maestro.command("rocket", {"player:target"}, function(caller, targets)
	if #targets == 0 then return true, "Query matched no players." end
	
	for i = 1, #targets do
		local ply = targets[i]
		
		if not ply:Alive() then
			if #targets == 1 then return true, "Player is dead!" end
			continue
		end
		
		ply:SetVelocity( Vector(0, 0, 2000) )
		timer.Simple(1, function()
			local boom = ents.Create("env_explosion")
			boom:SetPos(ply:GetPos())
			boom:Spawn()
			boom:SetKeyValue("iMagnitude", "100")
			boom:Fire("Explode")
			ply:KillSilent()
		end)
	end
	
	return false, "rocketed %1"
end, [[
Space program on a budget.]])

maestro.command("firework", {"player:target","scale:number(optional)","steps:number(optional)","density:number(optional)"}, function(caller, targets, scale, steps, density)
	if not IsValid(targets[1]) then
		return true, "Query matched no players."
	end
	if #targets > 1 then
		return true, "Query matched more than 1 player."
	end
	
	ply = targets[1]
	if not ply:Alive() then
		return true, "Player is dead!"
	end
	
	local scale = tonumber(scale) or 1
	local steps = tonumber(steps) or 10
	local density = tonumber(density) or 64
	print( scale, steps, density )
	-- Prevent abuse of lag particles
	scale = math.Clamp(scale, 0.01, 10)
	steps = math.Clamp(steps, 1, 100 )
	density = math.Clamp(density, 1, 350 )
		
	ply:SetVelocity( Vector(0, 0, 1000) )
	
	timer.Simple(1, function()
		local pos = ply:GetPos()
		local effectdata = EffectData()
		effectdata:SetOrigin( pos )
		effectdata:SetScale( scale )
		effectdata:SetRadius( density )
		effectdata:SetMagnitude( steps )
		util.Effect( "maestro_firework", effectdata )
		ply:KillSilent()
	end)
	
	return false, "turned %1 into a firework"
end, [[
Pretty rockets.]])

maestro.command("velocity", {"player:target","xpower:number(optional)","ypower:number(optional)","zpower:number(optional)","explode:boolean(optional)"}, function(caller, targets, xpower, ypower, zpower, explode)
	if #targets == 0 then return true, "Query matched no players." end
	
	for i = 1, #targets do
		local ply = targets[i]
		
		if not ply:Alive() then
			if #targets == 1 then return true, "Player is dead!" end
			continue
		end
		local x = xpower or 0
		local y = ypower or 0
		local z = zpower or 0
		ply:SetVelocity( Vector(x, y, z) )
		if explode then
			timer.Simple(1, function()
				local boom = ents.Create("env_explosion")
				boom:SetPos(ply:GetPos())
				boom:Spawn()
				boom:SetKeyValue("iMagnitude", "100")
				boom:Fire("Explode")
				ply:KillSilent()
			end)
		end
	end
	if explode then
		return false, "sent %1 flying to an explosive demise"
	else
		return false, "sent %1 flying"
	end
end, [[
Space program on a budget.]])

--Plugin by FluffyXVI