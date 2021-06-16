class Duck
  def initalize(name)
    @name = name
  end

  def eat
    puts("アヒル #{name} は食事中")
  end

  def speak
    puts("アヒル #{name} はガーガー鳴く")
  end

  def sleep
    puts("アヒル #{name} は寝ています")
  end
end

class Flog
  def initalize(name)
    @name = name
  end

  def eat
    puts("カエル #{name} は食事中")
  end

  def speak
    puts("カエル #{name} はゲロゲロ鳴く")
  end

  def sleep
    puts("カエル #{name} は寝ないで鳴いています")
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts("藻 #{name} は日光を浴びて育ちます")
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts("睡蓮 #{name} は浮きながら日光を浴びて育ちます")
  end
end

class Pond
  def initialize(number_animals, number_plants)
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
end

class DuckWaterLilyPond < Pond
  def new_organism(type, name)
    if type == :animal
      Duck.new(name)
    elsif type == :plant
      WaterLily.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

class FrogAlgaePond < Pond
  def new_organism(type, name)
    if type == :animal
      Frog.new(name)
    elsif type == :plant
      Algae.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end