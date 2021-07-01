local Proxy = module('vrp', 'lib/Proxy')
local Tunnel = module('vrp', 'lib/Tunnel')
local animation = module('koalaAssistant', 'animations')


RegisterNetEvent('Koala:Assistant')
AddEventHandler('Koala:Assistant', function(Assistant, args)
  local playerPed = GetPlayerPed(-1)
  
  local function getDistance(playerCoord, assistant)
    return GetDistanceBetweenCoords(playerCoord, GetEntityCoords(assistant), 0.00001)  
  end
  

  CreateThread(function()
    
    while true do
      Wait(1)
      local playerCoord = GetEntityCoords(playerPed)
      local playerHeading = GetEntityHeading(playerPed)
      local intoAnyCar = IsPedInAnyVehicle(playerPed, true)

      local distance = getDistance(playerCoord, Assistant)
      if distance > 5.0 then
        TaskGoStraightToCoord(Assistant, playerCoord.x+0.5, playerCoord.y+0.5, playerCoord.z, 1.0, -1, playerHeading-180, 0.1)
      end

      if intoAnyCar then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
     
        TaskEnterVehicle(Assistant, vehicle, 10*1000, 0, 1.0, 1, 0)
        Wait(5*1000)
        local assistantIntoCar = IsPedInAnyVehicle(Assistant, true)
        if assistantIntoCar then
          local outAnyCar = true
          while outAnyCar do
            Wait(1)
            outAnyCar = IsPedInAnyVehicle(playerPed, true)
          end
        end
        TaskLeaveVehicle(Assistant, vehicle, 0)
      end

    end
  end)
  
  
  local client = {}
  Tunnel.bindInterface('client', client)
  
  function client.hello(a)
    print('Hello')
  end
  
  function client.animation()
    for scene, tab in pairs(animation) do
      for _, anim in pairs(tab) do
        RequestAnimDict(scene)
        while not HasAnimDictLoaded(scene) do
          Wait(1)
        end
        print(scene, anim)
        TaskPlayAnim(Assistant, scene, anim, 8.0, 8.0, 30*1000, 1, 1.0, 0, 0, 0)
        TriggerEvent("progress",30*1000, scene .. ' ' .. anim)
        Wait(30*1000)
      end
    end
  end
  
  function client.execute(args)
    local command = table.unpack(args)
    client[command]()
  end
end)
  
  
  
  -- IsPedMale(ped)