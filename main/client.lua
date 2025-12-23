
-- Partially based on this snippet: https://gist.github.com/DemmyDemon/69d53b78b005a7c1a6fdb9036e401f4c
local KEY_CODES <const> = {
    -- b_0 = "",
    -- b_1 = "",
    -- b_2 = "",
    -- b_3 = "",
    b_4 = "D-pad Up", -- LUP_INDEX - D-pad Up
    b_5 = "D-pad Down", -- LDOWN_INDEX - D-pad Down
    b_6 = "D-pad Left", -- LLEFT_INDEX - D-pad Left
    b_7 = "D-pad Right", -- LRIGHT_INDEX - D-pad Right
    -- b_8 = "",
    -- b_9 = "",
    -- b_10 = "",
    -- b_11 = "",
    -- b_12 = "",
    -- b_13 = "",
    -- b_14 = "",
    -- b_15 = "",
    b_16 = "Left Stick Press", -- L3_INDEX - Left Stick Press
    -- b_17 = "",
    b_18 = "Left Stick Up/Down", -- FIXME: Up and down on left stick on controller (but only triggers on down?)
    b_19 = "Left Stick Left/Right", -- FIXME: Left and right on left stick on controller (but only triggers on right?)
    -- b_20 = "",
    -- b_21 = "",
    -- b_22 = "",
    -- b_23 = "",
    -- b_24 = "",
    b_25 = "Right Stick Press", -- R3_INDEX - Right Stick Press
    -- b_26 = "",
    b_27 = "Right Stick Up/Down", -- FIXME: Up and down on right stick on controller (but only triggers on down?)
    b_28 = "Right Stick Left/Right", -- FIXME: Left and right on right stick on controller (but only triggers on right?)
    -- b_29 = "",
    b_30 = "A", -- RDOWN_INDEX - A / Cross
    b_31 = "B", -- RRIGHT_INDEX - B / Circle
    b_32 = "X", -- RLEFT_INDEX - X / Square
    b_33 = "Y", -- RUP_INDEX - 	Y / Triangle
    b_34 = "LB", -- L1_INDEX - Left Shoulder Button
    b_35 = "LT", -- L2_INDEX - Left Trigger
    b_36 = "RB", -- R1_INDEX - Right Shoulder Button
    b_37 = "RT", -- R2_INDEX - Right Trigger
    b_38 = "Start", -- FIXME: "Start" on my xbox controller
    b_39 = "Back", -- FIXME: "Back" on my xbox controller
    -- b_40 = "",
    -- b_41 = "",
    -- b_42 = "",
    -- b_43 = "",
    -- b_44 = "",
    -- b_45 = "",
    -- b_46 = "",
    -- b_47 = "",
    b_100 = "LMB", -- MOUSE_LEFT - Mouse Button 0 (Left Click)
    b_101 = "RMB", -- MOUSE_RIGHT - Mouse Button 1 (Right Click)
    b_102 = "MMB", -- MOUSE_MIDDLE - Mouse Button 2 (Middle Click)
    b_103 = "Mouse 4",
    b_104 = "Mouse 5",
    b_105 = "Mouse 6",
    b_106 = "Mouse 7",
    b_107 = "Mouse 8",
    b_108 = "Mouse Left",
    b_109 = "Mouse Right",
    b_110 = "Mouse Up",
    b_111 = "Mouse Down",
    b_112 = "Mouse Left/Right",
    b_113 = "Mouse Up/Down",
    b_114 = "Mouse",
    b_115 = "Scroll Up",
    b_116 = "Scroll Down",
    b_117 = "Scroll Wheel",
    b_130 = "Num -",
    b_131 = "Num +",
    b_134 = "Num *",
    b_135 = "Num Enter", -- FIXME: This may be wrong
    b_136 = "Num 0",
    b_137 = "Num 1",
    b_138 = "Num 2",
    b_139 = "Num 3",
    b_140 = "Num 4",
    b_141 = "Num 5",
    b_142 = "Num 6",
    b_143 = "Num 7",
    b_144 = "Num 8",
    b_145 = "Num 9",
    b_146 = "Num =",
    b_147 = "Num ,",
    b_148 = "Num ÷", -- FIXME: Do the fonts have ÷ in them?
    b_149 = "Num x",
    b_150 = "Intro",
    b_151 = "???",-- FIXME some sort of upper line?!
    b_170 = "F1",
    b_171 = "F2",
    b_172 = "F3",
    b_173 = "F4",
    b_174 = "F5",
    b_175 = "F6",
    b_176 = "F7",
    b_177 = "F8",
    b_178 = "F9",
    b_179 = "F10",
    b_180 = "F11",
    b_181 = "F12",
    b_182 = "F13",
    b_183 = "F14",
    b_184 = "F15",
    b_185 = "F16",
    b_186 = "F17",
    b_187 = "F18",
    b_188 = "F19",
    b_189 = "F20",
    b_190 = "F21",
    b_191 = "F22",
    b_192 = "F23",
    b_193 = "F24",
    b_194 = "Up Arrow",
    b_195 = "Down Arrow",
    b_196 = "Left Arrow",
    b_197 = "Right Arrow",
    b_198 = "Del",
    b_199 = "Esc",
    b_200 = "Ins",
    b_201 = "End",
    b_202 = "Suppr",
    b_203 = "Échap",
    b_204 = "Fin",
    b_205 = "Entf",
    b_206 = "Einfg",
    b_207 = "Ende",
    b_208 = "Canc",
    b_209 = "Fine",
    b_210 = "Delete",
    b_211 = "Insert",
    b_212 = "End",
    b_213 = "Supr",
    b_214 = "Insertar",
    b_215 = "Fin",
    b_216 = "¨",
    b_217 = "`",
    b_995 = "???", -- Literally says so on the sprite. In red. (Button shown when a key has been removed from the keymapping)
    -- b_996 = "", -- Button outline sprite
    -- b_997 = "", -- Button outline sprite
    b_998 = "+", -- The + in things like Ctrl+A?
    -- b_999 = "", -- Button outline sprite
    b_1000 = "L Shift", -- Left Shift - FIXME Fonts do not have ⇑ in them. What can be used for Shift?
    b_1001 = "R Shift", -- Right Shift - FIXME Same problem as above
    b_1002 = "Tab",
    b_1003 = "Enter", -- FIXME Common key, undrawable glyph. Fonts to not have ↲ in them.
    b_1004 = "Backspace", -- FIXME ← is easily confused with left arrow...
    b_1005 = "Print Screen",
    b_1006 = "Scroll Lock",
    b_1007 = "Pause",
    b_1008 = "Home",
    b_1009 = "Page Up",
    b_1010 = "Page Down",
    b_1011 = "Num Lock",
    b_1012 = "Caps Lock",
    b_1013 = "L Ctrl", -- Left Control
    b_1014 = "R Ctrl", -- Right Control
    b_1015 = "L Alt",
    b_1016 = "R Alt",
    b_1017 = "Menu",
    b_1018 = "L Win",
    b_1019 = "R Win",
    b_1020 = "Imppr écran",
    b_1021 = "Arrèt défil",
    b_1022 = "↖", -- FIXME: Check if the fonts have this symbol.
    b_1023 = "⇞", -- FIXME: Do the fonts even have this symbol? What *is* this?
    b_1024 = "⇟", -- FIXME: Do the fonts even have this symbol? What *is* this?
    b_1025 = "Verr Numm",
    b_1026 = "Verr Maj",
    b_1027 = "Ctrl G",
    b_1028 = "Ctrl D",
    b_1029 = "Druck",
    b_1030 = "Rollen ↓",
    b_1031 = "Pos 1",
    b_1032 = "Bild ↑",
    b_1033 = "Bild ↓",
    b_1034 = "Num ↓",
    b_1035 = "⇓", -- FIXME: Probably an invisible glyph again. WTF even is this?
    b_1036 = "Strg L",
    b_1037 = "Strg R",
    b_1038 = "Maiusc sx",
    b_1039 = "Maiusc dx",
    b_1040 = "Invio",
    b_1041 = "Stampa",
    b_1042 = "Bloc Scorr",
    b_1043 = "Pausa",
    b_1044 = "↖", -- FIXME: Do the fonts even have this symbol? What *is* this?
    b_1045 = "Pag ↑",
    b_1046 = "Pag ↓",
    b_1047 = "Bloc Num",
    b_1048 = "Bloc Maiusc",
    b_1049 = "Ctrl sx",
    b_1050 = "Ctrl dx",
    b_1051 = "Alt gr",
    b_1052 = "Impr Pant",
    b_1053 = "Bloq Despl",
    b_1054 = "Pausa",
    b_1055 = "Home",
    b_1056 = "Page Up",
    b_1057 = "Av Pág",
    b_1058 = "Bloq Num",
    b_1059 = "Bloq Mayús",
    b_1060 = "Ctrl I",
    b_1061 = "Ctrl D",
    b_1062 = "Menú",
    b_1063 = "Impr Pant",
    b_1064 = "Bloq Despl",
    b_1065 = "Pausa",
    b_1066 = "Inicio",
    b_1067 = "Re Pág",
    b_1068 = "Av Pág",
    b_1069 = "Bloq Num",
    b_1070 = "Mayús",
    b_1071 = "Opsciones",
    b_1072 = "Maj G",
    b_1073 = "Maj D",
    b_1074 = "Alt",
    b_1075 = "Alt D",
    b_1076 = "I Shift",
    b_1077 = "D Shift",
    b_2000 = "Space"
}

