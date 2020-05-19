class Comment
    ATTRIBUTES = {
      :id => "INTEGER PRIMARY KEY",
      :content => "TEXT",

    }

    def self.attributes
      ATTRIBUTES
    end
    #DO NOTE EDIT ANYTHING BELOW THIS
      ATTRIBUTES.keys.each do |attr_name|
      attr_accessor attr_name
      end

      include Persistable::InstanceMethods
      extend Persistable::ClassMethods
    end
