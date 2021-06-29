require 'finder'

def backup(dir, find_expression = All.new)
  puts "Backup called, source dir=#{dir} find expr= #{find_expression}"
end

def to(backup_directory)
  puts "To called, backup dir=#{backup_directory}"
end

def interval(minutes)
  puts "Interval called, interval= #{interval} minutes"
end

eval(File.read('backup.pr'))

class Backup
  include Singleton

  attr_accessor :backup_directory, :interval
  attr_reader :data_sources

  def initialize
    @data_sources = []
    @backup_directory = '/backup'
    @interval = 60
  end

  def backup_files
    this_backup_dir = Time.new.ctime.tr(' :', '_')
    this_backup_path = File.join(backup_directory, this_backup_dir)
    @data_sources.each {|source| source.backup(this_backup_path) }
  end

  def run
    while true
      backup_files
      sleep(@interval * 60)
    end
  end
end