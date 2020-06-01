class Post < ActiveRecord::Base


end

#Rake console
# ActiveRecord::Base.connection.execute("SELECT * FROM posts")
#Post.all
#Post.all.to_sql