---Get's the label of a key mapped command
---@param commandHash any
---@return string
local function GetKeyMappingKey(commandHash)
    local key = GetControlInstructionalButton(0, GetHashKey("8e4r9t45t879r7y4587"), true)
    key = GetControlInstructionalButton(0, commandHash | 0x80000000, true)
    if string.find(key, "t_") then
        local label, _count = string.gsub(key, "t_", "")
        return label
    else
        return KEY_CODES[key] or string.format("unknown (%s)", key)
    end
end

local function getKeyMappings(list)

    -- Fisher–Yates shuffle
    local function shuffle(tbl)
        for i = #tbl, 2, -1 do
            local j = math.random(i)
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end

    local results = {}      -- word -> key
    local invalid = {}      -- word -> true if mismatch detected

    for iteration = 1, 20 do
        shuffle(list)

        for _, v in ipairs(list) do
            if not invalid[v] then
                local key = GetKeyMappingKey(GetHashKey(v))

                if results[v] == nil then
                    -- first time we see this word
                    results[v] = key
                elseif results[v] ~= key then
                    -- mismatch across iterations
                    results[v] = nil
                    invalid[v] = true
                end
            end
        end
    end

    -- build final output
    local final = {}
    for word, key in pairs(results) do
        if key ~= nil and not invalid[word] then
            final[word] = key
        end
    end

    return final
end


local function getKeybindsAndCommands()

    local commands=GetRegisteredCommands();
    local finalCommands={};

    local blacklistedResources=Config.BlockedResources;

    local commandsForFunc={};

    local removeMinusAndPlusCommands=Config.removeMinusAndPlusCommands;

    for k,v in ipairs(commands) do
        if(not blacklistedResources[v.resource] and (not removeMinusAndPlusCommands or (not string.find(v.name, "+") and not string.find(v.name, "-") ) ) ) then

            if( string.find(v.name, "+") or string.find(v.name, "-") ) then
                v.type="action";
            end

            table.insert(finalCommands, v);
            table.insert(commandsForFunc,v.name);
        end
    end

    local keymappings=getKeyMappings(commandsForFunc);

    for k,v in ipairs(finalCommands) do
        v.keybind = keymappings[v.name] or nil;
    end

    return finalCommands;
end

RegisterCommand("keybinds", function()

    local d=getKeybindsAndCommands();
    SendNUIMessage({
        action = "tgm:keybinds:show",
        kc=d,
        debug = true
    })
    SetNuiFocus(true,true);

end)

RegisterNuiCallback("closeUi", function(data,cb)
    SetNuiFocus(false,false);
    cb(true)
end)