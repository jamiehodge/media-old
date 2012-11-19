require "bundler/setup"
require "rake/testtask"
require "queue_classic/tasks"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

namespace :qc do

  desc "Environment"
  task :environment do
    require_relative "queue"
    require_relative "job"
  end
  
  desc "Start a new worker for the (default or $QUEUE) queue"
  task work: :environment do
    Media::Queue::Worker.new.start
  end
end

namespace :db do

  desc "Environment"
  task :environment do
    require "sequel"
    require "pg"

    Media::DB = Sequel.connect(ENV["DATABASE_URL"])
    Media::DB.extension(:constraint_validations, :pg_hstore)
  end

  desc "Seed database"
  task seed: :environment do
    require_relative "db/seed"
  end

  desc "Setup database"
  task setup: :environment do
    Rake::Task["db:migrate:down"].invoke
    Rake::Task["db:migrate:up"].invoke
    Rake::Task["db:seed"].invoke
  end

  namespace :migrate do

    desc "Environment"
    task environment: :"db:environment" do
      Sequel.extension :migration
    end

    desc "Migrate to"
    task :to, [:target] => :environment do |t, args|
      Sequel::Migrator.run Media::DB, migrations_dir, target: args[:target]
    end

    desc "Migrate up"
    task up: :environment do
      Sequel::Migrator.run Media::DB, migrations_dir
    end

    desc "Migrate down"
    task down: :environment do
      Sequel::Migrator.run Media::DB, migrations_dir, target: 0
    end

    def migrations_dir
      File.expand_path("db/migrations", File.dirname(__FILE__))
    end
  end

  task migrate: "migrate:up"
end
