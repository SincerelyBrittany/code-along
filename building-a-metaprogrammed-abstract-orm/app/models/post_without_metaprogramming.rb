# #Abrtaction means less details
# #refied - more literal
# class Post
#   attr_accessor :id, :title, :content
#
#   def self.table_name
#     #everytime I see the word post I want to see this method instead -- Abstraction
#     "#{self.to_s.downcase}s"
#     #Same as "#{Post.to_s.downcase}s"
#   end
#
#   def self.find(id)
#     sql = <<-SQL
#       SELECT * FROM #{self.table_name} WHERE id = ?
#     SQL
#     rows = DB[:conn].execute(sql, id)
#     #binding.pry and run Post.find(1)
#     #you will see that rows returns a nested array
#     self.reify_from_row(rows.first)
#     #reify kind of means 'make real'
#   end
#
#   def ==(other_post)
#     #Post.find(1) == Post.find(1) should return TRUE if instances are both the Same
#     self.id == other_post.id
#     #Post knows about object equality now
#
#   end
#
#   def self.reify_from_row(row)
#     self.new.tap do |p|#tap is going to return the instance (the post itself)
#       p.id = row[0]
#       p.title = row[1]
#       p.content = row[2]
#     end
#   end
#
#   def self.create_table #creates table
#     sql = <<-SQL
#       CREATE TABLE IF NOT EXISTS #{self.table_name} (
#         id INTEGER PRIMARY KEY,
#         title TEXT,
#         content TEXT
#       )
#     SQL
#
#    DB[:conn].execute(sql) #executes the sql and creats table
#   end
#
#   def save
#     #IF THE POST has been saved before then call UPDATE
#     persisted? ? update : insert
#     #otherwise call insert
#
#   end
#
#   def persisted?
#       !!self.id
#       #if it has an id, then i know its TRUE
#       #double bang if id is nil will return false
#   end
#
#   private
#   def insert
#     sql = <<-SQL
#       INSERT INTO #{self.class.table_name}(title, content) VALUES (?, ?)
#     SQL
#
#      DB[:conn].execute(sql, self.title, self.content)
#      #After we insert a post, we need to get the primary key out of the db
#      # and set the id of this instance to that value
#      #cant save without -- because you wont have an id if you dont
#      #google - how to get the last interted row in SQLite
#      self.id = DB[:conn].execute("SELECT last_insert_rowid();").flatten.first
#   end
#
#   def update
#     sql = <<-SQL
#       UPDATE #{self.class.table_name} SET title = ?, content = ? WHERE id = ?
#     SQL
#
#     DB[:conn].execute(sql, self.title, self.content, self.id)
#   end
# end
