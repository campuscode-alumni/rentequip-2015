require 'rails_helper'

describe Contract do
  it 'calc rental period' do
    contract = create(:contract)

    expect(contract.devolution_date)
      .to eq(contract.created_at.to_date + contract.rental_period.period)
  end
end
