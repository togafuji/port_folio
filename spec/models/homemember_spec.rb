require 'rails_helper'

RSpec.describe Homemember, type: :model do
  describe "スケジュール機能のテスト" do
    let(:user) { create(:user) }
    let(:homemember) { create(:homemember, user: user) }

    it "家族の名前が空欄でないこと" do
      homemember = build(:homemember, name: nil, user: user)
      homemember.valid?
      expect(homemember.errors[:name]).to include("を入力してください")
    end

    it "家族に必要事項が記載されているば有効であること" do
      expect(homemember).to be_valid
    end
  end
end
