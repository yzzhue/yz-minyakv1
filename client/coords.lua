CreateThread(function ()
    local ped = PlayerPedId()
    local pedCoods = GetEntityCoords(ped)

    local x = string.format('%.2f', pedCoods.x)
    local y = string.format('%.2f', pedCoods.y)
    local z = string.format('%.2f', pedCoods.z)

    local rapih = string.format('%s, %s, %s', x,y,z)

    print(rapih)

end)