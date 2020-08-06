class Instructor
    attr_accessor :name, :boatingtest, :student

    @@all = []

    def initialize(name) 
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

end
