require "rails_helper"

class Pattern3 < ApplicationRecord
  has_many :pattern3_children
end

class Pattern3Child < ApplicationRecord
  belongs_to :pattern3
  after_save :check_child_count

  private

  def check_child_count
    if pattern3.pattern3_children.count > 3
      errors.add(:base, "子は3つ以上は作れません")
    end
  end
end

RSpec.describe Pattern3, type: :model do
  describe "子の方にafter_save内でcountチェック" do
    let(:pattern3) { Pattern3.create! }
    before do
      pattern3.pattern3_children.create!
      pattern3.pattern3_children.create!
      pattern3.pattern3_children.create!
    end

    it "create! 3個以内なので追加できない事（でも追加される）" do
      pattern3.pattern3_children.create!
      expect(pattern3.pattern3_children.count).to eq 3
    end

    it "create 3個以内なので追加できない事（でも追加される）" do
      child = pattern3.pattern3_children.create
      expect(child).not_to be_valid
      expect(pattern3.pattern3_children.count).to eq 3
    end

    it "new and saveはバリデーションエラーになること" do
      child = pattern3.pattern3_children.new
      expect(child).not_to be_valid
    end

    it "子が更新できる事" do
      child = pattern3.pattern3_children.last
      child.title = "test"
      expect(child).to be_valid
    end
  end
end
