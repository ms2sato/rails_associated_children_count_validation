# アソシエーションした子モデルの数をバリデーションする方法の模索

全てSpecで書いてあります( https://github.com/ms2sato/rails_associated_children_count_validation/tree/master/spec/models )。

bundle install してマイグレーションしたら

```
bundle exec rspec
```

で全部テストできるはずです。

以下の4ケースが全部グリーンになることを目指しています。

- parent.children.create!
- parent.children.create
- parent.children.new からの child.save
- 既に保存されたchildrenの更新

pattern1 〜 pattern4はそれぞれありそうな実装を試しています。それぞれテストがレッドになります。
5は弊社のメンバーがよく書いている形で、自分も改めて試行錯誤した結果これで良いかなと思うのですが、あまり見かけない書き方なのでもっと良い方法があるのであれば知りたいです。

例えば初学者の人に「こうすると良いよ」と教える場合のお手本になるようなコードがあればぜひ知りたいです。

パターン5のコードは以下のようなものです。 `pattern5.pattern5_children.where.not(id: id).count` として、自分以外の数をカウントしています。

```rb
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
```
