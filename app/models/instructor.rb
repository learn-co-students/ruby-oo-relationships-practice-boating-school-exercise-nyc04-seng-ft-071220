require 'pry'
require_relative "boatingtest.rb" 
require_relative "student.rb"

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
        binding.pry 
        #BoatingTest.all.select{|boating_test| boating_test.boat_test_status == "passed" && boating_test.instructor == self}
        
    end
    
end

eric = Instructor.new("Eric")
eric.passed_students
