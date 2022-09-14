class User < ActiveRecord::Base 

    has_many :posts
    has_many :user_followers, :class_name => 'Follower', :foreign_key => 'followers_id'
    has_many :user_following, :class_name => 'Follower', :foreign_key => 'following_id'
    belongs_to :phase

     def find_following_names
        following = self.user_followers.pluck(:following_id)
        following.map do |f|
            User.find(f)
        end
    end

end