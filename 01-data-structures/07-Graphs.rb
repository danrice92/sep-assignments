class Actor
  attr_accessor :name
  attr_accessor :filmography
  attr_accessor :checked

  def initialize(name)
    @name = name
    @filmography = Array.new
    @checked = false
  end

  # should add the actor's name to a film array
  def add_to_film(film)
    film.cast.push(self)
    @filmography.push(film)
  end

  # should return a list of actors that were in the film with this particular actor, but not include this actor's name
  def film_actor_hash(film)
    if film.cast.include?(self)
      film.cast.each do |i|
        unless i == self
          puts i.name
        end
      end
    else
      puts "That actor was not in that film. Try again."
    end
  end

  def find_kevin_bacon(films=[], currentActor=self)
    if currentActor == Kevin_Bacon
      return 0
    else
      currentActor.filmography.each do |film|
        unless films.include?(film.name)
          films.push(film.name)
        end
        if film.cast.include?(Kevin_Bacon)
          puts films
        else
          currentActor.checked = true
          film.cast.each do |actor|
            if actor.checked == false
              actor.find_kevin_bacon(films, currentActor=actor)
            end
          end
        end
      end
    end
  end

end

class Film
  attr_accessor :name
  attr_accessor :cast

  def initialize(name)
    @name = name
    @cast = Array.new
  end
end

Kevin_Bacon = Actor.new("Kevin Bacon")
Lori_Singer = Actor.new("Lori Singer")
John_Lithgow = Actor.new("John Lithgow")
Dianne_Wiest = Actor.new("Dianne Wiest")
Chris_Penn = Actor.new("Chris Penn")
Sarah_Jessica_Parker = Actor.new("Sarah Jessica Parker")
Daniel_Radcliffe = Actor.new("Daniel Radcliffe")
Emma_Watson = Actor.new("Emma Watson")
John_Cleese = Actor.new("John Cleese")
Mike_Myers = Actor.new("Mike Myers")
Eddie_Murphy = Actor.new("Eddie Murphy")
Brendan_Gleeson = Actor.new("Brendan Gleeson")

Footloose = Film.new("Footloose")
Kevin_Bacon.add_to_film(Footloose)
Lori_Singer.add_to_film(Footloose)
John_Lithgow.add_to_film(Footloose)
Dianne_Wiest.add_to_film(Footloose)
Chris_Penn.add_to_film(Footloose)
Sarah_Jessica_Parker.add_to_film(Footloose)

Shrek = Film.new("Shrek")
Mike_Myers.add_to_film(Shrek)
Eddie_Murphy.add_to_film(Shrek)
John_Lithgow.add_to_film(Shrek)

Shrek2 = Film.new("Shrek 2")
Mike_Myers.add_to_film(Shrek2)
Eddie_Murphy.add_to_film(Shrek2)

#The Big Picture array
The_Big_Picture = Film.new("The Big Picture")

Kevin_Bacon.add_to_film(The_Big_Picture)
John_Cleese.add_to_film(The_Big_Picture)

#Harry Potter and the Sorcerer's Stone array
Harry_Potter_and_the_Sorcerers_Stone = Film.new("Harry Potter and the Sorcerer's Stone")

Daniel_Radcliffe.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)
Emma_Watson.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)
John_Cleese.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)

Harry_Potter_and_the_Goblet_of_Fire = Film.new("Harry Potter and the Goblet of Fire")

Daniel_Radcliffe.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)
Emma_Watson.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)
Brendan_Gleeson.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)

Brendan_Gleeson.find_kevin_bacon
