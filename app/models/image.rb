class Image < ApplicationRecord
    validates :article_id, presence: true
    validates :image_url, presence: true
end
