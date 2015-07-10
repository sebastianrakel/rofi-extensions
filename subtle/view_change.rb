#!/usr/bin/ruby

require 'open3'

DMENU_OPTS = %w(-dmenu -columns 1)
SEPERATOR = '-' * 40

def dmenu(items, prompt=nil)
    puts 'start'
#    args = ['rofi']
    args = Array.new

    puts prompt

    if prompt
        args.push('-p')
        args.push("'#{prompt}'")
    end

    args += DMENU_OPTS

    puts args.join(' ')


    input = ""
    items.each do |key, value|
        input += value + "\n"
    end

    command = 'rofi ' + args.join('  ')
    puts command
    o, e, s = Open3.capture3(command, :stdin_data => input)

    puts o
    return o
end

def main_menu()
    dmenu({ "1" => "hallo", "2" => "welt"}, 'hello world')

end

main_menu()

