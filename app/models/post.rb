class Post < ApplicationRecord
  validates :title, { presence: true }
  validates :content, {length: {minimum: 250}}
  validates :summary, {length: {maximum: 250}}
  validates :category, {inclusion: {in: %w{Fiction Non-Fiction} }}
  validate :clickbait_title

  def clickbait_title
    clicky = /\b(?:Won't\sBelieve|Secret|Top\s%d|Guess)\b/
    unless :title.match(clicky)
      errors.add(:title, "title is not clickbait enough")
    end
  end

end
