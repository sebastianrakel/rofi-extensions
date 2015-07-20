#!/usr/bin/ruby

require 'open3'
require 'subtle/subtlext'
require './lib/rofi.rb'

def client_menu(client)
    tags = Subtlext::Tag.list

    tag_infos = Hash.new

    tags.each do | tag |
        tag_infos[tag] = tag.name
    end

    value = dmenu(tag_infos, 'Select new Tag for Client')

    if(value)
        client.tags=([value])
    end
end

def main_menu()
    clients = Subtlext::Client.list

    client_infos = Hash.new

    clients.each do | client |
        client_infos[client.win] = "#{client.name}"
    end

    value = dmenu(client_infos , 'Select Client')

    if(value)
        client = Subtlext::Client[pid: "#{value}"]
        client_menu(client)
    end
end

main_menu()

