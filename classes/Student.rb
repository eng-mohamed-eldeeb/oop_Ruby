require_relative 'person'

class Student < Person
  def initialize(classroom,_id , _age, _name = 'unkown', parent_permission = true)
    super
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
