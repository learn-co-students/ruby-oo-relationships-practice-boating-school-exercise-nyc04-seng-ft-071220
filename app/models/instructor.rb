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

    # Instructor#pass_student` should take in a student instance and test name.
    # If there is a `BoatingTest` whose name and student match the values passed in,
    # this method should update the status of that BoatingTest to 'passed'.
    # If there is no matching test, this method should create a test with the student,
    # that boat test name, and the status 'passed'. Either way, 
    # it should return the `BoatingTest` instance.

    def pass_student(student, test_name)
        student_found = BoatingTest.all.find do |test_info|
            test_info.boating_test_name == test_name && test_info.student.first_name == student
        end 
        if student_found
            student_found.boating_test_status = "passed"
            else 
            BoatingTest.new(student, test_name, "passed", self)
            # we were passing BoatingTest.new(student, boating_test_name, "passed", self) 
            # => but boating_test_name is the parameter for the argument, in here the one we are passing 
            # is in line 32, and we called it test_name, so it has to be test_name when invoking BoatingTest.new
        end 
    end 

    # `Instructor#fail_student` should take in a student instance and test name. 
    # Like `#pass_student`, it should try to find a matching `BoatingTest` 
    # and update its status to 'failed'. If it cannot find an existing `BoatingTest`,
    #  it should create one with the name, the matching student, and the status 'failed'.
   
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
    

    # Instructor#all_students` should return an array of students who
    #  took a boating test with this specific instructor.
    def all_students
        # binding.pry
        student_array = BoatingTest.all.select do |test_info|
            test_info.instructor == self 
        end 
        student_array.map(&:student)
    end 
    
end
