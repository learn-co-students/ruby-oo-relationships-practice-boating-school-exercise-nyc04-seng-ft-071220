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
            test_info.boating_test_name == test_name && test_info.student == student
            binding.pry
        end 
        student_found
        student_found.boating_test_status = "passed"
     student_found
        # else 
        #     BoatingTest.new(student, boating_test_name, boating_test_status="passed", self)
        

        
        

    end 

    # * `Instructor#pass_student` should take in a student instance and test name. 
    # If there is a `BoatingTest` whose name and student match the values passed in,
    #  this method should update the status of that BoatingTest to 'passed'. 
    #  If there is no matching test, this method should create a test with the student,
    #   that boat test name, and the status 'passed'. Either way, 
    #   it should return the `BoatingTest` instance.
             

        
        
    

end

# binding.pry
# 0

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

# no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
# power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
# power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)

krabs.pass_student("patrick", "power_steering_pass")