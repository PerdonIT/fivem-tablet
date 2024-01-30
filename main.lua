ESX = nil
guiEnabled = false

if Config.ESX.enable then
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getShachterhoekjexxaredObjachterhoekjexxect', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
        PlayerData = ESX.GetPlayerData()
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        PlayerData = ESX.GetPlayerData()
    end)

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = ESX.GetPlayerData()
    end)
end

Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
        end
        Citizen.Wait(0) --MH LUA
    end
end)

RegisterNUICallback('NUIFocusOff', function()
    Gui(false)
end)

RegisterNetEvent('perdonit:meos:setvisible')
AddEventHandler('perdonit:meos:setvisible', function(visibility)
    Gui(visibility)
end)

if Config.Command then
    RegisterCommand("meos", function(source, args, rawCommand)
        if not Config.ESX.enable or PlayerData.job.name == Config.ESX.job then
            if guiEnabled then
                Gui(false)
            else
                Gui(true)
            end
        else
            ESX.ShowNotification("Je hebt geen permissie dit commando te gebruiken.")
        end
    end, false)
end

function Gui(toggle)
    SetNuiFocus(toggle, toggle)
    guiEnabled = toggle
    if guiEnabled then
        startAnim()
    else
        stopAnim()
    end
    SendNUIMessage({
        type = "enableui",
        enable = toggle
    })
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    Gui(false)
end)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
        while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
            Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end

function attachObject()
    tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    DeleteEntity(tab)
end




--RegisterNetEvent("output")
--AddEventHandler("output", function(argument)
--  TriggerEvent("chatMessage", "[Success]", {0,255,0}, argument)
--end)
