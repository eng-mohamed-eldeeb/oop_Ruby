require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(person)
    super()
    @person = person
  end

  def correct_name
    @person.correct_name.upcase
  end
end
