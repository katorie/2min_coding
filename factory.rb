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

class Pond
  def initalize(number_animals)
    @animals= []
    number_animals.times do |i|
      animal = new_animal("動物#{i}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each {|animal| animal.speak }
    @animals.each {|animal| animal.eat }
    @animals.each {|animal| animal.sleep }
  end
end

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end