require 'pry'
require_relative "instructor.rb"
require_relative "student.rb"

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

Kevin = BoatingTest.new("Kevin", "Eat_fruits", "Open", "Monkey")
