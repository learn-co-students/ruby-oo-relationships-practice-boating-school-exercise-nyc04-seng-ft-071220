class BoatingTest

    attr_accessor :student, :instructor, :classname, :status

    @@all = []

    def initialize(student, classname, status, instructor)
        @student = student
        @classname = classname
        @status = status
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end


end
