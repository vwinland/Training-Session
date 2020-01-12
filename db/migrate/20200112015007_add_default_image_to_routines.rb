class AddDefaultImageToRoutines < ActiveRecord::Migration
  def change
    change_column_default :routines, :image, 'https://images.unsplash.com/photo-1562771242-a02d9090c90c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2551&q=80'
  end
end
