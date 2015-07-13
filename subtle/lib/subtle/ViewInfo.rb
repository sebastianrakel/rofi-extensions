class ViewInfo
    attr_accessor :name

    def initialize (name)
        @name = name
    end

    def self.GetViews()
        command = 'subtler -vl'
        output,e,s = Open3.capture3(command)

        views = Array.new

        output.each_line do | line |
            line.chomp
            lineArray = line.split

            views.push(ViewInfo.new(lineArray[2]))
        end

        return views
    end
end

