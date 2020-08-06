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
        test.student = self
        test 
        # binding.pry
    end

    def all_instructors
        result = BoatingTest.all.select{|test| test.student == self}
        binding.pry

        ### stuck here
    end

end
