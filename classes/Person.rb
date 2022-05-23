class Person
    def initialize(age, name = 'unkown', parent_permission: true)
        @id = id
        @name = name
        @age = age
    end
    def is_of_age?
        @age >= 18
    end
    def can_use_services?
        is_of_age? || parent_permission
    end
end
