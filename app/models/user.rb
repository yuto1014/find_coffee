class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  has_many :favorites, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :contact, dependent: :destroy

  has_many :items, dependent: :destroy
  attachment :profile_image


   has_many :events, dependent: :destroy

   has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
   has_many :following, through: :following_relationships
   has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
   has_many :followers, through: :follower_relationships

   has_many :entries
   has_many :direct_messages
   has_many :rooms, through: :entries

   has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
   has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  enum address: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
end
