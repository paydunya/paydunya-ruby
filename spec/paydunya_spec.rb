# frozen_string_literal: true

require 'spec_helper'

describe Paydunya do
  it 'should initialize http response strings' do
    expect(Paydunya::SUCCESS).to eq 'success'
    expect(Paydunya::FAIL).to eq 'fail'
    expect(Paydunya::PENDING).to eq 'pending'
  end

  it 'should have a version number' do
    expect(Paydunya::VERSION).to be
  end
end
