--[[
_________________________________________________________________________________________________________________________
   ______   ____     ____     _   __   _____    __    ___   __  __   _____     __ __    ____    ____    ____    ____ 
  / ____/  / __ \   / __ \   / | / /  |__  /   / /   <  /  / / / /  / ___/  __/ // /_  / __ \  / __ \  / __ \  / __ \
 / /      / / / /  / /_/ /  /  |/ /    /_ <   / /    / /  / / / /   \__ \  /_  _  __/ / /_/ / / /_/ / / /_/ / / /_/ /
/ /___   / /_/ /  / _, _/  / /|  /   ___/ /  / /___ / /  / /_/ /   ___/ / /_  _  __/  \__, /  \__, /  \__, /  \__, / 
\____/   \____/  /_/ |_|  /_/ |_/   /____/  /_____//_/   \____/   /____/   /_//_/    /____/  /____/  /____/  /____/  
_______________________________________________________________________________________________________________________                                                                                                                                                                                              
]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ND-RingPD")


RegisterNetEvent("callpolice")
AddEventHandler("callpolice", function()
   local players = {}
   local users = vRP.getUsers({})
   local Politi = false
   
     for k,v in pairs(users) do
       
         local player = vRP.getUserSource({k})
         
         if player ~= nil then
           local user_id = vRP.getUserId({player})
   
           Politi = vRP.hasGroup({user_id,ND.politi})
   
           if Politi then
             table.insert(players,player)
           end
         end
   end
   
   for k,v in pairs(players) do
message = ND.besked
TriggerClientEvent('dispatch', v, message)
end
end)