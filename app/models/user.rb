class User < ApplicationRecord

#パスワード暗号化
has_secure_password

# nameカラムに関するバリデーションを作成してください
validates:name,{presence: true}
# emailカラムに関するバリデーションを作成してください
validates:email,{presence: true , uniqueness: true}

def posts
  return Post.where(user_id: self.id)
end

end
