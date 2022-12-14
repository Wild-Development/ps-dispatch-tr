Config = {}

Config.Enable = {}
Config.Timer = {}

Config.PoliceJob = { "police", "bcso"}

-- Enable if you only want to send alerts to onDuty officers
Config.OnDutyOnly = false

Config.PoliceAndAmbulance = { "police", "ambulance", "bcso"}
Config.PhoneModel = 'prop_npc_phone_02'

-- sets report chance to 100%
Config.DebugChance = true

-- Explosion Alert Types (Gas Pumps by default)
-- Ex.  Config.ExplosionTypes = {1, 2, 3, 4, 5}
Config.ExplosionTypes = {9}

-- enable default alerts
Config.Enable.Speeding = true
Config.Enable.Shooting = true
Config.Enable.Autotheft = true
Config.Enable.Melee = true
Config.Enable.PlayerDowned = true
---------------------------------------------------------------
Config.Locale = 'en'

-- enable alerts when cops break the law and print to console
Config.Debug = true

-- changes the min and max offset for the radius
Config.MinOffset = 1
Config.MaxOffset = 120
---------------------------------------------------------------

Citizen.CreateThread(function()
    -- if not GetPlayerPed(-1) then return end
    -- while not firstname do
    --     Citizen.Wait(10)
    -- end

    -- if notLoaded then
        for k, v in pairs(Config.Enable) do
            print(k, v, json.encode(v))
            if Config.Enable[k] ~= false then
                Config[k] = {}
                Config.Timer[k] = 0 -- Default to 0 seconds
                Config[k].Success = 300 -- Default to 30 seconds
                Config[k].Fail = 20 -- Default to 2 seconds
            end
        end
        -- If you want to set specific timers, do it here
        if Config.Shooting then
            Config.Shooting.Success = 100 -- 10 seconds
            Config.Shooting.Fail = 0 -- 0 seconds
        end
            
        -- notLoaded = nil
    -- end

    Config.WeaponBlacklist = {
        'WEAPON_GRENADE',
        'WEAPON_BZGAS',
        'WEAPON_MOLOTOV',
        'WEAPON_STICKYBOMB',
        'WEAPON_PROXMINE',
        'WEAPON_SNOWBALL',
        'WEAPON_PIPEBOMB',
        'WEAPON_BALL',
        'WEAPON_SMOKEGRENADE',
        'WEAPON_FLARE',
        'WEAPON_PETROLCAN',
        'WEAPON_FIREEXTINGUISHER',
        'WEAPON_HAZARDCAN',
        'WEAPON_RAYCARBINE',
        'WEAPON_STUNGUN'
    }

    Config.Colours = {
        ['0'] = "Metalik Siyah",
        ['1'] = "Metalik Grafit Siyah",
        ['2'] = "Metalik Siyah ??elik",
        ['3'] = "Metalik Koyu G??m????",
        ['4'] = "Metalik G??m????",
        ['5'] = "Metalik Mavi G??m????",
        ['6'] = "Metalik ??elik Gri",
        ['7'] = "Metalik G??lge G??m????",
        ['8'] = "Metalik Ta?? G??m????",
        ['9'] = "Metalik Gece G??m??????",
        ['10'] = "Metalik Silah Metali",
        ['11'] = "Metalik Antrasit Gri",
        ['12'] = "Mat siyah",
        ['13'] = "Mat Gri",
        ['14'] = "Mat A????k Gri",
        ['15'] = "Faydal?? Siyah",
        ['16'] = "Kullan??m Siyah Poli",
        ['17'] = "Kullan????l?? Koyu g??m????",
        ['18'] = "Faydal?? G??m????",
        ['19'] = "Kullan????l?? Silah Metali",
        ['20'] = "Kullan????l?? G??lge G??m????",
        ['21'] = "A????nm???? Siyah",
        ['22'] = "A????nm???? Grafit",
        ['23'] = "A????nm???? G??m???? Gri",
        ['24'] = "A????nm???? G??m????",
        ['25'] = "A????nm???? Mavi G??m????",
        ['26'] = "A????nm???? G??lge G??m????",
        ['27'] = "metalik K??rm??z??",
        ['28'] = "Metalik Torino K??rm??z??s??",
        ['29'] = "Metalik Formula K??rm??z??s??",
        ['30'] = "Metalik Alev K??rm??z??s??",
        ['31'] = "Metalik Zarif K??rm??z??",
        ['32'] = "Metalik Lal K??rm??z??s??",
        ['33'] = "Metalik ????l K??rm??z??s??",
        ['34'] = "Metalik Cabernet K??rm??z??s??",
        ['35'] = "Metalik ??eker K??rm??z??s??",
        ['36'] = "Metalik G??ndo??umu Turuncusu",
        ['37'] = "Metalik Klasik Alt??n",
        ['38'] = "Metalik Turuncu",
        ['39'] = "Mat K??rm??z??",
        ['40'] = "Mat Koyu K??rm??z??",
        ['41'] = "Mat Turuncu",
        ['42'] = "Mat Sar??",
        ['43'] = "Kullan????l?? K??rm??z??",
        ['44'] = "Kullan??m Parlak K??rm??z??",
        ['45'] = "Kullan Garnet K??rm??z??s??",
        ['46'] = "A????nm???? K??rm??z??",
        ['47'] = "A????nm???? Alt??n K??rm??z??",
        ['48'] = "A????nm???? Koyu K??rm??z??",
        ['49'] = "Metalik Koyu Ye??il",
        ['50'] = "Metalik Yar???? Ye??ili",
        ['51'] = "Metalik Deniz Ye??ili",
        ['52'] = "Metalik Zeytin Ye??ili",
        ['53'] = "Metalik Ye??il",
        ['54'] = "Metalik Benzinli Mavi Ye??il",
        ['55'] = "Mat Kire?? Ye??ili",
        ['56'] = "Kullan????l?? Koyu Ye??il",
        ['57'] = "Kullan????l?? Ye??il",
        ['58'] = "A????nm???? Koyu Ye??il",
        ['59'] = "Y??pranm???? Ye??il",
        ['60'] = "A????nm???? Deniz Y??kama",
        ['61'] = "Metalik Gece Mavisi",
        ['62'] = "Metalik Koyu Mavi",
        ['63'] = "Metalik Sakson Mavisi",
        ['64'] = "Metalik Mavi",
        ['65'] = "Metalik Denizci Mavisi",
        ['66'] = "Metalik Liman Mavisi",
        ['67'] = "Metalik Elmas Mavisi",
        ['68'] = "Metalik S??rf Mavisi",
        ['69'] = "Metalik Deniz Mavisi",
        ['70'] = "Metalik Parlak Mavi",
        ['71'] = "Metalik Mor Mavi",
        ['72'] = "Metalik Balon Mavi",
        ['73'] = "Metalik Ultra Mavi",
        ['74'] = "Metalik Parlak Mavi",
        ['75'] = "Kullan????l?? Lacivert",
        ['76'] = "Kullan????l?? Gece Mavisi",
        ['77'] = "Kullan????l?? Mavi",
        ['78'] = "Kullan????l?? Deniz K??p?????? Mavi",
        ['79'] = "Uil ??im??ek mavisi",
        ['80'] = "Kullan????l?? Mavi",
        ['81'] = "Kullan??m Parlak Mavi",
        ['82'] = "Mat Lacivert",
        ['83'] = "Mat Mavi",
        ['84'] = "Mat Gece Mavisi",
        ['85'] = "A????nm???? Mavi",
        ['86'] = "A????nm???? Mavi",
        ['87'] = "A????nm???? A????k mavi",
        ['88'] = "Metalik Taksi Sar??",
        ['89'] = "Metalik Yar???? Sar??s??",
        ['90'] = "Metalik Bronz",
        ['91'] = "Metalik Sar?? Ku??",
        ['92'] = "Metalik Lime",
        ['93'] = "Metalik ??ampanya",
        ['94'] = "Metalik Pueblo Bej",
        ['95'] = "Metalik Koyu Fildi??i",
        ['96'] = "Metalik Choco Kahve",
        ['97'] = "Metalik Alt??n Kahverengi",
        ['98'] = "Metalik A????k Kahve",
        ['99'] = "Metalik Has??r Bej",
        ['100'] = "Metalik Yosun Kahvesi",
        ['101'] = "Metalik Biston Kahve",
        ['102'] = "Metalik Kay??n A??ac??",
        ['103'] = "Metalik Koyu Kay??n A??ac??",
        ['104'] = "Metalik Choco Turuncu",
        ['105'] = "Metalik Sahil Kumu",
        ['106'] = "Metalik G??ne?? A??art??lm???? Kum",
        ['107'] = "Metalik Krem",
        ['108'] = "Kullan????l?? Kahverengi",
        ['109'] = "Kullan????l?? Orta Kahverengi",
        ['110'] = "Kullan????l?? A????k Kahve",
        ['111'] = "Metalik Beyaz",
        ['112'] = "Metalik Buz Beyaz??",
        ['113'] = "Eskimi?? Bal Beji",
        ['114'] = "Y??pranm???? Kahverengi",
        ['115'] = "A????nm???? Koyu Kahverengi",
        ['116'] = "Az Kullan??lm???? Saman Beji",
        ['117'] = "F??r??alanm???? ??elik",
        ['118'] = "F??r??alanm???? Siyah ??elik",
        ['119'] = "F??r??alanm???? Al??minyum",
        ['120'] = "Krom",
        ['121'] = "K??r??k Beyaz",
        ['122'] = "Kirli Beyaz Kullan??n",
        ['123'] = "A????nm???? Turuncu",
        ['124'] = "A????nm???? A????k Turuncu",
        ['125'] = "Metalik Securicor Ye??il",
        ['126'] = "Eskimi?? Taksi Sar??",
        ['127'] = "Polis Arabas?? Mavisi",
        ['128'] = "Mat Ye??il",
        ['129'] = "Mat Kahverengi",
        ['130'] = "A????nm???? Turuncu",
        ['131'] = "Mat Beyaz",
        ['132'] = "A????nm???? Beyaz",
        ['133'] = "Zeytin Kuvvet Ye??ili",
        ['134'] = "Saf Beyaz",
        ['135'] = "S??cak pembe",
        ['136'] = "Somon Pembesi",
        ['137'] = "Metalik Vermilyon Pembesi",
        ['138'] = "Turuncu",
        ['139'] = "Ye??il",
        ['140'] = "Mavi",
        ['141'] = "Metalik Siyah Mavi",
        ['142'] = "Metalik Siyah Mor",
        ['143'] = "Metalik Siyah K??rm??z??",
        ['144'] = "Avc?? ye??ili",
        ['145'] = "Metalik Mor",
        ['146'] = "Metalik Koyu Mavi",
        ['147'] = "Siyah",
        ['148'] = "Mat Mor",
        ['149'] = "Mat Koyu Mor",
        ['150'] = "Metalik Lav K??rm??z??s??",
        ['151'] = "Mat Orman Ye??ili",
        ['152'] = "Mat Zeytin",
        ['153'] = "Mat ????l Kahvesi",
        ['154'] = "Mat ????l Tan",
        ['155'] = "Mat Folyo Ye??ili",
        ['156'] = "Varsay??lan Ala????m Rengi",
        ['157'] = "Epsilon Mavisi",
        ['158'] = "Saf alt??n",
        ['159'] = "F??r??alanm???? Alt??n",
        ['160'] = "MP100"
    }

end)
