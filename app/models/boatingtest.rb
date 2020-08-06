# require 'bundler/setup'
# Bundler.require
# require_all 'app'
# require_relative '../config/environment.rb'
 require 'pry'
# require 'require_all'
# require_all 'models'

# `BoatingTest` class:

# * should initialize with Student (Object), a boating test name (String), 
# a boating test status (String), and an Instructor (Object)

# * `BoatingTest.all` returns an array of all boating tests

# **NOTE**: Test status has three options only ("passed", "failed" and "pending")

class BoatingTest

    @@all = []
    attr_accessor :student, :boating_test_name, :boating_test_status, :instructor


    def initialize(student, boating_test_name, boating_test_status, instructor)
        @student = student
        @boating_test_name = boating_test_name
        @boating_test_status = boating_test_status
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end

end

# test1 = BoatingTest.new("Bob", "SAT", "passed", "Sylwia")

# binding.pry
# 0
# puts "hi"