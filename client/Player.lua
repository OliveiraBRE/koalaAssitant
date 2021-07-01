local Proxy = module('vrp', 'lib/Proxy')
local Tunnel = module('vrp', 'lib/Tunnel')


Player = {
  playerPed = GetPlayerPed(-1)
}
Proxy.addInterface('Player', Player)
Tunnel.bindInterface('Player', Player)

function Player.getCoord(ped)
  return GetEntityCoords(Player.playerPed or ped)
end

function Player.getHeading(ped)
  return GetEntityHeading(Player.playerPed or ped)
end

