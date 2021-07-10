require 'pry'

class Instructor

    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def passed_student(student, test_name)
        passing = BoatingTest.all.select { |test| test.student.first_name == student.first_name && test.test_name == test_name}
        if passing
            passing.test_status = "passed"
        else
            BoatingTest.new(stutent, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        failing = BoatingTest.all.select { |test| test.student.first_name == student.first_name && test.test_name == test_name}
        if failing
            failing.test_status = "failed"
        else
            BoatingTest.new(stutent, test_name, "failed", self)
        end
    end

    def all_students
        Student.all.select { |student| student.instructor == self}
    end
end


puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")
# binding.pry