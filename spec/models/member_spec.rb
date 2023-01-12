require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "スケジュール機能のテスト" do
    let(:user) { create(:user) }
    let(:member) { create(:member, user: user) }

    it "家族の名前が空欄でないこと" do
      member = build(:member, name: nil, user: user)
      member.valid?
      expect(member.errors[:name]).to include("を入力してください")
    end

    it "家族に必要事項が記載されているば有効であること" do
      expect(member).to be_valid
    end
  end
end
