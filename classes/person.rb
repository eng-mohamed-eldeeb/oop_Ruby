require_relative 'nameable'
# suberclass
class Person < Nameable
  def initialize(id, age, name = 'unkown', parent_permission: true)
    @nameable = Nameable.new
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || parent_permission
  end
end

p = Person.new(1,45,'asd')
print p.correct_name