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

    @@all = []
    attr_accessor :name, :instructor, :boatingtest

    def initialize(name_arg)
        @name = name_arg
        @@all << self
    end

    def self.all
        @@all
    end

end
