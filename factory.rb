class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts("アヒル #{@name} は食事中")
  end

  def speak
    puts("アヒル #{@name} はガーガー鳴く")
  end

  def sleep
    puts("アヒル #{@name} は寝ています")
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts("カエル #{@name} は食事中")
  end

  def speak
    puts("カエル #{@name} はゲロゲロ鳴く")
  end

  def sleep
    puts("カエル #{@name} は寝ないで鳴いています")
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts("藻 #{@name} は日光を浴びて育ちます")
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts("睡蓮 #{@name} は浮きながら日光を浴びて育ちます")
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts("樹木 #{@name} が高く育っています")
  end
end

class Tiger
  def initialize(name)
    @name = name
  end

  def eat
    puts("トラ #{@name} は食事中")
  end

  def speak
    puts("トラ #{@name} はがおーと吠える")
  end

  def sleep
    puts("トラ #{@name} は寝ています")
  end
end

class PondOrganismFactory
  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end

  def new_plant(name)
    Tree.new(name)
  end
end

class Habitat
  def initialize(number_animals, number_plants, organism_factory)
    @organism_factory = organism_factory

    @animals = []
    number_animals.times do |i|
      animal = organism_factory.new_animal("動物#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = organism_factory.new_plant("植物#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each {|plant| plant.grow }
    @animals.each {|animal| animal.speak }
    @animals.each {|animal| animal.eat }
    @animals.each {|animal| animal.sleep }
  end
end

jungle = Habitat.new(1, 4, JungleOrganismFactory.new)
jungle.simulate_one_day

pond = Habitat.new(2, 4, PondOrganismFactory.new)
pond.simulate_one_day