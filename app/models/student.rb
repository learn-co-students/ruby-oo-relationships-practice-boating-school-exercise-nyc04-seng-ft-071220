

class Student
    #my attribute accessors
    attr_accessor :name
    #my class variable to store all student instances
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors
        BoatingTest.all.select do |boating_test|
            boating_test.student == self
        end
    end

    def self.find_student(name)
        self.all.find do |student|
            student.name == name
        end
    end

end