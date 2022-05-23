require_relative 'person'

class Student < Person
    def initialize(classroom, age, name = 'unkown', parent_permission: true)
        @classroom = classroom
    end
    def play_hooky
        '¯\(ツ)/¯'
    end
end