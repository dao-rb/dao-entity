require 'spec_helper'

describe Dao::Entity do
  it 'has a version number' do
    expect(Dao::Entity::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
