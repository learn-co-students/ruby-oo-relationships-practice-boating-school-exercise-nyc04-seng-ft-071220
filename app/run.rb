require 'pry'
require 'require_all'

require_all 'models'

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = patrick.add_boating_test("blah", "pending", puff) 
power_steering= patrick.add_boating_test("derp", "pending", puff)

pp puff.fail_student(patrick, "derp")

