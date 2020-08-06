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

    def all_instructors
        Instructor.all.select { |instructor| instructor.student == self}
    end

    def self.find_student(first_name)
        self.all.find { |student| student.first_name == first_name}
    end

    def grade_percentage

    end

end


spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

# binding.pry