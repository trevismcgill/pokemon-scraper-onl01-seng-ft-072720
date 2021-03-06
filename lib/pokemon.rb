require 'pry'

class Pokemon
attr_accessor :name, :type
attr_reader :id, :db
    def initialize(id: nil, name:, type:, db:)
        @id= id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL
        
        db.execute(sql, name, type)
        
      end
    
      def self.find(id, db)
        sql = <<-SQL
          SELECT * FROM pokemon WHERE id = (?);
        SQL
        pokemon = db.execute(sql, id)
        # binding.pry
        self.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
      end
    
end
