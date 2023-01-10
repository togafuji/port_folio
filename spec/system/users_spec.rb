require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  
  before do
    login(user)
  end
  
  describe "ログイン後" do
    it "ログイン後メニュー画面に遷移すること" do
      expect(current_path).to eq family_path(user.id)
    end
    
    it "ログイン後メニュー画面にスケジュール表へのリンクが表示されていること" do
      expect(page).to have_link 'スケジュール表'
    end
    
    it "ログイン後メニュー画面に日記へのリンクが表示されていること" do
      expect(page).to have_link '日記'
    end
  end
end
