class Instructor

    attr_accessor :name 

    @@all = []

    def initialize(name_param)
        @name = name_param 
        @@all << self
    end

    def self.all 
        @@all
    end

    def passed_students
        # 1. Gather all students who passed any boating tests.
        # 2. Further narrow down with logic to find all results with instructor instance calling the method.
        # 3. Final touch up is to mutate the array to return names in string format only.
        # 4. Bonus was to return a string in case array is empty, that means everybody failed with that instructor.
        students_who_passed_array = BoatingTest.all.find_all { |test| test.boating_test_status == "passed"}
        one_instructor_with_passing_students = students_who_passed_array.find_all { |passing_test| passing_test.instructor.name == self.name }
        final_array_with_passing_students = one_instructor_with_passing_students.map { |test| test.student.first_name}
        final_array_with_passing_students
        # binding.pry
        if final_array_with_passing_students.size == 0
            "strict instructor!!! everybody fails this class"
        end
    end

    def pass_student(student, test_name)
        #narrow down the results with matching instructor instance.
        result_with_instructor = BoatingTest.all.select { |test| test.instructor == self}
        result_with_instructor.each do |test|
            if test.student == student && test.boating_test_name == test_name
                test.boating_test_status = "passed"
            else 
                # If there is no matching test, this method should create a test with the student, 
                # that boat test name, and the status 'passed'. 
                # Either way, it should return the `BoatingTest` instance.
                new_test = BoatingTest.new(test_name, "passed", self)
                new_test.student = student
                return new_test
                # output without explicit return was not what I wanted
                # added explicit return so it breaks out of the loop
                # this way, it satisfies the deliverable of returning a single BoatingTest instance
                # binding.pry
            end
        end
        # binding.pry
    end

    def fail_student(student, test_name)
        #narrow down the results with matching instructor instance.
        result_with_instructor = BoatingTest.all.select { |test| test.instructor == self}
        result_with_instructor.each do |test|
            if test.student == student && test.boating_test_name == test_name
                test.boating_test_status = "failed"
            else 
                # If there is no matching test, this method should create a test with the student, 
                # that boat test name, and the status 'passed'. 
                # Either way, it should return the `BoatingTest` instance.
                new_test = BoatingTest.new(test_name, "failed", self)
                new_test.student = student
                return new_test
                # binding.pry
            end
        end
        # binding.pry
    end

    def all_students
        result = BoatingTest.all.select{|test| test.instructor == self}
        #above selects all instances of BoatingTest that matches instance of instructor
        student_array = result.map { |boating_test| boating_test.student.first_name }
        #mutate and return what we need with map enum, which is all the students' name in string format and inside an array.
    end



end
