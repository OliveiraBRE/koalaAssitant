local Proxy = module('vrp', 'lib/Proxy')
local Tunnel = module('vrp', 'lib/Tunnel')
local vRP =  Proxy.getInterface('vRP')
local kPlayer = Tunnel.getInterface('Player')
local Assistant = Tunnel.getInterface('Assistant')
local client = Tunnel.getInterface('client')

RegisterCommand('Koalita', function(source, args)
  
  Player = {
    id = vRP.getUserId(source),
    coord = kPlayer.getCoord(source),
    heading = kPlayer.getHeading(source)
  }
  
  local Koalita = Assistant.new(source, Player)
 
  TriggerClientEvent('Koala:Assistant', source, Koalita, args)
  
end)

RegisterCommand('lita', function(source, args)
 client.execute(source, args)
end)

