class WorldCup

  attr_accessor :id, :host, :year, :winner

    # Open the connection to the DB
    def self.open_connection

      conn = PG.connect( dbname: 'blog' )

    end

    # Method to get all instances from our DB
    def self.all

      # calling the open_connection method
      conn = self.open_connection

      # Creating a SQL string
      sql = "SELECT * FROM post ORDER BY id"

      # Execute the connection with our SQL string, storing it in a variable
      # 'Dirty array'
      results = conn.exec(sql)

      # 'Cleaned array'
      worldcups = results.map do |tuple|
        self.hydrate tuple
      end

    end

    # Find one using the ID that'll give it when we call it
    def self.find id
      # Open connection
      conn = self.open_connection

      # SQL to find using the ID
      sql = "SELECT * FROM worldcup WHERE id=#{ id } LIMIT 1"

      # Get the raw results
      worldcups = conn.exec(sql)

      # Result comes back as array so need to run hydrate on first instance
      worldcup = self.hydrate worldcups[0]

      # Return the cleaned post
      worldcup

    end

    def save

      conn = Post.open_connection

      # If the object that the save method is run on does NOT have an existing ID, create a new instance
      if (!self.id)
        sql = "INSERT INTO worldcup (host, year, winner) VALUES ('#{ self.host }','#{ self.year }','#{self.winner}')"
      else
        sql = "UPDATE worldcup SET host='#{self.host}', year='#{self.year}', winner='#{self.winner}' WHERE id='#{self.id}'"
      end

      conn.exec(sql)

    end

    # DESTROY method
    def self.destroy id
      conn = self.open_connection

      sql = "DELETE FROM worldcup WHERE id=#{id}"

      conn.exec(sql)
    end

    # The data we get back from the DB isn't particularly clean, so we need to create a method to clean it up before we send it to the Controller
    def self.hydrate worldcup_data

      # Create a new instance of Post
      worldcup = WorldCup.new

      # Assign the id, title and body properties to those that come back from the DB
      worldcup.id = worldcup_data['id']
      worldcup.host = worldcup_data['host']
      worldcup.year = worldcup_data['year']
      worldcup.winner = worldcup_data['winner']

      # Return the post
      worldcup

    end

end
