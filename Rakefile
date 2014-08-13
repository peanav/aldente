require "sequel"
require 'rake/testtask'

namespace :db do
  namespace :migrate do
    Sequel.extension :migration
    DB = Sequel.connect('postgres://localhost/aldente')
 
    desc "Perform migration reset (full erase and migration up)"
    task :reset do
      Sequel::Migrator.run(DB, "db/migrate", :target => 0)
      Sequel::Migrator.run(DB, "db/migrate")
      puts "<= sq:migrate:reset executed"
    end
 
    desc "Perform migration up to latest migration available"
    task :up do
      Sequel::Migrator.run(DB, "db/migrate")
      puts "<= sq:migrate:up executed"
    end
 
    desc "Perform migration down (erase all data)"
    task :down do
      Sequel::Migrator.run(DB, "db/migrate", :target => 0)
      puts "<= sq:migrate:down executed"
    end
  end

  task :migrate => "migrate:up"
end

Rake::TestTask.new do |t|
    t.libs = ['spec', 'lib']
    t.test_files = Dir['spec/**/*_spec.rb']
end
