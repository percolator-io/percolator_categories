require 'spec_helper'

describe PercolatorCategories::Collection do
  context 'normal' do
    let(:file_path) { fixture_path('categories.yml') }
    let(:collection) { PercolatorCategories::Collection.from_yaml_file(file_path) }

    it 'contain items' do
      expect(collection.count).to eq(3)
    end
  end

  context 'without required attributes' do
    let(:file_path) { fixture_path('without_required_attributes.yml') }
    let(:collection) { PercolatorCategories::Collection.from_yaml_file(file_path) }

    it 'raise error' do
      expect { collection }.to raise_error(PercolatorCategories::Collection::InvalidCategoryError)
    end
  end

  context 'with unnecessary attributes' do
    let(:file_path) { fixture_path('with_unnecessary_attributes.yml') }
    let(:collection) { PercolatorCategories::Collection.from_yaml_file(file_path) }

    it 'raise error' do
      expect { collection }.to raise_error(PercolatorCategories::Collection::UnnecessaryAttributesError)
    end
  end

  context 'with id duplication' do
    let(:file_path) { fixture_path('with_id_duplication.yml') }
    let(:collection) { PercolatorCategories::Collection.from_yaml_file(file_path) }

    it 'raise error' do
      expect { collection }.to raise_error(PercolatorCategories::Collection::DuplicateIdError)
    end
  end

  context 'with invalid id' do
    let(:file_path) { fixture_path('with_invalid_id.yml') }
    let(:collection) { PercolatorCategories::Collection.from_yaml_file(file_path) }

    it 'raise error' do
      expect { collection }.to raise_error(PercolatorCategories::Collection::InvalidCategoryError)
    end
  end
end
