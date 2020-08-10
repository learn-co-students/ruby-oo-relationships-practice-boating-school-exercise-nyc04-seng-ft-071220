# require_relative '../config/environment.rb'
require 'pry'
# require 'require_all'
# require_all 'models'

# `Student` class:

# * should initialize with `first_name`

# * `Student.all` should return all of the student instances

# * `Student#add_boating_test` should initialize a new boating test with a Student (Object), 
# a boating test name (String), a boating test status (String), and an Instructor (Object). 

# * `Student#all_instructors` should return an array of instructors with whom this specific student took a boating test.

# * `Student.find_student` will take in a first name and output the student (Object) with that name

# * `Student#grade_percentage` should return the percentage of tests that the student has passed, 
#a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float `33.33`)

class Student

    attr_accessor :first_name, :last_name
    
    @@all= []
    
    def initialize(first_name)
    @first_name = first_name
    @@all << self
    end
    
    def self.all
      @@all
    end
    
    def add_boating_test(name, status, instructor)
      BoatingTest.new(self, name, status, instructor)
    end
    
    def self.find_student(student_first_name)
      self.all.find{|student| student.first_name == student_first_name}
    end
      
    def grade_percentage
      studentTests= BoatingTest.all.find_all{|test| test.student.first_name == self.first_name}
      totalTests= studentTests.length.to_f
      totalPassed= studentTests.find_all{|test| test.status == "passed"}
      numPassed= totalPassed.length.to_f
      percent= (numPassed/totalTests)*100
    end
    
end
