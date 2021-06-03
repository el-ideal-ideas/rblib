# frozen_string_literal: true
require 'rblib'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe RbLib do
  it "バージョンが記述されていること" do
    expect(RbLib::VERSION).not_to be nil
  end

  it "check_typeメソッドのテスト" do
    expect{RbLib.check_type(Integer, 10)}.not_to raise_error(ArgumentError)
    expect{RbLib.check_type(String, 10)}.to raise_error(ArgumentError)
    expect{RbLib.check_type(String, '10')}.not_to raise_error(ArgumentError)
    expect{RbLib.check_type(String, 10)}.to raise_error(ArgumentError)
  end
end
