class GitCloner

  def clone
    # clone ember repo
    `rm -rf tmp/ember-website`
    `git clone -b master --depth 1 git@github.com:emberjs/website.git ./tmp/ember-website`
    yield
    #
    #
    #
    # rm ember repo
    `rm -rf tmp/ember-website`
  end
end
