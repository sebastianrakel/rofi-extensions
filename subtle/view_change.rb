#!/usr/bin/ruby

require 'open3'
require './lib/subtle/ClientInfo.rb'
require './lib/subtle/ViewInfo.rb'
require './lib/rofi.rb'


def main_menu()
    clients = ClientInfo.GetClients()
    puts dmenu(clients , 'hello world')
end

main_menu()

