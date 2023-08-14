class Category < ApplicationRecord
    has_many :products, dependent: :restrict_with_exception # Porque es una clave una foranea en la tabla productos
end
