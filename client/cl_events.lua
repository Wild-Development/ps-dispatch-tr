local WeaponTable = {
    -- Custom weapons
    [GetHashKey("weapon_ak47")] = "Sınıf 3: AK-47",
    [GetHashKey("weapon_de")] = "Sınıf 2: Desert Eagle",
    [GetHashKey("weapon_fnx45")] = "Sınıf 1: FN .45",
    [GetHashKey("weapon_glock17")] = "Sınıf 1: Glock 17",
    [GetHashKey("weapon_m4")] = "Sınıf 3: M4",
    [GetHashKey("weapon_hk416")] = "Sınıf 3: HK-416",
    [GetHashKey("weapon_mk14")] = "Sınıf 4: MK 14",
    [GetHashKey("weapon_mk14")] = "Sınıf 4: M110",
    [GetHashKey("weapon_huntingrifle")] = "Sınıf 3: Av Silahı",
    [GetHashKey("weapon_ar15")] = "Sınıf 3: AR-15",
    [GetHashKey("weapon_m9")] = "Sınıf 1: M9",
    [GetHashKey("weapon_m70")] = "Sınıf 3: m70",
    [GetHashKey("weapon_m1911")] = "Sınıf 1: 1911",
    [GetHashKey("weapon_mac10")] = "Sınıf 2: Mac-10",
    [GetHashKey("weapon_uzi")] = "Sınıf 2: Uzi",
    [GetHashKey("weapon_mp9")] = "Sınıf 2: MP9",
    [GetHashKey("weapon_mossberg")] = "Sınıf 2: Mossberg",
    [GetHashKey("weapon_remington")] = "Sınıf 2: Remington",
    [GetHashKey("weapon_scarh")] = "Sınıf 3: Scar-H",
    [584646201]   = "Sınıf 2: AP-Pistol",
    [453432689]   = "Sınıf 1: Tabanca",
    [3219281620]  = "Sınıf 1: Pistol MK2",
    [1593441988]  = "Sınıf 1: Combat Pistol",
    [-1716589765] = "Sınıf 1: Heavy Pistol",
    [-1076751822] = "Sınıf 1: SNS-Pistol",
    [-771403250]  = "Sınıf 2: Desert Eagle",
    [137902532]   = "Sınıf 2: Vintage Pistol",
    [-598887786]  = "Sınıf 2: Marksman Pistol",
    [-1045183535] = "Sınıf 2: Revolver",
    [911657153]   = "Taser",
    [324215364]   = "Sınıf 2: Micro-SMG",
    [-619010992]  = "Sınıf 2: Machine-Pistol",
    [736523883]   = "Sınıf 2: SMG",
    [2024373456]  = "Sınıf 2: SMG MK2",
    [-270015777]  = "Sınıf 2: Assault SMG",
    [171789620]   = "Sınıf 2: Combat PDW",
    [-1660422300] = "Sınıf 4: Combat MG",
    [3686625920]  = "Sınıf 4: Combat MG MK2",
    [1627465347]  = "Sınıf 4: Gusenberg",
    [-1121678507] = "Sınıf 2: Mini SMG",
    [-1074790547] = "Sınıf 3: Assaultrifle",
    [961495388]   = "Sınıf 3: Assaultrifle MK2",
    [-2084633992] = "Sınıf 3: Carbinerifle",
    [4208062921]  = "Sınıf 3: Carbinerifle MK2",
    [-1357824103] = "Sınıf 3: Advancedrifle",
    [-1063057011] = "Sınıf 3: Specialcarbine",
    [2132975508]  = "Sınıf 3: Bulluprifle",
    [1649403952]  = "Sınıf 3: Compactrifle",
    [100416529]   = "Sınıf 4: Sniperrifle",
    [205991906]   = "Sınıf 4: Heavy Sniper",
    [177293209]   = "Sınıf 4: Heavy Sniper MK2",
    [-952879014]  = "Sınıf 4: Marksmanrifle",
    [487013001]   = "Sınıf 2: Pumpshotgun",
    [2017895192]  = "Sınıf 2: Sawnoff Shotgun",
    [-1654528753] = "Sınıf 3: Bullupshotgun",
    [-494615257]  = "Sınıf 3: Assaultshotgun",
    [-1466123874] = "Sınıf 3: Musket",
    [984333226]   = "Sınıf 3: Heavyshotgun",
    [-275439685]  = "Sınıf 2: Doublebarrel Shotgun",
    [317205821]   = "Sınıf 2: Autoshotgun",
    [-1568386805] = "Sınıf 5: GRENADE LAUNCHER",
    [-1312131151] = "Sınıf 5: RPG",
    [125959754]   = "Sınıf 5: Compactlauncher",
    [-1768145561] = "Scar-L"
}
local function VehicleTheft(vehicle)
    local vehdata = vehicleData(vehicle)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local heading = getCardinalDirectionFromHeading()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "vehicletheft", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-35",
        firstStreet = locationInfo,
        model = vehdata.name, -- vehicle name
        plate = vehdata.plate, -- vehicle plate
        priority = 2,
        firstColor = vehdata.colour, -- vehicle color
        heading = heading,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('vehicletheft'),
        job = { "police" }
    })
