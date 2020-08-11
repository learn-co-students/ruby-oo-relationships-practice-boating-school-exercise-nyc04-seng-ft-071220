require 'require_all'
require 'pry'

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
end

class BoatingTest
    #my attribute accessors
    attr_accessor :student, :test_name, :test_status, :instructor
    #my class variable to store all student instances
    @@all = []
    def initialize(student, test_name, test_status, instructor)
        @student = student
        @test_name = test_name
        @test_status = test_status
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end
end

class Instructor
    @@all = []
    #my attribute accessor
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_students
        BoatingTest.all.select do |boating_test|
            boating_test.instructor == self
        end
    end

    def passed_students
        self.all_students.select do |student|
            student.test_status == "passed"
        end
    end

    def pass_student(student_instance, test_name)
        pending_student = self.all_students.find do |student|
            
            student.student.name == student_instance.name && student.test_name
        end
        
        if pending_student
            pending_student.test_status = "passed"
        else
            pending_student = BoatingTest.new(student_instance, test_name, "passed", self)
        end

        pending_student
        #binding.pry
    end

    def fail_student(student_instance, test_name)
        pending_student = self.all_students.find do |student|
            
            student.student.name == student_instance.name && student.test_name
        end
        
        if pending_student
            pending_student.test_status = "failed"
        else
            pending_student = BoatingTest.new(student_instance, test_name, "failed", self)
        end

        pending_student
        #binding.pry
    end
end




















spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")
wavey = Student.new("Waverly")
squidward = Student.new("Squidward")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")



no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
also_passed = wavey.add_boating_test("Mario Kart Drifting", "passed", krabs)
passed_squared = squidward.add_boating_test("Clarinet and Driving", "passed", krabs)

binding.pry