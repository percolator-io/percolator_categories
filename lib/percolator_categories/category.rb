module PercolatorCategories
  class Category
    include ActiveModel::Model

    attr_accessor :id, :name, :query, :parent, :subcategories
    validates :id, :name, presence: true

    def initialize(attributes = {})
      super
      @subcategories ||= []
    end
  end
end
