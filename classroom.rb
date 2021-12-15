class Classroom
  attr_accessor :lable
  attr_reader :students

  def initialize(lable)
    @label = lable
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
