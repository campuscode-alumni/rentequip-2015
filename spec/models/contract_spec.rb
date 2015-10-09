require 'rails_helper'

describe Contract do
  it 'calc rental period' do

    contract = create(:contract, created_at: '2015-11-02')

    expect(contract.devolution_date).to eq(DateTime.new(2015,12,02))

  end
end
