class Guides

  attr_reader :directory

  def initialize(args={})
    @directory = args[:directory]
  end

  def to_epub
    merge_guides
    output_file.dirname.mkpath
    $stdout.puts "[%s]: Convert '%s' to '%s'." % [Time.now, markdown_guide, output_file]
    `pandoc #{markdown_guide} -o '#{output_file.basename}'`
    FileUtils.mv(output_file.basename, output_file)
  end

  private
  def output_file
    Pathname.new('output').join('Ember.js Guides.epub')
  end

  def markdown_guide
    directory.join('guide.md')
  end

  def merge_guides
    $stdout.puts "[%s]: Merge guides." % [Time.now]
    markdown_guide.open('w') { |file| file.write guide_content }
  end

  def guide_content
    urls.map { |url| markdown_for(url) }.join("\n")
  end

  # Finds all urls for individual guide files and returns them as an array of strings.
  #
  # @return [Array<String>] of urls to markdown files in logical order
  def urls
    YAML::load_file(directory.join('data', 'guides.yml')).map do |k, v|
      v.map { |e| e['url'] }
    end.flatten
  end

  def markdown_for(url)
    url.gsub!(/\.html$/, '')
    markdown_file = guides_root.join(url)
    markdown_file = markdown_file.directory? ? markdown_file.join('index.md') : guides_root.join("#{url}.md")
    $stdout.puts "[%s]: Retrieve content from '%s'." % [Time.now, markdown_file]
    content = markdown_file.read

    altered_content(content)
  end

  # Change URLs for images to avoid error message
  # pandoc: /views/images/primitive-to-semantic-event.png: openBinaryFile: does not exist (No such file or directory)
  def altered_content(text)
    r = /[("'](\/.*\.png)[)"']/
    root = source_root.expand_path
    text.gsub(r) { |m| m.gsub($1, [root, $1].join) }
  end

  def guides_root
    source_root.join('guides')
  end

  def source_root
    directory.join('source')
  end
end
