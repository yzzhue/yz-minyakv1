
----------------AMBIL MINYAK--------------
CreateThread(function ()
    for k, v in pairs(Config.Ambilminyak) do
        exports.ox_target:addBoxZone({
            coords = vector3(v.x, v.y, v.z),
            size = vector3(2),
            rotation = 1,
            options = {
                {
                     label = 'Ambil Minyak',
                     icon = 'fa fa-screwdriver',
                     event = 'yzminyak'
                }
            }
        })
    end

end)

------------ PROSES MINYAK -----------------

CreateThread(function()
 for k, v in pairs(Config.ProsesMinyak) do
        exports.ox_target:addBoxZone({  ------- PROSES MINYAK 1
        coords = vector3(v.x, v.y, v.z),
        size = vector3(2),
        rotation = 1,
        options = {
            {
                    label = 'Proses Minyak',
                    icon = 'fa fa-tractor',
                    event = 'yzprminyak'
            }
       }

      })
    end

end)

RegisterNetEvent('yzminyak')
AddEventHandler('yzminyak', function()
    local success = lib.skillCheck({'easy'}, {'e'}) 
    if not success then
        lib.notify({ title = 'GAGAL TOLOL', description = 'BEGO', type = 'error'})
        return
    end
    if lib.progressBar({
        duration = 3000,
        label = 'Ambil Minyak King',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player'
        },
    }) then
        lib.notify({ title = 'BERHASIL NGENTOTT', description = 'DAPAT MINYAK', type = 'success'})
        TriggerServerEvent('yzkntl', source)
    end
 
end)


RegisterNetEvent('yzprminyak')
AddEventHandler('yzprminyak', function()
     local checkinv = exports.ox_inventory:Search('count', Config.Item)
        if checkinv < 2 then 
            lib.notify({ title = 'ERROR', description = 'TIDAK MIMILIKI ITEM', type = 'error'})
            return
        end
     local minigame = lib.skillCheck({'easy'}, {'e'})
     if not minigame then 
        lib.notify({ title = 'ERROR', description = 'GAGAL', type = 'error'})
        return
    end

     if lib.progressBar({
        duration = 3000,
        label = 'Proses Minyak King',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player'
        },
    }) then
        lib.notify({ title = 'BERHASIL', description = 'DAPAT MINYAK', type = 'success'})
         TriggerServerEvent('yzpr', source)
    end
end)

local blips = {  ------------ blips
    {title="Pengambilan Minyak", colour=5, id=501, x = 2717.18, y = 1438.57, z = 24.62},
    {title="Proses Minyak", colour=5, id=501, x = 2674.52, y = 1482.88, z = 24.5},
    {title="Proses Minyak", colour=5, id=501, x = 2674.48, y = 1491.98, z = 24.5},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
 
 end) -- blip