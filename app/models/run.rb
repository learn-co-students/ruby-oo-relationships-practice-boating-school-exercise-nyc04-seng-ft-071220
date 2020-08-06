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
        BoatingTest.all.each{|boating_test| 
        if boating_test.student == stundent_instance && boating_test.boat_test_name== test_name
            boating_test.boat_test_status = "passed"
        else
            BoatingTest.new(stundent_instance,test_name,boat_test_status="passed",self)
            # binding.pry
            # 0
        end
        }
    end

    def fail_student(stundent_instance,test_name)
        BoatingTest.all.each{|boating_test| 
        if boating_test.student == stundent_instance && boating_test.boat_test_name== test_name
            boating_test.boat_test_status = "failed"
        else
            BoatingTest.new(stundent_instance,test_name,boat_test_status="failed",self)
            # binding.pry
            # 0
        end
        }
    end

    def all_students
        BoatingTest.all.select{|boating_test|
            boating_test.instructor == self
            # binding.pry
            # 0
        }
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

    def add_boating_test(test_name,status,instructor)
        BoatingTest.new(self, test_name,status, instructor)
    end

    def all_instructors
        BoatingTest.all.select{|boating_test|boating_test.student == self
        }
    end

    def self.find_student(firstname)
        self.all.find{|student|
            student.first_name == firstname
            # binding.pry
            # 0
        }
    end

    def grade_percentage
        BoatingTest.all.boat_test_status
    end
end


Jason = Student.new("Jason")
# Jason.add_boating_test
# puts Jason.all_instructors

# eric = Instructor.new("Eric")
# eric.passed_students
# eric.pass_student(Jason, "boat_test_1")

# Kevin = BoatingTest.new("Kevin", "Eat_fruits", "Open", "Monkey")

# eric.all_students

pp Student.find_student("Jason")

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

spongebob.all_instructors

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

# no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
# power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
# power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)