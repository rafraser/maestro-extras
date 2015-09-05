maestro.command("time", {}, function(caller)
	local serverTime = os.date( "%A the %dth of %B at %I:%M:%S%p" )
	caller:ChatPrint("It is currently " .. serverTime)
	return false
end, [[Get the current time on the server.]])

--Plugin by FluffyXVI
