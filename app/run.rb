require 'pry'
# require 'require_all'

# require_all 'models'

require_relative 'models/boatingtest.rb'
require_relative 'models/instructor.rb'
require_relative 'models/student.rb'


spongebob = Student.new("Spongebob")

# patrick.find_student("Patrick")       


puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)

krabs.pass_student("patrick", "power_steering_pass")
binding.pry
0 
