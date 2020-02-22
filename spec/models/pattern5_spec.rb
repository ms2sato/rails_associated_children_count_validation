require "rails_helper"

class Pattern5 < ApplicationRecord
  has_many :pattern5_children
end

class Pattern5Child < ApplicationRecord
  belongs_to :pattern5
  validate :check_child_count

  private

  def check_child_count
    if pattern5.pattern5_children.where.not(id: id).count > 2
      errors.add(:base, "子は3つ以上は作れません")
    end
  end
end

RSpec.describe Pattern5, type: :model do
  describe "子の方にvalidate内でcountチェック" do
    let(:pattern5) { Pattern5.create! }
    before do
      pattern5.pattern5_children.create!
      pattern5.pattern5_children.create!
      pattern5.pattern5_children.create!
    end

    it "create! 3個以内なので追加できない事" do
      expect { pattern5.pattern5_children.create! }.to raise_error ActiveRecord::RecordInvalid
      expect(pattern5.pattern5_children.count).to eq 3
    end

    it "create 3個以内なので追加できない事" do
      child = pattern5.pattern5_children.create
      expect(child).not_to be_valid
      expect(pattern5.pattern5_children.count).to eq 3
    end

    it "new and saveはバリデーションエラーになること" do
      child = pattern5.pattern5_children.new
      expect(child).not_to be_valid
      expect(pattern5.pattern5_children.count).to eq 3
    end

    it "子が更新できる事" do
      child = pattern5.pattern5_children.last
      child.title = "test"
      expect(child).to be_valid
      expect(pattern5.pattern5_children.count).to eq 3
    end
  end
end
