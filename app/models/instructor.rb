class Instructor
    attr_accessor :name, :boatingtest

    @@all = []

    def initialize(name) 
        @name = name
        @@all << self
    end

    def Instructor.all
        @@all
    end

end
