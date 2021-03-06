class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_create :set_member

  mount_uploader :avatar, AvatarUploader
  
  def self.find_for_facebook_oauth(auth, signed_in_resources=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
          pass = Devise.friendly_token[0,20]
          user = User.new(  name: auth.extra.raw_info.name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.info.email,
                            password: pass,
                            password_confirmation: pass)
          user.skip_confirmation!
          user.save
      end
      user
  end

  def self.top_rated
      self.select('users.*'). # select all attributes of the user
          select('COUNT(DISTINCT comments.id) AS comments_count'). # count the comments made by the user
          select('COUNT(DISTINCT posts.id) AS posts_count'). # count the posts made by the user
          select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank'). # Add the comment count to the post count and label the sum as 'rank'
          joins(:posts). # ties the posts table to the users table, via the user_id
          joins(:comments). # ties the comments table to the users table, via the user_id
          group('users.id'). # Instructs the database to group the results so that each user will be returned in a distinct row
          order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
  end

  def role?(base_role)
      role == base_role.to_s
  end

  def favorited(post)
      self.favorites.where(post_id: post.id).first
  end

  def voted(post)
      self.votes.where(post_id: post.id).first
  end

  private

  def set_member
      self.role = 'member'
  end

end
