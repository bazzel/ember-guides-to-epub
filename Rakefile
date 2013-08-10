#!usr/bin/env rake

require './lib/ember_guides_to_kindle'

namespace :ember_guides_to_kindle do

  desc 'Generate kindle files'
  task :generate do
    start = Time.now
    $stdout.puts "[%s]: Start generating kindle files." % start

    EmberGuidesToKindle.generate

    finish = Time.now
    $stdout.puts "[%s]: Finished generating kindle files (%.2f s)." % [finish, (finish - start)]
  end
end