end

exports('VehicleTheft', VehicleTheft)

local function VehicleShooting(vehdata)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehdata = vehicleData(vehicle)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local heading = getCardinalDirectionFromHeading()
    local gender = GetPedGender()
    local doorCount = 0

    local PlayerPed = PlayerPedId()
    local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
    local weapon = WeaponTable[CurrentWeapon] or "UNKNOWN"
    if GetEntityBoneIndexByName(vehicle, 'door_pside_f') ~= -1 then doorCount = doorCount + 1 end
    if GetEntityBoneIndexByName(vehicle, 'door_pside_r') ~= -1 then doorCount = doorCount + 1 end
    if GetEntityBoneIndexByName(vehicle, 'door_dside_f') ~= -1 then doorCount = doorCount + 1 end
    if GetEntityBoneIndexByName(vehicle, 'door_dside_r') ~= -1 then doorCount = doorCount + 1 end
    if doorCount == 2 then doorCount = "İki Kapılı" elseif doorCount == 3 then doorCount = "Üç Kapılı" elseif doorCount == 4 then doorCount = "Dört Kapılı" else doorCount = "BİLİNMİYOR" end
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "vehicleshots", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-60",
        firstStreet = locationInfo,
        model = vehdata.name,
        plate = vehdata.plate,
        gender = gender,
        weapon = weapon,
        doorCount = doorCount,
        priority = 2,
        firstColor = vehdata.colour,
        heading = heading,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('vehicleshots'),
        job = { "police" }
    })
end

exports('VehicleShooting', VehicleShooting)

RegisterCommand("silahne", function()
    local PlayerPed = PlayerPedId()
    local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
    local weapon = WeaponTable[CurrentWeapon] or "UNKNOWN"
print(weapon)
print(CurrentWeapon)
end)


local function Shooting()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    local PlayerPed = PlayerPedId()
    local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
    local speed = math.floor(GetEntitySpeed(vehicle) * 2.236936) .. " MPH" -- * 3.6 = KMH    /    * 2.236936 = MPH
    local weapon = WeaponTable[CurrentWeapon] or "UNKNOWN"

    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "shooting", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-11",
        firstStreet = locationInfo,
        gender = gender,
        weapon = weapon,
        model = nil,
        plate = nil,
        priority = 2,
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('shooting'),
        job = { "police" }
    })

end

exports('Shooting', Shooting)

local function SpeedingVehicle(vehdata)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local heading = getCardinalDirectionFromHeading()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "speeding", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-11",
        firstStreet = locationInfo,
        model = vehdata.name,
        plate = vehdata.plate,
        priority = 2,
        firstColor = vehdata.colour,
        heading = heading,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('speeding'),
        job = { "police" }
    })
end

exports('SpeedingVehicle', SpeedingVehicle)

local function Fight()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "fight", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-10",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2,
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('melee'),
        job = { "police" }
    })
end

exports('Fight', Fight)

local function InjuriedPerson()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "civdown", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-69",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('persondown'), -- message
        job = { "ambulance" } -- jobs that will get the alerts
    })
end

exports('InjuriedPerson', InjuriedPerson)

local function DeceasedPerson()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "civdead", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-69",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Civilian Bled Out", -- message
        job = { "ambulance" } -- jobs that will get the alerts
    })
end

exports('DeceasedPerson', DeceasedPerson)

local function StoreRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "storerobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('storerobbery'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('StoreRobbery', StoreRobbery)

local function FleecaBankRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "bankrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('fleecabank'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('FleecaBankRobbery', FleecaBankRobbery)

local function PaletoBankRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "paletobankrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('paletobank'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('PaletoBankRobbery', PaletoBankRobbery)

local function PacificBankRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "pacificbankrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('pacificbank'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('PacificBankRobbery', PacificBankRobbery)

