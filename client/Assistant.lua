local Proxy = module('vrp', 'lib/Proxy')
local Tunnel = module('vrp', 'lib/Tunnel')
local kConfig = module('koalaAssistant', 'config')


local Assistant = {
  ped = kConfig.assitantPed
}
Proxy.addInterface('Assistant', Assistant)
Tunnel.bindInterface('Assistant', Assistant)

function Assistant.new(Player)
  local model = GetHashKey(Assistant.ped)
  RequestModel(model)
  while not HasModelLoaded(model) do
    Wait(1)
  end

  local assistant = CreatePed(5, model, Player.coord.x+2.5, Player.coord.y, Player.coord.z, Player.heading-180, true, true)
  SetEntityAsMissionEntity(assistant, true, true)

  return assistant
end

