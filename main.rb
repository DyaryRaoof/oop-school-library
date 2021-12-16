require './book.rb'
require './person.rb'
require './rental.rb'
require './student.rb'
require './teacher.rb'


def list_all_books(books)
    books.each_with_index do |b,i|
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

def create_person()
    puts 'Do you want to create a student (1) or a teacher (2)'
    number = gets.chomp

    if number == '1'
        puts 'Name'
        name = gets.chomp
        puts 'Age'
        age = gets.chomp
        puts 'Has parent permission (Y/N)'
        has_permission = gets.chomp
        
        
        if has_permission == 'y' || has_permission == 'Y'
            has_permission = true
        else
            has_permission = false
        end

        s = Student.new( age,nil,name, parent_permission: has_permission)
        puts 'Person created successfully'
        return s;
    elsif number == '2'
        puts 'Name'
        name = gets.chomp
        puts 'Age'
        age = gets.chomp
        puts 'Specialization'
        specialization = gets.chomp

        t = Teacher.new(age, specialization, name, parent_permission: nil)
        puts 'Person created successfully'
        return t
    end
end

def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: ' 
    author = gets.chomp

    b = Book.new(title, author)
    puts 'Book created successfully!'
    return b
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

    r = Rental.new(date, books[b_index.to_i - 1], people[p_index.to_i - 1]);
    puts 'Rental created successfully'
    return r
end

def list_rental_for_person_id(rentals)
    puts 'Id of person : '
    id = gets.chomp
    rs = rentals.select {|rental| rental.person.id == id.to_i }
    puts 'Rentals : '
    rs.each_with_index do |r, i|
        puts "Date : #{r.date} Book: #{r.book.title} By #{r.book.author} "
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
    puts promts; 
    number = gets.chomp
end


def main
    people = []
    books = []
    rentals = []

    puts 'Welcome to OOP Shool Library'
    number = run_prompts;
    while number != '7'
        if number == '3'
            p =  create_person
            people << p
        elsif number == '4'
            b = create_book
            books << b
        elsif number == '1'
            list_all_books(books)
        elsif number == '2'
            list_all_people(people)
        elsif number == '5'
            r = create_rental(people, books)
            rentals << r 
        elsif number == '6'
            list_rental_for_person_id(rentals)
        end
    number = run_prompts;
    end
end

main