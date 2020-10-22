class Pokemon
attr_accessor :id, :name, :type, :db

def initialize (id: nil, name:, type:, db:)
@id = id
@name = name
@type = type 
@db = db
end

def self.save (name, type, db)
sql = <<-SQL
INSERT INTO pokemon (name, type) VALUES (?, ?)
SQL

DB[:conn].execute(sql, self.name, self.type)
@id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon") [0][0]
end

def self.find (id_num)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = DB[:conn].execute(sql)
    new_pokemon = self.new
    new_pokemon.id = row[0]
    new_pokemon.name = row[1]
    new_pokemon.type = row[2]
    new_pokemon
end
end
