require 'fileutils'

task :install do
  FileUtils.cp("mvs.bash", "/etc/bash_completion.d/")
  FileUtils.cp("mvs.rb", "/usr/bin/mvs")
  FileUtils.chmod(0755, "/usr/bin/mvs")
end