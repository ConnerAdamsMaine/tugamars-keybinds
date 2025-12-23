fx_version 'cerulean'
game 'gta5'

name 'Tugamars Keybinds'
version '1.0.0'
description 'Tugamars Commands & Keybinds'
author 'tugamars'

shared_scripts {
    '@ox_lib/init.lua',
    'main/config.lua',
}

client_scripts {
    'main/client.lua',
}

ui_page 'nui/index.html'

files {
    'nui/**/*',
    'nui/**/*.html',
    'nui/**/*.png',
    'nui/**/*.jpg',
    'nui/**/*.css',
    'nui/**/*.js',
    'locales/**/*.json',
}

lua54 'yes'
