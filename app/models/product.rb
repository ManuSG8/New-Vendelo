class Product < ApplicationRecord
    include PgSearch::Model # De la gema pg_search para buscar por texto en PostgreSQL
    pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }

    has_one_attached :photo

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true

    belongs_to :category # Clave foranea
end
