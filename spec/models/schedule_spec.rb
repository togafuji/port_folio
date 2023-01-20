require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "スケジュール機能のテスト" do
    let(:user) { create(:user) }
    let(:homemember) { create(:homemember, user: user) }
    let(:schedule) { create(:schedule, user: user) }

    it "スケジュールのタイトルが空欄でないこと" do
      schedule = build(:schedule, title: nil, user: user)
      schedule.valid?
      expect(schedule.errors[:title]).to include("を入力してください")
    end

    it "スケジュールの内容が空欄でないこと" do
      schedule = build(:schedule, content: nil, user: user)
      schedule.valid?
      expect(schedule.errors[:content]).to include("を入力してください")
    end

    it "スケジュールに必要事項が記載されているば有効であること" do
      expect(schedule).to be_valid
    end
  end
end
