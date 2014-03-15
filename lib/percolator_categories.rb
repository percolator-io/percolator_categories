require 'yaml'
require 'active_support/all'
require 'active_model'

module PercolatorCategories
  extend ActiveSupport::Autoload

  autoload :Version
  autoload :Category
  autoload :Collection
end
