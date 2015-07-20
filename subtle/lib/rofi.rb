DMENU_OPTS = %w(-dmenu -columns 1)
SEPERATOR = '-' * 40

def dmenu(items, prompt=nil)
    args = Array.new
    hash = Hash.new

    puts items
    if prompt
        args.push('-p')
        args.push("'#{prompt} -> '")
    end

    args += DMENU_OPTS

    input = ""

    index = 1

    items.each do |key, value|
        p value
        line = "#{index}. #{value.to_s}\n"
        input += line 

        hash[line] = key

        index = index + 1
    end

    command = 'rofi ' + args.join('  ')

    o, e, s = Open3.capture3(command, :stdin_data => input)
   
    return hash[o.squeeze]
end

