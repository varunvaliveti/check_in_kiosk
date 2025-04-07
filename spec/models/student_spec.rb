require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'check_in_time cant be empty' do   #
    expect {Student.create(check_in_time: nil)}.to raise_error(ActiveRecored::RecordInvalid)
  end
end
