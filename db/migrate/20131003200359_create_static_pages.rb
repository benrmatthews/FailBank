class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :home
      t.string :about
      t.string :help
      t.string :faq
      t.string :contact
      t.string :blog
      t.string :terms
      t.string :privacy

      t.timestamps
    end
  end
end
