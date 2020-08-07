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

end



spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")


#  Invoking the method 
 p Student.find_student("Patrick")

 patrick.all_instructors


# binding.pry




