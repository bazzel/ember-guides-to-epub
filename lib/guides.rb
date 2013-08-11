class Guides

  # Finds all urls for individual guide files and returns them as an array of strings.
  #
  # @param directory [Pathname] the root of the repository of the ember website.
  #
  # @return [Array<String>] of urls to markdown files in logical order
  def self.urls(directory)
    content = YAML::load_file(directory.join('data', 'guides.yml'))

    content.map do |k, v|
      v.map { |e| e['url'] }
    end.flatten
  end
end
