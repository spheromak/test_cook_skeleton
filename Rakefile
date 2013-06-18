#!/usr/bin/env rake
require 'rake'
require 'rake/testtask'

task :default => 'test:quick'

namespace :test do

  Rake::TestTask.new do |t|
    t.name = :rspec
    t.test_files = Dir.glob('test/spec/**/*_spec.rb')
  end

  begin
    require 'kitchen/rake_tasks'
    Kitchen::RakeTasks.new
  rescue LoadError
    puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
  end

  begin
    require 'cane/rake_task'

    desc "Run cane to check quality metrics"
    Cane::RakeTask.new(:quality) do |cane|
      canefile = ".cane"
      cane.abc_max = 10
      cane.abc_glob =  '{recipes,libraries,resources,providers}/**/*.rb'
      cane.no_style = true
      cane.parallel = true
    end

    task :default => :quality
  rescue LoadError
    warn "cane not available, quality task not provided."
  end

  begin
    require 'foodcritic'

    task :default => [:foodcritic]
    FoodCritic::Rake::LintTask.new do |t|
      t.options = {:fail_tags => %w/correctness services libraries deprecated/ }
    end
  rescue LoadError
    warn "Foodcritic Is missing ZOMG"
  end

  begin
    require 'tailor/rake_task'
    Tailor::RakeTask.new
  rescue LoadError
    warn "Tailor gem not installed, now the code will look like crap!"
  end


  desc 'Run all of the quick tests.'
  task :quick do
    Rake::Task['test:quality'].invoke
    Rake::Task['test:foodcritic'].invoke
    Rake::Task['test:rspec'].invoke
    Rake::Task['test:tailor'].invoke
  end


  desc 'Run _all_ the tests. Go get a coffee.'
  task :complete do
    Rake::Task['test:quick'].invoke
    Rake::Task['test:kitchen:all'].invoke
  end

  desc 'Run CI tests'
  task :ci do
    Rake::Task['test:complete'].invoke
  end
end


namespace :release do
  task :update_metadata do
  end

  task :tag_release do
  end
end
