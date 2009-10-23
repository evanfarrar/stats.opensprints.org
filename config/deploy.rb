set :application, "opensprints stats"
set :repository,  "git://github.com/evanfarrar/stats.opensprints.org.git"

set :branch, "master"
set :scm_verbose, true 
set :scm, :git

role :web, "stats.opensprints.org"                          # Your HTTP server, Apache/etc
role :app, "stats.opensprints.org"                          # This may be the same as your `Web` server
role :db,  "stats.opensprints.org", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/efarrar/stats.opensprints.org"
set :use_sudo, false
#set :shared_children,  %w(stats.opensprints.org/system stats.opensprints.org/log stats.opensprints.org/pids) 


namespace :deploy do
  task(:start) { }
  task(:stop) { }
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
