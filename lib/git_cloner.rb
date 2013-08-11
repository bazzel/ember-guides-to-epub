class GitCloner

  def self.clone(&block)
    new.clone(&block)
  end

  def clone
    cleanup
    $stdout.puts "[%s]: Clone %s to %s." % [Time.now, repository, directory]
    `git clone -b master --depth 1 #{repository} #{directory}`
    yield directory
    cleanup
  end

  private
  def repository
    'https://github.com/emberjs/website'
  end

  def cleanup
    $stdout.puts "[%s]: Remove %s." % [Time.now, directory]
    `rm -rf #{directory}`
  end

  def directory
    Pathname.new('./tmp/ember-website')
  end
end
