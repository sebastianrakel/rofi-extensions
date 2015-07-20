class ClientInfo
    attr_accessor :id, :name, :class_name

    def initialize (id, name, class_name)
        @id = id
        @name = name
        @class_name = class_name
    end

    def move_to_tag(new_tag)
        tags = get_tags()

        tags.each do | key,value |
            untag(value)
        end

        tag(new_tag)
    end

    def untag(tag)
        command = "subtler -c #{@id} -U #{tag.name}"
        output,e,s = Open3.capture3(command)
    end
    
    def tag(tag)
        command = "subtler -c #{@id} -T #{tag.name}"
        output,e,s = Open3.capture3(command)
    end

    def to_s
        return @name
    end

    def get_tags()
        command = "subtler -c #{@id} -G"
        output,e,s = Open3.capture3(command)

        tags = Hash.new 

        output.each_line do | line |
            line.chomp
            lineArray = line.split

            tags[lineArray[0]] = TagInfo.new(lineArray[0])
        end

        return tags
    end

    def self.GetClients()
        command = 'subtler -cl'
        output,e,s = Open3.capture3(command)

        clients = Hash.new 

        output.each_line do | line |
            line.chomp
            lineArray = line.split

            clients[lineArray[0]] = ClientInfo.new(lineArray[0], lineArray[13], lineArray[12])
        end

        return clients
    end
end

