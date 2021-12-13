class Person
  def initialize(name = 'Unknown', parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  private :is_of_age?
end
