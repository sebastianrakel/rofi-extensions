class ViewInfo
    attr_accessor :index, :name, :active

    def initialize (index, name, active)
        @index = index
        @name = name
        @active = active
    end

    def GetTags()
        command = "subtler -v #{index} -G" 

        output,e,s = Open3.capture3(command)

        return output.each_line 
    end

    def to_s
        return @name
    end

    def self.GetViews()
        command = 'subtler -vl'
        output,e,s = Open3.capture3(command)

        views = Hash.new

        output.each_line do | line |
            line.chomp
            lineArray = line.split

            index = lineArray[0]
            active = lineArray[1] == '*'
            name = lineArray[2]

            views[index] = ViewInfo.new(index, name, active)
        end

        return views
    end
end

