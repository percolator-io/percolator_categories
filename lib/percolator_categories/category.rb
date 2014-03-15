module PercolatorCategories
  class Category
    include ActiveModel::Model

    attr_accessor :id, :name, :query, :parent, :subcategories
    validates :id, :name, presence: true
    validates :id, format: { with: /\A[a-z\d_]+\z/ }

    def initialize(attributes = {})
      super
      @subcategories ||= []
    end
  end
end
