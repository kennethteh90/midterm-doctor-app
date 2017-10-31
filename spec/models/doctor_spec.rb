require 'rails_helper'

RSpec.describe Doctor, type: :model do

  let!(:doctor) { create (:doctor) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

end
