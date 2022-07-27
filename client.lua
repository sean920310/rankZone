local rookieZone = PolyZone:Create(
    Config.rookieZoneCoords
, {
    name="rookieZone",
    debugGrid=false,
    gridDivisions=25 
})

rookieZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        -- Point has just entered the zone
        Notify("~g~你已進入新手村 你將不會受到任何傷害~w~")
        godMode(true)
        PlaySoundFrontend(-1, "OTHER_TEXT", "HUD_AWARDS")

    else
        -- Point has just left the zone
        Notify("~r~你已離開新手村 你將會受到傷害~w~")
        godMode(false)
        PlaySoundFrontend(-1, "OTHER_TEXT", "HUD_AWARDS")
    end
end)


--------------------------------------------------------------------

function chat(str, color)
    TriggerEvent('chat:addMessage', {
        color = color,
        multiline = true,
        args = {str}
    })
end

function Notify(text) -- 左下角通知
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function godMode(bool)
    if bool then
        SetEntityInvincible(GetPlayerPed(-1), true)
        SetPlayerInvincible(PlayerId(), true)
        SetPedCanRagdoll(GetPlayerPed(-1), false)
        ClearPedBloodDamage(GetPlayerPed(-1))
        ResetPedVisibleDamage(GetPlayerPed(-1))
        ClearPedLastWeaponDamage(GetPlayerPed(-1))
        SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
        SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
        SetEntityCanBeDamaged(GetPlayerPed(-1), false)
    elseif not godmode then
        SetEntityInvincible(GetPlayerPed(-1), false)
        SetPlayerInvincible(PlayerId(), false)
        SetPedCanRagdoll(GetPlayerPed(-1), true)
        ClearPedLastWeaponDamage(GetPlayerPed(-1))
        SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
        SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
        SetEntityCanBeDamaged(GetPlayerPed(-1), true)
    end
end