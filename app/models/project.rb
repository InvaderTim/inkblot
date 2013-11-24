class Project < ActiveRecord::Base
	cattr_accessor :genres do
    ['Science Fiction','Romance', "Fantasy", "Humour", "Mystery", "Paranormal", "Thriller", "Horror", "Action", "Adventure", "Historical Fiction", "Teen Fiction", "Fan Fiction", "Poetry", "Short Story","Chick Lit", "Spiritual","Non Fiction","Biography","Essay", "Young Adult" ].sort.push('Other')
  end
  cattr_accessor :ratings do
  	['G: General Audiences', 'PG: Parental Guidance Suggested', 'PG-13: Parents Strongly Cautioned', 'R: Restricted', 'NC-17']
  end
  validates :title, presence: true, length: { minimum: 1}
  validates :text, presence: true, length: {minimum: 1}

  mount_uploader :image, CoverartUploader

end
