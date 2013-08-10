class GitCloner

  def self.clone(&block)
    new.clone(&block)
  end

  def clone
    cleanup
    `git clone -b master --depth 1 #{repository} #{directory}`
    yield directory
    cleanup
  end

  private
  def repository
    'https://github.com/emberjs/website'
  end

  def cleanup
    `rm -rf #{directory}`
  end

  def directory
    Pathname.new('./tmp/ember-website')
  end
end
