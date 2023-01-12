require 'rails_helper'
require 'pry'

RSpec.describe "Diaries", type: :system do
  let!(:user) { create(:user) }
  let!(:diary) { create(:diary, user: user) }

  describe "GET / index" do
    before do
      login(user)
      visit user_diaries_path(user.id)
    end

    it "日記の日付が年月日にて表示されていること" do
      expect(page).to have_content diary.when_diary.strftime("%Y年%-m月%-d日")
    end

    it "日記のタイトルが表示されていること" do
      expect(page).to have_content diary.title
    end

    it "日記を書いた人の名前が表示されていること" do
      expect(page).to have_content diary.whodiary
    end
  end

  describe "GET /show" do
    before do
      visit user_diary_path(user.id, diary.id)
    end

    it "日記の日付の表示" do
      expect(page).to have_content diary.when_diary.strftime("%Y年%-m月%-d日")
    end

    it "日記の作成者の表示" do
      expect(page).to have_content diary.whodiary
    end

    it "日記のタイトルの表示" do
      expect(page).to have_content diary.title
    end

    it "日記の内容の表示" do
      expect(page).to have_content diary.body
    end
  end
end
