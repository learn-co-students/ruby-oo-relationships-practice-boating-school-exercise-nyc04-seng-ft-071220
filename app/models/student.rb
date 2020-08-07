require 'pry'
class Student
    attr_accessor :first_name, :boatingtest, :instructor

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end


    def self.all
        @@all
    end


    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end


    def all_instructors
    #     # binding.pry
        student_arr = BoatingTest.all.select do |test_info|
            test_info.student == self
        end
        student_arr.map do |student_info|
            student_info.instructor
        end 
    end 
        
   
    def self.find_student(first_name)
        # binding.pry
        Student.all.find do |student|
            student.first_name == student.first_name 
        end  
    end
    
    # `Student#grade_percentage` should return the percentage of tests that 
    # the student has passed, a Float (so if a student has passed 3 / 9 tests
    #  that they've taken, this method should return the Float `33.33`)
    
    def grade_percentage
        # binding.pry
        student_arry_test = BoatingTest.all.find_all do |test_info|
            test_info.student = self
        end 
        # binding.pry
        testTotal = student_arry_test.count

        testPassed = student_arry_test.find_all do |test|
            test.boating_test_status == 'passed'
        end 

        num_of_passed = testPassed.count.to_f

        gradePercentage = (num_of_passed/testTotal)*100
        # binding.pry
    end 

end






#  Invoking methods
# Student.find_student("Patrick")
#  patrick.all_instructors

# binding.pry




