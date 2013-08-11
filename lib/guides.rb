class Guides

  attr_reader :directory

  def initialize(args={})
    @directory = args[:directory]
  end

  def merged_guides
    guide = Pathname.new('tmp/guide.md')

    guide.open('w') do |file|
      urls.each { |url| file.write markdown_for(url) }
    end

    guide
  end

  private
  # Finds all urls for individual guide files and returns them as an array of strings.
  #
  # @return [Array<String>] of urls to markdown files in logical order
  def urls
    content = YAML::load_file(directory.join('data', 'guides.yml'))

    content.map do |k, v|
      v.map { |e| e['url'] }
    end.flatten
  end

  def markdown_for(url)
    url.gsub!(/\.html$/, '')
    markdown_file = guides_root.join(url)
    markdown_file = markdown_file.directory? ? markdown_file.join('index.md') : guides_root.join("#{url}.md")
    markdown_file.read
  end

  def guides_root
    Pathname.new(directory).join('source', 'guides')
  end
end
