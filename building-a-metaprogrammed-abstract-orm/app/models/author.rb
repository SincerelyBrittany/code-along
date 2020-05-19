class Author

  ATTRIBUTES = {
    #hash that represents the schemaof your model
    #  attr_accessor :id, :title, :content
    :id => "INTEGER PRIMARY KEY",
    :name => "TEXT",
    :state => "TEXT",
    :city => "TEXT",
    :age => "INTEGER",

  }

  #DO NOTE EDIT ANYTHING BELOW THIS
    ATTRIBUTES.keys.each do |attr_name|
      #Looking at attributes and taking the key from that Hash
      #id, title, and content, and one at a time were passing the attr_accessor
      attr_accessor attr_name
    end


    def self.table_name
      #everytime I see the word post I want to see this method instead -- Abstraction
      "#{self.to_s.downcase}s"
      #Same as "#{Post.to_s.downcase}s"
    end

    def self.find(id)
      sql = <<-SQL
        SELECT * FROM #{self.table_name} WHERE id = ?
      SQL
      rows = DB[:conn].execute(sql, id)
      #binding.pry and run Post.find(1)
      #you will see that rows returns a nested array
      self.reify_from_row(rows.first) if rows.first
      #reify kind of means 'make real'
    end

    def ==(other_post)
      #Post.find(1) == Post.find(1) should return TRUE if instances are both the Same
      self.id == other_post.id
      #Post knows about object equality now

    end

    def self.reify_from_row(row)
      #take the instance and im going to loops through the
      #attributes of this class and i have words like id, title, and content
      #and im going to send the id= to the post and say that in row[0] will always correspond
      #to that attibute
      self.new.tap do |p|
        ATTRIBUTES.keys.each.with_index do |attr_name, i|
          p.send("#{attr_name}=", row[i])
        end
      end
    end

    def self.create_table #creates table
      sql = <<-SQL
        CREATE TABLE IF NOT EXISTS #{self.table_name} (
          #{self.create_sql}
        )
      SQL

     DB[:conn].execute(sql) #executes the sql and creats table
    end

    def self.create_sql #creates table
      # {
      #   :id => "INTEGER PRIMARY KEY",
      #   :title => "TEXT",
      #   :content => "TEXT",
      #   :author_name => "TEXT"
      # }
      ATTRIBUTES.collect{ |attr_name, schema| "#{attr_name} #{schema}"}.join(",")
      # ATTRIBUTES.collect do |attr_name,schema|
      #   "#{attr_name} #{schema}"
      # end
    end


    def save
      #IF THE POST has been saved before then call UPDATE
      persisted? ? update : insert
      #otherwise call insert

    end

    def persisted?
        !!self.id
        #if it has an id, then i know its TRUE
        #double bang if id is nil will return false
    end

    def self.attribute_names_for_insert
      #goal is to return title & contents & any other attr_accessor besides the # ID joined by a comma
      ATTRIBUTES.keys[1..-1].join(", ")
    end

    def self.question_marks_for_insert
      #how to change numbers to question marks
      (ATTRIBUTES.keys.size-1).times.collect{"?"}.join(",")

    end

    def attribute_values
        #want to get [Post.title, Post.content, etc]
        ATTRIBUTES.keys[1..-1].collect{|attr_name| self.send(attr_name)}
    end

    def self.sql_for_update
      #goal "title = ?, content = ?"
      # (ATTRIBUTES.keys.size-1).times.collect{"= ?"}.join(",")
      ATTRIBUTES.keys[1..-1].collect{|attr_name| "#{attr_name} = ?"}.join(", ")
    end

    private
    def insert
      sql = <<-SQL
        INSERT INTO #{self.class.table_name}(#{self.class.attribute_names_for_insert})
        VALUES (#{self.class.question_marks_for_insert})
      SQL

       DB[:conn].execute(sql, *[attribute_values])
       #attribute_values is an array (one argument)
       #in order to get all the values like self.title, self.content,etc -- you have to splattter
       #What is splatter? Check notes for an example

       self.id = DB[:conn].execute("SELECT last_insert_rowid();").flatten.first
    end

    def update
      sql = <<-SQL
        UPDATE #{self.class.table_name} SET #{self.class.sql_for_update} WHERE id = ?
      SQL

      DB[:conn].execute(sql, *attribute_values, self.id)
    end
  end
