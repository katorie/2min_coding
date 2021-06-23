require 'find'

class Expression
end

class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dif) do |p|
      next unless File.file?(p)
      results << p
    end
    results
  end
end

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dif) do |p|
      next unless File.file?(p)
      name = File.basename(p)
      results << p if File.fnmatch(@pattern, name)
    end
    results
  end
end

class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dif) do |p|
      next unless File.file?(p)
      results << p if (File.size(p) > @size)
    end
    results
  end
end

class Writable < Expression
  def evaluate(dir)
    results = []
    Find.find(dif) do |p|
      next unless File.file?(p)
      results << p if File.writable?(p)
    end
    results
  end
end