class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
  
  def unexecute
    File.delete(@path)
  end
end

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @contents = File.read(@path)
    end

    File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@countents)
      f.close
    end
  end
end

class CopyFile < Command
  require 'fileutils'

  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    if File.exists?(@source)
      @contents = File.read(@source)
    end

    FileUtils.copy(@source, @target)
  end

  def unexecute
    if @contents
      f = File.open(@source, "w")
      f.write(@countents)
      f.close
    end

    File.delete(@target)
  end
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each {|cmd| cmd.execute }
  end

  def unexecute
    @commands.reverse.each {|cmd| cmd.unexecute }
  end

  def description
    description = ''
    @commands.each {|cmd| description += cmd.description + "\n" }
    description
  end
end

cmds = CompositeCommand.new
cmds.add_command(CreateFile.new('file1.txt', "hello world\n"))
cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))
cmds.execute
puts cmds.description