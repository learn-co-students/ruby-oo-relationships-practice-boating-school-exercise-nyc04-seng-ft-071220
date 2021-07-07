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
        instructor_tests = BoatingTest.all.select {|tests| tests.instructor == self}

        passed_tests = instructor_tests.select {|tests| tests.test_status == "passed"}

        passed_students = passed_tests.collect {|students| students.student.first_name}
    end

    def all_students
        instructor_tests = BoatingTest.all.select {|tests| tests.instructor == self}

        students = instructor_tests.collect {|tests| tests.student.first_name}

        students.uniq
    end

    def find_student(student)
        Student.all.find{|student_instance| student_instance == student}
    end

    def find_test(test_name_str)
        BoatingTest.all.find{|test| test.test_name == test_name_str}
    end

    def pass_student(student, test_name_str)
        if find_student(student) && find_test(test_name_str)
            BoatingTest.all.select do |test|
            if test.test_name == test_name_str
                test.test_status = "passed"
                test
            end
            end
        else
            BoatingTest.new(student, test_name_str, "passed", self) 
        end
    end

    def fail_student(student, test_name_str)
        if find_student(student) && find_test(test_name_str)
            BoatingTest.all.select do |test|
            if test.test_name == test_name_str
                test.test_status = "failed"
                test
            end
            end
        else
            BoatingTest.new(student, test_name_str, "failed", self) 
        end
    end
end
