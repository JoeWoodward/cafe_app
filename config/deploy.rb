 # Change cafe_app to your apps name & server_ip to your server's ip

 require 'bundler/capistrano'
 load 'deploy/assets'

 # use this if using rbenv on server, capistrano uses a very basic interactive shell
 # that doesn't automatically include all paths
 set :default_environment, {
  'PATH' => "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
 }

 set :application, "cafe_app"

 set :normalize_asset_timestamps, false

 role :web, "server_ip"

 role :app, "server_ip"

 role :db, "server_ip", :primary => true

 default_run_options[:pty] = true

 set :ssh_options, { :forward_agent => true }

 set :deploy_to, "/home/deploy/apps/cafe_app"

 set :deploy_via, :remote_cache

 set :user, "deploy"

 set :use_sudo, false

 set :scm, :git

 set :scm_username, "deploy"

 set :repository, "ssh://deploy@server_ip/~/cafe_app.bare_repo.git/"

 set :branch, "deploy"

 set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end

before 'deploy:update' do
  system 'git push linode deploy'
end

after 'deploy:update_code', 'bundler:bundle_new_release'

# after 'deploy:update_code', 'deploy:symlink_shared'
before 'deploy:assets:precompile', 'deploy:symlink_shared'
