require_relative 'basedecorator'
class TrimmerDecorator < BaseDecorator
    def initialize(person)
        @person = person
    end
    def correct_name
        @person.correct_name.slice(0..9)
    end
end
