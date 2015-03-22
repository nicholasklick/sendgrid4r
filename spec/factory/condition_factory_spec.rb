# encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe 'SendGrid4r::Factory::ConditionFactory' do
  before :all do
    Dotenv.load
    @factory = SendGrid4r::Factory::ConditionFactory.new
    @expect = {}
    @expect[:field] = 'last_name'
    @expect[:value] = 'Miller'
    @expect[:operator] = 'eq'
    @expect[:and_or] = ''
  end

  context 'always' do
    it 'is full case' do
      condition = @factory.create(
        field: 'last_name',
        value: 'Miller',
        operator: 'eq',
        and_or: '')
      expect(condition).to eq(@expect)
    end
  end
end
