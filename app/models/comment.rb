class Comment < ApplicationRecord
  has_paper_trail

  belongs_to :user
  belongs_to :post
end
