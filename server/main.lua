RegisterNetEvent('yzkntl')
AddEventHandler('yzkntl', function()
    local src = source ----- untuk mengambil id pemain
    local xPlayer = ESX.GetPlayerFromId(src)
    local check = xPlayer.canCarryItem(Config.Item, 1)
    if check then
        xPlayer.addInventoryItem(Config.Item, 1)
    end

end)

RegisterNetEvent('yzpr')
AddEventHandler('yzpr', function()
    local src = source ----- untuk mengambil id pemain
    local xPlayer = ESX.GetPlayerFromId(src)
    local check = xPlayer.canCarryItem(Config.Item, 1)
    if check then
        xPlayer.removeInventoryItem(Config.Item, 2)
        xPlayer.addInventoryItem(Config.Hasil, 1)
    end

end)
