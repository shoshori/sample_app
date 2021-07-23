class User < ApplicationRecord
    validates :name,{presence:true, length:{maximum: 40}}
    validates :password,{presence:true}
end
