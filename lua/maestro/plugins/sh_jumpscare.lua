maestro.command("scare", {"player:target"}, function(caller, targets)
	if #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:EmitSound("npc/stalker/go_alert2a.wav", 511, 100, 1)
	end
	return false, "scared %1"
end, [[Scare your friends]])

--Plugin by FluffyXVI
