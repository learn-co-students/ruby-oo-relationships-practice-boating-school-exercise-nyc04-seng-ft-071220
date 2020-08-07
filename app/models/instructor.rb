require 'pry'
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


    def passed_students 
        students_that_passed = BoatingTest.all.select do |test|
            test.boating_test_status == "passed" && test.instructor == self
        end
        students_that_passed.map(&:student)
    end 


    def pass_student(student, test_name)
        student_found = BoatingTest.all.find do |test_info|
            test_info.boating_test_name == test_name && test_info.student.first_name == student
        end 
        if student_found
            student_found.boating_test_status = "passed"
            else 
            BoatingTest.new(student, test_name, "passed", self)
        end 
    end 

   
    def fail_student(student, test_name)
        student_found = BoatingTest.all.find do |test_info|
             test_info.student == student && test_info.boating_test_name == test_name
        end 
            if student_found
                student_found.boating_test_status = "failed"
                else 
                BoatingTest.new(student, test_name, boating_test_status="failed", self)
            end 
    end     
    

    def all_students
        # binding.pry
        student_array = BoatingTest.all.select do |test_info|
            test_info.instructor == self 
        end 
        student_array.map(&:student)
    end 
    
end
