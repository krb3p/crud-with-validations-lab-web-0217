class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :date_check
  validates :title, uniqueness: {scope: :artist_name}


  def date_check
    if released
      if release_year
        if release_year <= Date.today.year
        else
          errors.add :release_year, "Release date must be in the past."
        end
      end
    end
  end

end
