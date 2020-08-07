class BoatingTest
    attr_accessor :student, :instructor, :boating_test_name, :boating_test_status

    @@all = []

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


power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
