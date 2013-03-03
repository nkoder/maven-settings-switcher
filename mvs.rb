#!/usr/bin/ruby

require "fileutils"
require "fcntl"

def help
"Maven settings switcher

Show current
  mvs

Load
  mvs <name>

List available
  mvs -l

Write new (reads STDIN)
  mvs <name>
"
end

SETTINGS_XML = File.expand_path("~/.m2/settings.xml")
STORE = File.expand_path("~/.mvn-settings/files")

# Array of stored files
def stored_files
  Dir["#{STORE}/*"]
end

# Returns the name under which the current ~/.m2/settings.xml is stored
def current_name
  stored_files.find do |stored_file_name|
    return nil unless File.exist?(SETTINGS_XML)
    return File.basename(stored_file_name) if FileUtils.compare_file(SETTINGS_XML, stored_file_name)
  end
end

# Stores data into STORE under given 'name'
def store(name, data)
  File.write("#{STORE}/#{name}", data)
end

# Loads the given file to settings.xml
def load(name)
  FileUtils.cp("#{STORE}/#{name}", SETTINGS_XML)
end

# The piped input or nil
def piped_input
  # Reads from STDIN only if there is some data in it, does not block
  # Linux-specific
  # The file status 0 is piped input, the 32768 is input from <
  STDIN.read if [0, 32768].include?(STDIN.fcntl(Fcntl::F_GETFL))
end

def main
  Dir.mkdir(STORE) unless Dir.exist?(STORE)
  case ARGV[0]

  # Show help
  when "-h"
    puts help

  # List available
  when "-l"
    puts stored_files.map { |file| File.basename(file) }.join("\n")

  # Load or write
  when /[a-zA-Z0-9_\-.]+/
    requested_name = ARGV[0]

    data = piped_input
    if data then
      store(requested_name, data)
    else
      if File.exists?("#{STORE}/#{requested_name}") then
        load(requested_name)
      else
        puts "The requested settings file '#{requested_name}' is not stored"
      end 
    end

  # Show current
  when nil
    puts current_name || $stderr.puts("Current settings.xml is not stored or doesn't exist")
  end

end

main