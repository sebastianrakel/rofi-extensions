#!/usr/bin/ruby

require 'open3'
require 'subtle/subtlext'
require_relative '../lib/rofi.rb'
require 'optparse'

def choose_tag(prompt=nil)
    tags = Subtlext::Tag.list

    tag_infos = Hash.new

    tags.each do | tag |
        tag_infos[tag] = tag.name
    end

    if prompt.nil?
        prompt = 'Select Tag'
    end

    value = dmenu(tag_infos, prompt)
    return value
end

def choose_client(prompt=nil)
    clients = Subtlext::Client.list

    client_infos = Hash.new

    clients.each do | client |
        client_infos[client.win] = "#{client.name}"
    end

    if prompt.nil?
        prompt = 'Select Client'
    end

    value = dmenu(client_infos , prompt)

    if(value)
        client = Subtlext::Client[pid: "#{value}"]
        return client
    else
        return nil
    end
end

def change_tag_of_client()
    client = choose_client()

    if client
        tag = choose_tag("Choose new Tag for Client (#{client.name})")

        if tag
            client.tags=([tag])
        end
    end
end

def check_arguments()
    options = {}
    OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.on("-t", "--change-tag", "Jump directly into change Tag") do |t|
            options[:change_tag] = t
        end
    end.parse!

    if options[:change_tag]
        change_tag_of_client()
        return true
    end
    return false
end

def main_menu()
    if check_arguments
        return
    end

    menu_items = Hash.new

    menu_items['change_client_tag'] = 'Change Tag of Client'
    menu_items['exit'] = 'Exit'

    value = dmenu(menu_items, 'Choose Action')

    case value
        when 'change_client_tag' then change_tag_of_client()
    end
end

main_menu()

