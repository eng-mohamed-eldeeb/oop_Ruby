require_relative 'nameable'

class BaseDecorator < Nameable
  @nameable = Nameable.new

  def correct_name
    @nameable.correct_name
  end
end
