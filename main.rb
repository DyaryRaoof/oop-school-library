require './book'
require './person'
require './rental'
require './student'
require './teacher'

def list_all_books(books)
  books.each_with_index do |b, i|
    puts "#{i + 1}- Title : #{b.title} , Author : #{b.author}"
  end
end

def list_all_people(people)
  people.each_with_index do |p, i|
    if p.is_a?(Student)
      puts "#{i + 1}- [Student] Name : #{p.name} , Age : #{p.age}, Id: #{p.id} "
    else
      puts "#{i + 1}- [Teacher] Name : #{p.name} , Age : #{p.age}, Id: #{p.id}"
    end
  end
end

def name_age
  puts 'Name'
  name = gets.chomp
  puts 'Age'
  age = gets.chomp
  [name, age]
end

def create_person()
  puts 'Do you want to create a student (1) or a teacher (2)'
  case gets.chomp
  when '1'
    name, age = name_age
    puts 'Has parent permission (Y/N)'
    has_permission = gets.chomp
    responses = %w[y Y]
    has_permission = responses.include?(has_permission)
    p = Student.new(age, nil, name, parent_permission: has_permission)
    puts 'Person created successfully'
    p
  when '2'
    name, age = name_age
    puts 'Specialization'
    specialization = gets.chomp

    t = Teacher.new(age, specialization, name, parent_permission: nil)
    puts 'Person created successfully'
    t
  end
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp

  b = Book.new(title, author)
  puts 'Book created successfully!'
  b
end

def create_rental(people, books)
  puts 'Select a person from the following'
  list_all_people(people)
  p_index = gets.chomp
  puts 'Select a book from the following'
  list_all_books(books)
  b_index = gets.chomp

  puts 'Date : '
  date = gets.chomp

  r = Rental.new(date, books[b_index.to_i - 1], people[p_index.to_i - 1])
  puts 'Rental created successfully'
  r
end

def list_rental_for_person_id(rentals)
  puts 'Id of person : '
  id = gets.chomp
  rs = rentals.select { |rental| rental.person.id == id.to_i }
  puts 'Rentals : '
  rs.each_with_index do |r, i|
    puts "#{i}- Date : #{r.date} Book: #{r.book.title} By #{r.book.author} "
  end
end

def run_prompts
  promts = [
    'Please choose an option by entering a number',
    '1- List all books',
    '2- List all people',
    '3- Create a person',
    '4- Create a book',
    '5- Create a rental',
    '6- List all persons for a given person id',
    '7- Exit'
  ]
  puts ''
  puts promts
  gets.chomp
end

def check_one_tow_six(number, people, books, rentals)
  case number
  when '1'
    list_all_books(books)
  when '2'
    list_all_people(people)
  when '6'
    list_rental_for_person_id(rentals)
  end
end

def check_number(number)
  people = []
  books = []
  rentals = []

  while number != '7'
    case number
    when '3'
      p = create_person
      people << p
    when '4'
      b = create_book
      books << b
    when '5'
      r = create_rental(people, books)
      rentals << r
    else
      check_one_tow_six(number, people, books, rentals)
    end
    number = run_prompts
  end
end

def main
  puts 'Welcome to OOP Shool Library'
  number = run_prompts
  check_number(number)
end

main
