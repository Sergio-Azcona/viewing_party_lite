class AddMovieDataToViewParty < ActiveRecord::Migration[5.2]
  def change
    add_column :view_parties, :movie_data, :string
  end
end
