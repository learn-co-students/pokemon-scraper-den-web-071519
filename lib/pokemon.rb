class Pokemon
    attr_reader :id
    attr_accessor :name, :type, :db
    
    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
            LIMIT 1;
        SQL
        new_poke_info = db.execute(sql, id)[0]
        new_poke = Pokemon.new(id: new_poke_info[0], name: new_poke_info[1], type: new_poke_info[2], db: db)
        new_poke
        end

    def initialize(name: name, type: type, db: db, id: id=nil)
        @id = id
        @name = name
        @type = type
        @db = db
        # @hp = hp
    end

    # def alter_hp(new_hp, db)
    #     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    # end

end
