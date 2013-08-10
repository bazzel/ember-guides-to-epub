Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }

class EmberGuidesToKindle

  def self.generate
    git = GitCloner.new
    git.clone do
      # parse data/guides.yml
      puts 'Parsing data/guides.yml'
    end
  end

end
