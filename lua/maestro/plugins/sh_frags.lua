maestro.command("frags", {"player:target","frags:number"}, function(caller, targets,frags)
	if #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:SetFrags(frags)
	end
	return false, "set the frags of %1 to %2"
end, [[Set player frags.]])

maestro.command("deaths", {"player:target","deaths:number"}, function(caller, targets,deaths)
	if #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:SetDeaths(deaths)
	end
	return false, "set the deaths of %1 to %2"
end, [[Set player frags.]])
