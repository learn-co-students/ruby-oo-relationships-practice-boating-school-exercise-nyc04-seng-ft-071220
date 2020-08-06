require 'pry'
require_relative "boatingtest.rb" 
require_relative "instructor"

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
        # binding.pry
<<<<<<< HEAD
        BoatingTest.new(self, boat, boat_test_status,instructor)
=======
        BoatingTest.new(self, "boat", "boat_test_status",Instructor.new("Swilvia"))
>>>>>>> c51cb692a0b58b33fe4a985e6503f21fdef04c58
        # binding.pry
        # 0
    end

    def all_instructors
        BoatingTest.all.select{|instructor|
             instructor.student == self.first_name
            #  binding.pry
        }
    end
end


Jason = Student.new("Jason")
Jason.add_boating_test
puts Jason.all_instructors