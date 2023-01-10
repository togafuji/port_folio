require 'rails_helper'
require 'pry'

RSpec.describe Member, type: :model do
  describe "スケジュール機能のテスト" do
    let(:user) { create(:user) }
    let(:diary) { create(:diary, user: user) }
  
 it "日記のタイトルが空欄でないこと" do
    diary = build(:diary, title: nil, user: user )
    diary.valid?
    expect(diary.errors[:title]).to include("を入力してください")
  end
  
  it "スケジュールの内容が空欄でないこと" do
    diary = build(:diary, body: nil, user: user )
    diary.valid?
    expect(diary.errors[:body]).to include("を入力してください")
  end
  
  it "家族に必要事項が記載されているば有効であること" do
    expect(diary).to be_valid
  end
  end
end