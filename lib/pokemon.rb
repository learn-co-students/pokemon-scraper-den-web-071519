class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize id:, name:, type:, db:, hp:60
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]
    Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end

  def alter_hp(new_hp, db)
    hp = new_hp
    new_hp_query = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, id)
  end



end
