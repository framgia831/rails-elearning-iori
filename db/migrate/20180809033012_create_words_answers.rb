class CreateWordsAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :words_answers do |t|
      t.references :word, foreign_key: true
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
