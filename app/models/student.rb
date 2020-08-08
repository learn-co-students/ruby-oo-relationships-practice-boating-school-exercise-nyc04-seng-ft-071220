class Student

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_test
        BoatingTest.all.select do |test| 
            test.student == self
        end
    end

    def all_instructors
        self.all_test.map(&:instructor)
    end

    def find_student(first_name)
        @@all.find do |student|
            student.name == first_name
        end
    end

    def grade_percentage
        num = self.all_test.count do |test|
            test.status == "passed"
        end
        total = self.all_test.count 
        num.to_f / total
    end

end
