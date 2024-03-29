threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
plugin :tmp_restart

app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"

rails_env = ENV.fetch("RAILS_ENV") { "development" }
if rails_env == "production"
  stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true
else
  port ENV.fetch("PORT") { 3000 }
end
environment rails_env