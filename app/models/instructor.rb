class Instructor

    attr_accessor :name 

    @@all = []

    def initialize(name_param)
        @name = name_param 
        @@all << self
    end

    def self.all 
        @@all
    end

end
