Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }

class EmberGuidesToKindle

  def self.generate
    GitCloner.clone do |directory|
      puts "Repo an be found in #{directory}"
      # parse data/guides.yml
      puts 'Parsing data/guides.yml'
      puts 'and other stuff'
    end
  end

end
