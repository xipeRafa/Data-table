class RemoveGradeFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :students, :grade, foreign_key: true
  end
end
