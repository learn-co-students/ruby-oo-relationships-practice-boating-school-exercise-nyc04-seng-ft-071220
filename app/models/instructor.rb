class Instructor

    attr_accessor

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_test 
        BoatingTest.all.select do |boatingtest|
            boatingtest.instructor == self
        end
    end

    def passed_students
        self.all_test.select do |student|
            student.status == "passed"
        end
    end


    def pass_student(name, classname)
        matched = self.all_test.select do |student|
            student.student == name && student.classname == classname
        end
        if matched 
            matched.each{|match| match.status = "passed"}
        end
        if matched == []
            BoatingTest.new(name, classname, "passed", self)
        end
    end

    def fail_student(name, classname)
        matched = self.all_test.select do |student|
            student.student == name && student.classname == classname
        end
        if matched 
            matched.each{|match| match.status = "failed"}
        end
        if matched == []
            BoatingTest.new(name, classname, "failed", self)
        end
   end

end
