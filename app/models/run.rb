require "pry"

class BoatingTest

    attr_accessor :student, :boat_test_name, :boat_test_status, :instructor
    
    @@all = []

    def initialize(student, boat_test_name,boat_test_status,instructor)
            @student=student
            @boat_test_name=boat_test_name
            @boat_test_status=boat_test_status
            @instructor=instructor
            @@all << self
    end

    def self.all
        @@all
    end
    
end

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

    def passed_students
        BoatingTest.all.select{|boating_test| boating_test.boat_test_status == "passed" && boating_test.instructor == self}
    end

    def pass_student(stundent_instance,test_name)
        BoatingTest.all.find{|boating_test| boating_test.student == stundent_instance && boating_test.boat_test_name== test_name}
    end
    
end

class Student
    
    attr_accessor :first_name
    
    @@all = []

    def initialize(first_name)
        @first_name=first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test
        BoatingTest.new(self, "boat", "boat_test_status",Instructor.new("Swilvia"))
    end

    def all_instructors
        BoatingTest.all.select{|instructor|instructor.student == self.first_name}
    end
end


Jason = Student.new("Jason")
Jason.add_boating_test
puts Jason.all_instructors

eric = Instructor.new("Eric")
eric.passed_students

Kevin = BoatingTest.new("Kevin", "Eat_fruits", "Open", "Monkey")

