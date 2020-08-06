class Instructor
    @@all = []
    #my attribute accessor
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_students
        BoatingTest.all.select do |boating_test|
            boating_test.instructor == self
        end
    end

    def passed_students
        self.all_students.select do |student|
            student.test_status == "passed"
        end
    end

    def pass_student(student_instance, test_name)
        self.passed_students.find do |student|
            student.name == student_instance.name && student.test_name
        end
    end
end