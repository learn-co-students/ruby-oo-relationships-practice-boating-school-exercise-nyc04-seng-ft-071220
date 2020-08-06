class Student
    attr_accessor :first_name, :student, :instructor

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def Student.all
        @@all
    end

    def add_boating_test(student, boating_test_name, boating_test_status, instructor)
    end
end