local function PrisonBreak()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "prisonbreak", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('prisonbreak'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('PrisonBreak', PrisonBreak)

local function VangelicoRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "vangelicorobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('vangelico'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('VangelicoRobbery', VangelicoRobbery)

local function HouseRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "houserobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('houserobbery'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('HouseRobbery', HouseRobbery)

local function YachtHeist()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "yachtheist", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-65",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('yachtheist'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('YachtHeist', YachtHeist)

local function DrugSale()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "suspicioushandoff", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-13",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('drugsell'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('DrugSale', DrugSale)


-- for rcore_gangs, haven't tested server side exports so made this instead. Remove if you do not need :)
RegisterNetEvent('ps-dispatch:client:drugsale', function()
    DrugSale()
end)

local function CarJacking(vehicle)
    local vehdata = vehicleData(vehicle)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local heading = getCardinalDirectionFromHeading()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "carjack", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-35",
        firstStreet = locationInfo,
        model = vehdata.name, -- vehicle name
        plate = vehdata.plate, -- vehicle plate
        priority = 2,
        firstColor = vehdata.colour, -- vehicle color
        heading = heading,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('carjacking'),
        job = { "police" }
    })
end

exports('CarJacking', CarJacking)

local function OfficerDown()
    local plyData = QBCore.Functions.GetPlayerData()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local callsign = QBCore.Functions.GetPlayerData().metadata["callsign"]
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "officerdown", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-99",
        firstStreet = locationInfo,
        name = "COP - " .. plyData.charinfo.firstname:sub(1, 1):upper() .. plyData.charinfo.firstname:sub(2) .. " " .. plyData.charinfo.lastname:sub(1, 1):upper() .. plyData.charinfo.lastname:sub(2),
        model = nil,
        plate = nil,
        callsign = callsign,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('officerdown'), -- message
        job = { "ambulance", "police" } -- jobs that will get the alerts
    })
end

exports('OfficerDown', OfficerDown)

RegisterNetEvent("ps-dispatch:client:officerdown", function ()
    OfficerDown()
end)

local function EmsDown()
    local plyData = QBCore.Functions.GetPlayerData()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local callsign = QBCore.Functions.GetPlayerData().metadata["callsign"]
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "emsdown", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-99",
        firstStreet = locationInfo,
        name = "EMS - " .. plyData.charinfo.firstname:sub(1, 1):upper() .. plyData.charinfo.firstname:sub(2) .. " " .. plyData.charinfo.lastname:sub(1, 1):upper() .. plyData.charinfo.lastname:sub(2),
        model = nil,
        plate = nil,
        callsign = callsign,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('emsdown'), -- message
        job = { "ambulance", "police" } -- jobs that will get the alerts
    })
end

exports('EmsDown', EmsDown)

RegisterNetEvent("ps-dispatch:client:emsdown", function ()
    EmsDown()
end)

local function Explosion()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "explosion", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-80",
        firstStreet = locationInfo,
        gender = nil,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Explosion Reported", -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('Explosion', Explosion)

local function SuspiciousActivity()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "susactivity", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-66",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('susactivity'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('SuspiciousActivity', SuspiciousActivity)

local function CustomAlert(data)

    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local gender = GetPedGender()
    if not data.gender then gender = nil end 
    local job = { "police" }
    if data.job then job = data.job end


    local locationInfo = getStreetandZone(coords)
    TriggerServerEvent("dispatch:server:notify", {
        dispatchCode = data.dispatchCode or "NONE", 
        firstStreet = locationInfo,
        gender = gender,
        model = data.model or nil,
        plate = data.plate or nil,
        priority = data.priority or 2, -- priority
        firstColor = data.firstColor or nil,
        camId = data.camId or nil,
        callsign = data.callsign or nil,
        name = data.name or nil,
        doorCount = data.doorCount or nil,
        heading = data.heading or nil,
        automaticGunfire = data.automaticGunfire or false,
        origin = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        dispatchMessage = data.message or "", 
        job = job,
        alert = {
            displayCode = data.dispatchCode or "NONE", 
            description = data.description or "", 
            radius = data.radius or 0, 
            recipientList = job, 
            blipSprite = data.sprite or 1, 
            blipColour = data.color or 1, 
            blipScale = data.scale or 0.5, 
            blipLength = data.length or 2, 
            sound = data.sound or "Lose_1st", 
            sound2 = data.sound2 or "GTAO_FM_Events_Soundset", 
            offset = data.offset or "false", 
            blipflash = data.flash or "false"
        }
    })
end
exports('CustomAlert', CustomAlert)
