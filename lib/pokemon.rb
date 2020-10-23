class Pokemon
attr_accessor :id, :name, :type, :db

def initialize(id=nil)
# @id = id
# @name = name
# @type = type 
# @db = db
end

def self.save (name, type, db)
db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

def self.find (id, db)
    
    result = db.execute("SELECT * FROM pokemon WHERE id=?", [id])
    pokemon = self.new(result)
    pokemon.id = result[0][0]
    pokemon.name = result[0][1]
    pokemon.type = result[0][2]
    pokemon


end
end
