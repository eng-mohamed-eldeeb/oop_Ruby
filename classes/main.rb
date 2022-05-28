require_relative 'app'

def create_person_menu
  loop do
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp.to_i
    return option.to_i if option >= 1 && option < 3
  end
end

def create_person(app)
  person_type = create_person_menu
  if person_type == 2
    age, name, specialization = teacher_info
    app.add_teacher(age, name, specialization)
  else
    age, name, permission = student_info
    app.add_student(age, name, permission)
  end
  puts '> Person created successfully'
end

def main_menu
  loop do
    print "\n\n"
    puts 'Please choose an option by entering a number:'
    puts '1.- List all books'
    puts '2.- List all people'
    puts '3.- Create a person'
    puts '4.- Create a book'
    puts '5.- Create a rental'
    puts '6.- List all rentals for a given person id'
    puts '7.- Exit'
    option = gets.chomp.to_i
    return option if option >= 1 && option < 8
  end
end

def teacher_info
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  [age, name, specialization]
end

def student_info
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  permission = gets.chomp
  [age, name, permission.downcase == 'y']
end

def create_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.add_book(title, author)
  puts '> Book created successfully'
end

def valid_date(date)
  y, m, d = date.split '/'
  return true if (y.to_i > 2000) && (m.to_i > 1 || m.to_i < 12) && (d.to_i > 1 || d.to_i < 31)

  false
end

def create_rental(app)
  return unless app.can_create_rental?

  index_book = app.select_book
  if index_book.negative? || index_book >= app.books.length
    puts '> Invalid selection'
    return
  end
  index_person = app.select_person
  if index_person.negative? || index_person >= app.people.length
    puts 'Invalid selection'
    return
  end
  puts 'Date (yyyy/mm/dd):'
  date = gets.chomp
  if valid_date(date)
    app.create_rental(date, index_person, index_book)
    puts '> Rental created successfully'
    return
  end
  puts '> Invalid date'
end

def run(app)
  loop do
    case main_menu
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      app.list_rentals_by_id
    else
      puts '> Thanks for using this app!'
      return
    end
  end
end

def main
  print "\n\nWelcome to School Library App!\n"
  app = App.new
  run(app)
end

main
