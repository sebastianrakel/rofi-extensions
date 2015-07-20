class TagInfo
    attr_accessor :name

    def initialize (name)
        @name = name
    end

    def self.GetTags()
        command = 'subtler -tl'
        output,e,s = Open3.capture3(command)

        tags = Hash.new 

        output.each_line do | line |
            line.chomp
            lineArray = line.split

            tags[lineArray[0]] = TagInfo.new(lineArray[0])
        end

        return tags
    end

    def to_s
        return @name
    end
end


