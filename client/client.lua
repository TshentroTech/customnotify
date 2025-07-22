function notify(text, texttype, time)
    if Config.EsxNotifcation then
        if texttype == true then
            texttype = 'success'
        elseif texttype == false or texttype == 0 then
            texttype = 'error'
        else
            if type(texttype) ~= "string" then
                texttype = "info"
            end
        end
    end


    if type(text) == "table" then
        local ttext = text.text or 'Placeholder'
        local caption = text.caption or 'Placeholder'
        texttype = texttype or Config.DeaultNotify
        time = time or 5000
        SendNUIMessage({
            action = 'notify',
            type = texttype,
            time = time,
            text = ttext,
            details = Config.Notifications[texttype],
            caption = caption,
        })
    else
        texttype = texttype or Config.DeaultNotify
        time = time or 5000
        SendNUIMessage({
            action = 'notify',
            type = texttype,
            time = time,
            text = text,
            details = Config.Notifications[texttype]
        })
    end
end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('Test', function(source, args, rawCommand)
    local NotifySt = args[1]
    if NotifySt == 'success' then
        QBCore.Functions.Notify('Hey Abdel How are you? ', 'success', 9000)
    elseif NotifySt == 'warning' then
        QBCore.Functions.Notify('Hey Abdel How are you?', 'warning', 9000)
    elseif NotifySt == 'info' then
        QBCore.Functions.Notify('Hey Abdel How are you?', 'primary', 9000)
    elseif NotifySt == 'error' then
        QBCore.Functions.Notify('Hey Abdel How are you?', 'error', 9000)
    end
end)

if Config.Debug then
    RegisterCommand('notify', function(source, args, raw)
        local notify = args[1];
        if notify ~= nil then
            SendNUIMessage({
                action = 'testNotify',
                type = notify,
                time = 5000,
                text = 'This is an test notification for: ' .. notify,
                details = Config.Notifications[notify]
            })
        end
    end, false)
end

RegisterNUICallback('nui-ready', function()
    SendNUIMessage({
        action = 'setGlobalMute',
        globalMute = Config.GlobalMute
    })
end)

exports('notify', notify)
