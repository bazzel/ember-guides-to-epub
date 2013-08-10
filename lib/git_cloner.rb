class GitCloner

  def clone
    remove
    `git clone -b master --depth 1 #{repository} #{directory}`
    yield
    remove
  end

  private
  def repository
    'https://github.com/emberjs/website'
  end

  def remove
    `rm -rf #{directory}`
  end

  def directory
    './tmp/ember-website'
  end
end
