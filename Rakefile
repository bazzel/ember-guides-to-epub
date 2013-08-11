#!usr/bin/env rake

require './lib/ember_guides_to_kindle'

namespace :ember_guides_to_epub do

  desc 'Generate epub'
  task :generate do
    start = Time.now
    $stdout.puts "[%s]: Start generating epub file." % start

    GitCloner.clone do |directory|
      one_guide = Guides.new(directory: directory)
      one_guide.to_epub
    end

    finish = Time.now
    $stdout.puts "[%s]: Finished generating epub file (%.2f s)." % [finish, (finish - start)]
  end
end
