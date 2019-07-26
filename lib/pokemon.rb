require 'pry'
class Pokemon
    attr_reader :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name, type])
    end

    def self.find(id, db)
        db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", [id]).map do |row|
            new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: nil)
            return new_pokemon
        end
    end

end
