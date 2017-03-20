namespace :roles do
  desc 'Create app roles'
  task create: :environment do
    %w(viewer developer).each{|name| Role.create(name: name)}
  end
end