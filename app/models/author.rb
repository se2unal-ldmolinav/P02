class Author < ApplicationRecord
    has_many :books, dependent: :destroy #tiene que ser en plural
end
