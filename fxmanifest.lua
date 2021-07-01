fx_version 'cerulean'

game 'gta5'

author 'Koala'
description 'AI personal secretary'
version '1.0.0'

client_scripts {
  '@vrp/lib/utils.lua',
  'client/client.lua',
  'client/Assistant.lua',
  'client/Player.lua'
}

server_scripts {
  '@vrp/lib/utils.lua',
  'server/server.lua'
}

files {
  'config.lua',
  'animations.lua'
}