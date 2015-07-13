class ClientInfo
    attr_accessor :id, :name, :class_name

    def initialize (id, name, class_name)
        @id = id
        @name = name
        @class_name = class_name
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

    def to_s
        return @name
    end
end

