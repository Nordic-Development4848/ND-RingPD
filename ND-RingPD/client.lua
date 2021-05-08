--[[
_________________________________________________________________________________________________________________________
   ______   ____     ____     _   __   _____    __    ___   __  __   _____     __ __    ____    ____    ____    ____ 
  / ____/  / __ \   / __ \   / | / /  |__  /   / /   <  /  / / / /  / ___/  __/ // /_  / __ \  / __ \  / __ \  / __ \
 / /      / / / /  / /_/ /  /  |/ /    /_ <   / /    / /  / / / /   \__ \  /_  _  __/ / /_/ / / /_/ / / /_/ / / /_/ /
/ /___   / /_/ /  / _, _/  / /|  /   ___/ /  / /___ / /  / /_/ /   ___/ / /_  _  __/  \__, /  \__, /  \__, /  \__, / 
\____/   \____/  /_/ |_|  /_/ |_/   /____/  /_____//_/   \____/   /____/   /_//_/    /____/  /____/  /____/  /____/  
_______________________________________________________________________________________________________________________                                                                                                                                                                                              
]]--

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ND-RingPD")

cooldown = false

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 441.8059387207,-980.44152832031,31.641317367554, true ) < 2 then
           Corn3D(441.8059387207,-980.44152832031,31.141317367554, "Tryk ~b~[E]~w~ for at ringe på klokken")
         if IsControlJustReleased(1, 38) then
             if cooldown == false then
               TriggerEvent("pNotify:SendNotification",{text = "Du har ringet på klokken - Politiet vil ankomme så snart de har tid",type = "success",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"clock.ogg"},volume = 0.5,conditions = {"docVisible"}}, killer = true}) 
                TriggerServerEvent("callpolice")
                cooldown = true
                Citizen.Wait(200)
             else
                 TriggerEvent("pNotify:SendNotification",{text = "Du skal vente for at kunne ringe på klokken igen",type = "error",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"cdd.ogg"},volume = 0.5,conditions = {"docVisible"}}, killer = true}) 
             end
          end
       end
    end
end)


Citizen.CreateThread(function()
    while true do
     Citizen.Wait(1)
       if cooldown == true then
         Citizen.Wait(ND.cooldown) 
           cooldown = false
       end
    end
end)


RegisterNetEvent("dispatch")
AddEventHandler("dispatch", function(message)
PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
TriggerEvent('chatMessage', '^3[9-1-1 - Central Alarm]', "^3[9-1-1 - Central Alarm]", message)
end)


function Corn3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end