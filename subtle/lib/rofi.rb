DMENU_OPTS = %w(-dmenu -columns 1)
SEPERATOR = '-' * 40

def dmenu(items, prompt=nil)
    puts 'start'
    args = Array.new

    if prompt
        args.push('-p')
        args.push("'#{prompt}'")
    end

    args += DMENU_OPTS

    input = ""
    items.each do |key, value|
        input += value.to_s + "\n"
    end

    command = 'rofi ' + args.join('  ')
    puts command

    o, e, s = Open3.capture3(command, :stdin_data => input)
    
    return o
end

