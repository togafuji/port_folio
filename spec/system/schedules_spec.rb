require 'rails_helper'

RSpec.describe "Schedules", type: :system do
  let(:user) { create(:user) }
  let(:homemember) { create(:homemember, user: user) }
  let!(:schedule) { create(:schedule, user: user) }

  describe "GET /index" do
    before do
      login(user)
      visit user_schedules_path(user.id)
    end

    it "スケジュールのタイトルの表示" do
      expect(page).to have_content schedule.title
    end

    it "家族一覧の表示" do
      expect(page).to have_content homemember.name
    end
  end

  describe "GET /show" do
    before do
      login(user)
      visit user_schedule_path(user.id, schedule.id)
    end

    it "スケジュールの日時の表示" do
      expect(page).to have_content schedule.start_time.strftime("%Y年%-m月%-d日 %-H時%-M分")
    end

    it "スケジュールの作成者の表示" do
      expect(page).to have_content schedule.whoschedule
    end

    it "スケジュールのタイトルの表示" do
      expect(page).to have_content schedule.title
    end

    it "スケジュールの内容の表示" do
      expect(page).to have_content schedule.content
    end
  end
end
