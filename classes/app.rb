require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('1-A')
  end

  def select_book
    puts 'Select a book'
    @books.each_with_index do |book, index|
      puts "> #{index + 1}) Title: #{book.title} Author: #{book.author} "
    end
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person'
    @people.each_with_index do |person, index|
      print "> #{index + 1}) #{person.is_a?(Teacher) ? '[Teacher]' : '[Student]'} "
      puts "> Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def can_create_rental?
    if @books.empty?
      puts '> No items to show, add a book.'
      return false
    end
    if @people.empty?
      puts '> No names on the list'
      return false
    end
    true
  end

  def create_rental(date, index_person, index_book)
    @rentals.push(Rental.new(date, @people[index_person], @books[index_book]))
  end

  def list_rentals_by_id
    if @rentals.empty?
      puts '> No Rentals to show'
      return
    end
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == id.to_i
        print("Date: #{rental.date} ")
        puts("Book \"#{rental.book.title}\" by #{rental.book.author} ")
      end
    end
  end

  def add_book(title, author)
    @books.push(Book.new(title, author))
  end

  def list_all_books
    if @books.empty?
      puts '> There are no books to show'
      return
    end
    @books.each { |book| puts "> Title: #{book.title} by Author: #{book.author}" }
  end

  def list_all_people
    if @people.empty?
      puts 'No entries. Add one.'
      return
    end
    @people.each do |person|
      print '[Teacher] ' if person.is_a?(Teacher)
      print '[Student] ' if person.is_a?(Student)
      puts "> Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def add_teacher(age, name, specialization)
    @people.push(Teacher.new(age, specialization, name))
  end

  def add_student(age, name, permission)
    @people.push(Student.new(age, @classroom, name, parent_permission: permission))
  end
end
