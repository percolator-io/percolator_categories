require 'bundler/setup'
Bundler.require
require 'percolator_categories'

def fixture_path(name)
  File.join(Dir.pwd, 'spec', 'fixtures', name)
end
