require "rails_helper"

class Pattern1 < ApplicationRecord
  has_many :pattern1_children
end

class Pattern1Child < ApplicationRecord
  belongs_to :pattern1
  validate :check_child_count

  private

  def check_child_count
    if pattern1.pattern1_children.size > 3
      errors.add(:base, "子は3つ以上は作れません")
    end
  end
end

RSpec.describe Pattern1, type: :model do
  describe "子の方にバリデーションして、sizeでチェック" do
    let(:pattern1) { Pattern1.create! }
    before do
      pattern1.pattern1_children.create!
      pattern1.pattern1_children.create!
      pattern1.pattern1_children.create!
    end

    it "create! 3個以内なので追加できない事（でも追加できてしまう）" do
      expect { pattern1.pattern1_children.create! }.to raise_error ActiveRecord::RecordInvalid # raise されない
      expect(pattern1.pattern1_children.count).to eq 3
    end

    it "create 3個以内なので追加できない事（でも追加できてしまう）" do
      child = pattern1.pattern1_children.create
      expect(child).not_to be_valid # これはinvalidなのに
      expect(pattern1.pattern1_children.count).to eq 3 # 4になってしまう
    end

    it "new and saveはバリデーションエラーになること" do
      child = pattern1.pattern1_children.new
      expect(child).not_to be_valid
    end

    it "子が更新できる事" do
      child = pattern1.pattern1_children.last
      child.title = "test"
      expect(child).to be_valid
    end
  end
end
