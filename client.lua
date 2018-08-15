local cinematicbars = true
local hideminimap = false


AddEventHandler("playerSpawned", function(spawn)
	SendNUIMessage({
		action = "close"
	})
end)


RegisterNetEvent('Toxi2ks-cinema:activate')
AddEventHandler('Toxi2ks-cinema:activate', function()
	if cinematicbars then
		SendNUIMessage({
			action = "open"
		})
		hideminimap = true
		cinematicbars = false
	else
		SendNUIMessage({
			action = "close"
		})
		hideminimap = false
		cinematicbars = true
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if hideminimap then
			DisplayRadar(false)
		else
			DisplayRadar(true)
		end
	end
end)
