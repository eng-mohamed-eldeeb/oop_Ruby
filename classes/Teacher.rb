require_relative 'person'

class Teacher < Person
    def initialize(specialization, age, name = 'unkown', parent_permission: true)
        @specialization = specialization 
    end
    def can_use_services?
        true
    end
end