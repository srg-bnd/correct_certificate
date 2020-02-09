require 'rails_helper'

RSpec.describe Domain, type: :model do
  describe '#validations' do
    it 'should validate the presence of the name' do
      domain = build :domain
      expect(domain).to be_valid
    end

    it 'should validate the presence of state ok' do
      domain = build :domain
      expect(domain).to respond_to(:ok?)
    end

    it 'should validate the presence of state error' do
      domain = build :domain
      expect(domain).to respond_to(:bad?)
    end

    it 'should validate the presence of the name' do
      domain = build :domain, name: nil

      expect(domain).not_to be_valid
      expect(domain.errors.details[:name]).to include(error: :blank)
    end

    it 'should validate the uniqueness of the name' do
      create :domain
      domain = build :domain

      expect(domain).not_to be_valid
      expect(domain.errors.details[:name]).to include(
        error: :taken, value: domain.name
      )
    end
  end
end
