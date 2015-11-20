#!/usr/bin/ruby

require_relative '../lib/rofi.rb'
require 'open3'
require 'yaml'

def play(url, username, quality)
    command = "livestreamer --player mpv  #{url}/#{username}"
    
    if !quality.nil?
        command += quality 
    end

    exec(command)
end

def get_yaml()
    YAML.load_file(File.join(ENV['HOME'],".streams.yaml"))
end

def get_streaming_platforms()
    return_list = Hash.new

    get_yaml().each_pair {|key,value| return_list[key] = key}

    return_list
end

def main_menu()
    menu_items = get_streaming_platforms()

    menu_items['exit'] = 'Exit'

    value = dmenu(menu_items, 'Choose Action')

    if value != "exit"
        streaming_menu(value)
    end
end

def streaming_menu(platform)
    menu_items = Hash.new

    config = get_yaml()[platform]
    config["channels"].each {|channel| menu_items[channel] = channel }

    menu_items['exit'] = 'Exit'
    value = dmenu(menu_items, 'Choose Action')

    quality = nil

    if config["qualities"].count == 1
        quality = config["qualities"][0]
    end

    if value != "exit"
        play(config["url"], value, quality)
    end
end

main_menu()


