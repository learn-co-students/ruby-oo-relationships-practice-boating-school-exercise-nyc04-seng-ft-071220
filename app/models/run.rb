require 'pry'
require 'require_all'

require_all 'app/models'

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

binding.pry
0