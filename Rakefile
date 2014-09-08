directory 'california' do
  sh "git clone git://git.gnome.org/california"
end

task :pull => "california" do
  sh "cd california && git pull"
end

desc "Build california deb package"
task :build => :pull do
  sh "docker build -t california-build ."
end
