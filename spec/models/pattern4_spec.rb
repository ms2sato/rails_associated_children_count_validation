require "rails_helper"

class Pattern4 < ApplicationRecord
  has_many :pattern4_children
end

class Pattern4Child < ApplicationRecord
  belongs_to :pattern4
  validate :check_child_count

  private

  def check_child_count
    if pattern4.pattern4_children.count > 3
      errors.add(:base, "子は3つ以上は作れません")
    end
  end
end

RSpec.describe Pattern4, type: :model do
  describe "子の方にvalidate内でcountチェック" do
    let(:pattern4) { Pattern4.create! }
    before do
      pattern4.pattern4_children.create!
      pattern4.pattern4_children.create!
      pattern4.pattern4_children.create!
    end

    it "create! 3個以内なので追加できない事（でも追加される）" do
      pattern4.pattern4_children.create!
      expect(pattern4.pattern4_children.count).to eq 3
    end

    it "create 3個以内なので追加できない事（でも追加される）" do
      child = pattern4.pattern4_children.create
      expect(child).not_to be_valid
      expect(pattern4.pattern4_children.count).to eq 3
    end

    it "new and saveはバリデーションエラーになること（まだ保存されないのでできない）" do
      child = pattern4.pattern4_children.new
      expect(child).not_to be_valid
    end

    it "子が更新できる事" do
      child = pattern4.pattern4_children.last
      child.title = "test"
      expect(child).to be_valid
    end
  end
end
