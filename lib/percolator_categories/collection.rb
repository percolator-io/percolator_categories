module PercolatorCategories
  class Collection
    class BaseError < StandardError; end
    class DuplicateIdError < BaseError
      def initialize(category)
        super "category id: #{category.id}"
      end
    end

    class UnnecessaryAttributesError < BaseError
    end

    class InvalidCategoryError < BaseError
      def initialize(category)
        messages = []
        messages << "category id: #{category.id}" if category.id
        messages << "errors: #{category.errors.full_messages}"
        super messages.join(', ')
      end
    end

    class << self
      def from_yaml_file(file)
        content = File.open file
        raw = YAML.load content

        collection = new
        raw.each do |attrs|
          collection.append attrs
        end
        collection
      end
    end

    attr_reader :roots

    def initialize
      @map = {}
      @roots = []
    end

    def append(attrs, parent_id = nil)
      c_attrs = attrs.extract! 'id', 'name', 'query'
      category = Category.new c_attrs
      subcategories_attrs = attrs.delete('subcategories') || []

      raise DuplicateIdError, category if @map.has_key? category.id
      raise UnnecessaryAttributesError if attrs.any?
      raise InvalidCategoryError, category if category.invalid?

      @map[category.id] = category

      if parent_id
        parent = @map[parent_id]
        category.parent = parent
        parent.subcategories << category
      else
        @roots << category
      end

      subcategories_attrs.each do |s_attrs|
        append s_attrs, category.id
      end
    end

    def count
      @map.keys.count
    end
  end
end
