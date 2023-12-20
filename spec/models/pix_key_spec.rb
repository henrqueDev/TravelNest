require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe PixKey, type: :model do
  describe 'validations' do
    it 'key should be unique' do
      expect(ActiveRecord::Base.connection.index_exists?(:pix_keys, :key, unique: true)).to be_truthy
    end
  end
end
