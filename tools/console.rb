require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")
sandy= Student.new("Sandy")
 
puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")
 
test1 = BoatingTest.new(spongebob, "drive101", "passed", puff)
test2 = BoatingTest.new(patrick, "drive101", "failed", puff)
test3 = BoatingTest.new(spongebob, "drive101", "pending", krabs)
test4 = BoatingTest.new(spongebob, "drive102", "passed", krabs)
test5 = BoatingTest.new(spongebob, "drive103", "passed", krabs)

puff.pass_student(patrick, "drive101")
spongebob.find_student("Spongebob")
spongebob.grade_percentage

# no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
# power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
# power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line

