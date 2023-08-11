class AddNullFalseToProductFields < ActiveRecord::Migration[7.0]
  def change
    # accion :tabla, :columna, true/false (false = no se permite null)
    change_column_null :products, :title, false
    change_column_null :products, :description, false
    change_column_null :products, :price, false
  end
end
