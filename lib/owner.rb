class Owner
  attr_accessor 
  attr_reader :name, :species
  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all_owners.length
  end

  def self.all
    @@all_owners
  end

  def self.reset_all
    @@all_owners.clear
  end

  def cats
    Cat.all.select{|i| i.owner == self}
  end

  def dogs
    Dog.all.select{|i| i.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each{|i| i.mood = "happy"}
  end

  def feed_cats
    cats.each{|i| i.mood = "happy"}
  end

  def sell_pets
    dogs.each{|i| i.mood = "nervous"}
    dogs.each{|i| i.owner = nil}
    cats.each{|i| i.mood = "nervous"}
    cats.each{|i| i.owner = nil}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end