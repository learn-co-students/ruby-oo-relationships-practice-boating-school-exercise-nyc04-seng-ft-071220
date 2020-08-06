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
        BoatingTest.new(self, "boat", "boat_test_status","instructor")
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