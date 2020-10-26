class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable

        has_many :books
        has_many :book_comments, dependent: :destroy
        has_many :favorites, dependent: :destroy
        attachment :profile_image


        has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
        has_many :followed, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy

        has_many :following_users, through: :follower, source: :followed
        has_many :follower_users, through: :followed, source: :follower

        def follow(user_id)
          follower.create(followed_id: user_id)
        end

        def unfollow(user_id)
          follower.find_by(followed_id: user_id).destroy
        end

        def following?(user)
          following_users.include?(user)
        end

        def self.search(search,word)
            if search == "forward_match"
              @users = User.where("name LIKE?","#{word}%")
            elsif search == "backward_match"
              @users = User.where("name LIKE?","%#{word}")
            elsif search == "perfect_match"
              @users = User.where(name:"#{word}")
            elsif search == "partial_match"
              @users = User.where("name LIKE?","%#{word}%")
            else
              @users = User.all
            end
        end

        def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
       
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              email:    User.dummy_email(auth),
              password: Devise.friendly_token[0, 20],
              profile_image: auth.info.image,
              name: auth.info.name,
              nickname: auth.info.nickname,
              location: auth.info.location
            )
          end
       
          user
        end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
