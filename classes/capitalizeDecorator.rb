require_relative 'basedecorator'

class CapitalizeDecorator < BaseDecorator
    def initialize(person)
        @person = person
    end
    def correct_name
        @person.correct_name.upcase
    end
end
