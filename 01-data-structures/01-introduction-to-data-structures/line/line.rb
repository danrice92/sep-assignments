class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members << person
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.members.first
  end

  def middle
    middle = (self.members.length / 2).floor
    self.members[middle]
  end

  def back
    self.members.last
  end

  def search(person)
    person if self.members.include?(person)
  end

  private

  def index(person)
  end

end
