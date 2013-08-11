Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }

class EmberGuidesToKindle

  def self.generate
    GitCloner.clone do |directory|
      one_guide = Guides.new(directory: directory)
      one_guide.to_epub
    end
  end

end
