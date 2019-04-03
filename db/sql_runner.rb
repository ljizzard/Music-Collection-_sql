require ('pg')

class SqlRunner

  def self.run(sql, values = [])

  begin
    db = PG.connect({dbname: 'music_collection',
                      host: 'localhost'})
# prep statement
    db.prepare("query",sql)

# execute
    result = db.exec_prepared("query", values)

# close db
  ensure
      db.close()
  end

  return result
  end


end
