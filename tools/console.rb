require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

spongebob = Student.new("Spongebob")
patrick = Student.new("Patrick")
squidward = Student.new("Squidward")
shirley = Student.new("Shirley")

puff = Instructor.new("Ms.Puff")
krabs = Instructor.new("Mr.Krabs")
whale = Instructor.new("Mr.Whale")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
no_crashing2 = spongebob.add_boating_test("Don't Crash 102", "pending", krabs)
no_crashing3 = shirley.add_boating_test("Don't Crash 102", "pending", krabs)
no_crashing4 = patrick.add_boating_test("Don't Crash 101", "passed", krabs)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
power_steering_pass2 = squidward.add_boating_test("Power Steering 201", "passed", krabs)
power_steering_pass3 = squidward.add_boating_test("Power Steering 201", "passed", krabs)
speedy_pass = shirley.add_boating_test("Speed Passing 101", "passed", whale)
speedy_pass2 = squidward.add_boating_test("Speed Passing 101", "failed", whale)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

