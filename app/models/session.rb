class Session < ApplicationRecord
  belongs_to :user

  before_create :generate_key

  validates_uniqueness_of :key

  private

  def generate_key
    begin
      self.key = SecureRandom.hex(20)
    end while Session.where(key: self.key).any?
  end
end
