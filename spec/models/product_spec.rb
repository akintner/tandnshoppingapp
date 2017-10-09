require 'rails_helper'

RSpec.describe Product, type: :model do
  
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :cost }
  end

  context 'associations' do
    it { should have_many :line_items }
    it { should have_many :orders }
  end
end
