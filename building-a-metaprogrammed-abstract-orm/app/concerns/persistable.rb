module Persistable
  module ClassMethods
    def table_name
        "#{self.to_s.downcase}s"
    end

    def create(attr_hash)
      #Post.create(:title => "Title") #=> Pose: @id = 1
      self.new.tap do |p|
        attr_hash.each do |attr_name, attr_value|
          p.send("#{attr_name}=", attr_value)
        #c = Comment.create(:content => "what really?")
        #Should return comment with content and id
        end
        p.save
      end

    end

    def find(id)
      sql = <<-SQL
        SELECT * FROM #{self.table_name} WHERE id = ?
      SQL
      rows = DB[:conn].execute(sql, id)
      self.reify_from_row(rows.first) if rows.first
    end

    def reify_from_row(row)
      self.new.tap do |p|
        self.attributes.keys.each.with_index do |attr_name, i|
          p.send("#{attr_name}=", row[i])
        end
      end
    end

    def create_table #creates table
      sql = <<-SQL
        CREATE TABLE IF NOT EXISTS #{self.table_name} (
          #{self.create_sql})
      SQL
     DB[:conn].execute(sql)
     end

    def create_sql
      self.attributes.collect{ |attr_name, schema| "#{attr_name} #{schema}"}.join(",")
    end

    def attribute_names_for_insert
      self.attributes.keys[1..-1].join(", ")
    end

    def question_marks_for_insert
    (self.attributes.keys.size-1).times.collect{"?"}.join(",")
    end

    def sql_for_update
    self.attributes.keys[1..-1].collect{|attr_name| "#{attr_name} = ?"}.join(", ")
    end

  end

  module InstanceMethods
    def destroy
      sql = <<-SQL
        DELETE FROM #{self.class.table_name} WHERE id = ?
      SQL

      DB[:conn].execute(sql, self.id)
    end

    def ==(other_post)
      self.id == other_post.id
    end

    def save
      persisted? ? update : insert
    end

    def persisted?
        !!self.id
    end

    def attribute_values
      self.class.attributes.keys[1..-1].collect{|attr_name| self.send(attr_name)}
    end

    def insert
    sql = <<-SQL
        INSERT INTO #{self.class.table_name}(#{self.class.attribute_names_for_insert})
        VALUES (#{self.class.question_marks_for_insert})
      SQL


       DB[:conn].execute(sql, *[attribute_values])

       self.id = DB[:conn].execute("SELECT last_insert_rowid();").flatten.first
    end

    def update
      sql = <<-SQL
        UPDATE #{self.class.table_name} SET #{self.class.sql_for_update} WHERE id = ?
      SQL

      DB[:conn].execute(sql, *attribute_values, self.id)
    end

end
end
