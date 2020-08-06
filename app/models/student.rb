require 'pry'
class Student
    attr_accessor :first_name, :student, :instructor, :boatingtest

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_instructors
        binding.pry
        BoatingTest.all.select do |test_info|
            test_info.instructor == self
        end 
    end 


    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def self.find_student 
        # binding.pry
        # Student.all.find do |student|
        
    end 


end



# Student#all_instructors should return an array of instructors with
#  whom this specific student took a boating test.

# Student.find_student will take in a first name and
#  output the student (Object) with that name

