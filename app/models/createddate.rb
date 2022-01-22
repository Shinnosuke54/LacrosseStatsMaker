class Createddate < ApplicationRecord
  # https://techacademy.jp/magazine/7727より抜粋
  default_scope -> { order(created_at: :desc) }
  has_many :stats
end
