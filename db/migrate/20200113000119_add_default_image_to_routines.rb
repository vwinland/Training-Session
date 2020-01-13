class AddDefaultImageToRoutines < ActiveRecord::Migration
  def change
    change_column_default :routines, :image, 'http://www.ptonline.it/media/k2/items/cache/2fb5466a104eac2a47f2a0a18a529671_M.jpg'
  end
end
