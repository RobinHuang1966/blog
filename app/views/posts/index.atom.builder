#一种rss
atom_feed do |feed|
  feed.title( @feed_title )
  feed.updated( @posts.last.created_at )
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title( post.name )
      entry.content( post.content, :type => 'html' )
    end
  end
end