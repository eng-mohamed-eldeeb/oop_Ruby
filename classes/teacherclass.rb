require_relative 'person'
#teacher subclass
class Teacher < Person
  def initialize(specialization, _id, _age, _name = 'unkown', parent_permission: true)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
