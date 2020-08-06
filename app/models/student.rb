require 'pry'

class Student
    attr_accessor :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    # `Student#all_instructors` should return an array of instructors with whom this specific student took a boating test.

    def all_instructors
        student_tests = BoatingTest.all.select {|test| test.student == self}

        student_tests.map {|tests| tests.instructor}
        
    end

end


