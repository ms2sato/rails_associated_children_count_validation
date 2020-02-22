require "rails_helper"

class Pattern2 < ApplicationRecord
  has_many :pattern2_children
  validates :pattern2_children, length: { maximum: 3 }
end

class Pattern2Child < ApplicationRecord
  belongs_to :pattern2
  validates_associated :pattern2
end

RSpec.describe Pattern2, type: :model do
  describe "親にlength指定して、子にvalidates_associated" do
    let(:pattern2) { Pattern2.create! }
    before do
      pattern2.pattern2_children.create!
      pattern2.pattern2_children.create!
      pattern2.pattern2_children.create!
    end

    it "create! 3個以内なので追加できない事（でも追加される）" do
      pattern2.pattern2_children.create!
      expect(pattern2.pattern2_children.count).to eq 3
    end

    it "create 3個以内なので追加できない事（でも追加される）" do
      child = pattern2.pattern2_children.create
      expect(child).not_to be_valid #ここは invalid
      expect(pattern2.pattern2_children.count).to eq 3
    end

    it "new and saveはバリデーションエラーになること" do
      child = pattern2.pattern2_children.new
      expect(child).not_to be_valid
    end

    it "子が更新できる事" do
      child = pattern2.pattern2_children.last
      child.title = "test"
      expect(child).to be_valid
    end
  end
end
