require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'


cl = Person.new(25, 'mo', true)
print cl.of_age?
