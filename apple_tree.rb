class AppleTree
    attr_accessor :age
    attr_reader :height, :apple_count
    def initialize
        @height=10
        @apple_count=0
    end
    def year_gone_by
        @age+=1
        @height*=1.1
        if @age>3 && @age <11
            @apple_count+=2
        end
    end
    def pick_apples
        @apple_count=0
    end
end