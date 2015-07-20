#!/usr/bin/ruby

require 'open3'
require './lib/subtle/ClientInfo.rb'
require './lib/subtle/ViewInfo.rb'
require './lib/subtle/TagInfo.rb'
require './lib/rofi.rb'

def client_menu(clientInfo)
    tags = TagInfo.GetTags()
    value = dmenu(tags, 'Select new Tag for Client')

    clientInfo.move_to_tag(tags[value])
end

def main_menu()
    clients = ClientInfo.GetClients()
    value = dmenu(clients , 'Select Client')

    client_menu(clients[value])
end

main_menu()

