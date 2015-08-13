#!/usr/bin/ruby

require_relative '../lib/rofi.rb'
require 'open3'

def restart()
    exec("systemctl restart")
end

def suspend()
    exec("systemctl suspend")
end

def poweroff()
    exec("systemctl poweroff")
end

def lock()
    exec("xscreensaver-command --lock")
end

def main_menu()
    menu_items = Hash.new

    menu_items['lock'] = 'Lock System'
    menu_items['restart'] = 'Restart System'
    menu_items['suspend'] = 'Suspend System'
    menu_items['poweroff'] = 'Shutdown System'
    menu_items['exit'] = 'Exit'

    value = dmenu(menu_items, 'Choose Action')

    case value
        when 'restart' then restart()
        when 'suspend' then suspend()
        when 'poweroff' then poweroff()
        when 'lock' then lock()
    end
end

main_menu()


