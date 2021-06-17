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

class Flog
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

class Pond
  def initialize(number_animals, animal_class, number_plants, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "動物#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "植物#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each {|plant| plant.grow }
    @animals.each {|animal| animal.speak }
    @animals.each {|animal| animal.eat }
    @animals.each {|animal| animal.sleep }
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new(name)
    elsif type == :plant
      @plant_class.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

pond = Pond.new(3, Duck, 2, WaterLily)
pond.simulate_one_day

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

class Habitat < Pond
end

jungle = Habitat.new(1, Tiger, 4, Tree)
jungle.simulate_one_day