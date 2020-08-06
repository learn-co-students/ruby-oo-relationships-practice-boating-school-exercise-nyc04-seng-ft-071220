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
        pending_student = self.all_students.find do |student|
            
            student.student.name == student_instance.name && student.test_name
        end
        
        if pending_student
            pending_student.test_status = "passed"
        else
            pending_student = BoatingTest.new(student_instance, test_name, "passed", self)
        end

        pending_student
        #binding.pry
    end

    def fail_student(student_instance, test_name)
        pending_student = self.all_students.find do |student|
            
            student.student.name == student_instance.name && student.test_name
        end
        
        if pending_student
            pending_student.test_status = "failed"
        else
            pending_student = BoatingTest.new(student_instance, test_name, "failed", self)
        end

        pending_student
        #binding.pry
    end
end