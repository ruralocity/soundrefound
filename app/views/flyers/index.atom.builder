atom_feed do |feed|
  feed.title("Sound Refound")
  feed.updated((@flyers.last.created_at))

  @flyers.each do |flyer|
    feed.entry(flyer) do |entry|
      entry.title(flyer.full_description)
      entry.content "Visit the site to see the flyer."
      entry.link(flyer_url(flyer))
      entry.author do |author|
        author.name("Aaron Sumner")
      end
    end
  end
end
