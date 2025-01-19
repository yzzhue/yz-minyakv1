fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "yz_minyak"
description "by HNH DEV"
author "Ying Zheng PEMULA"
version "yz"

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
