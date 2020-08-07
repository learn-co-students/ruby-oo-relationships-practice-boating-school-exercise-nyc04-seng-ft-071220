class Student

    attr_accessor :first_name

    @@all = []

    def initialize(first_name_param)
        @first_name = first_name_param
        @@all << self
    end

    def self.all 
        @@all
    end

    # def boating_tests 
    #     BoatingTest.all.select{ |appointment| appointment.student == self }
    # end

    def add_boating_test(boating_test_name, boating_test_status, instructor) 
        test = BoatingTest.new(boating_test_name, boating_test_status, instructor)
        #great difficulty here, we had trouble connecting the instance of student to each instance of BoatingTest
        #test.student was returning *nil*, and then we finally realized all we had to do was assign student instance there.
        test.student = self
        test 
        # binding.pry
    end

    def all_instructors
        result = BoatingTest.all.select{|test| test.student == self}
        #above selects all instances of BoatingTest that matches instance of student
        instructor_array = result.map { |boating_test| boating_test.instructor.name}
        #mutate and return what we need with map enum, which is all the instructors' name in string format and inside an array.
    end

    def grade_percentage
        student_results = BoatingTest.all.select{|test| test.student == self}
        all_results_for_student = student_results.map { |boating_test| boating_test.boating_test_status}
        # all_results_for_student.size is the total number we are dividing against the nums
        # of "pass" test_status we have in the array.
        # 1. gather all "pass" test_statuses 
        # 3. gather total size of all test statuses
        # 3. divide against all_test_results_forstudents.size
        total_nums_of_grades = all_results_for_student.size
        total_nums_of_passed_grades = all_results_for_student.count { |grade| grade == "passed" }
        grade_percentage = total_nums_of_passed_grades.to_f / total_nums_of_grades.to_f
        grade_percentage = grade_percentage * 100
    end

    def self.find_student(first_name)
        self.all.find { |student| student.first_name == first_name}
        # class method and the instructions said to return a student object and not string.
        # output when calling this as Student.find_student(first_name) passes
    end



end
