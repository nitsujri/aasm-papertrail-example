class Post < ApplicationRecord
  include AASM

  has_paper_trail versions: {
    class_name: 'Post::Version'
  }

  belongs_to :user

  has_many :comments

  aasm do
    state :draft, initlal: true
    state :published

    before_all_events :before_all_events

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  private

  def before_all_events
    self.paper_trail_event = aasm.current_event
  end
end
