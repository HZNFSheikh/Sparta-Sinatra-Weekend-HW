class Olympics

  attr_accessor :id, :host_city, :olympic_year

    # Open the connection to the DB
    def self.open_connection

      conn = PG.connect( dbname: 'sport' )

    end

    # Method to get all instances from our DB
    def self.all

      # calling the open_connection method
      conn = self.open_connection

      # Creating a SQL string
      sql = "SELECT * FROM olympics ORDER BY id"

      # Execute the connection with our SQL string, storing it in a variable
      # 'Dirty array'
      results = conn.exec(sql)

      # 'Cleaned array'
      olympics = results.map do |tuple|
        self.hydrate tuple
      end

      olympics

    end

    # Find one using the ID that'll give it when we call it
    def self.find id
      # Open connection
      conn = self.open_connection

      # SQL to find using the ID
      sql = "SELECT * FROM olympics WHERE id=#{ id } LIMIT 1"

      # Get the raw results
      olympics = conn.exec(sql)

      # Result comes back as array so need to run hydrate on first instance
      olympic = self.hydrate olympics[0]

      # Return the cleaned post
      olympic

    end

    def save

      conn = Olympics.open_connection

      # If the object that the save method is run on does NOT have an existing ID, create a new instance
      if (!self.id)
        sql = "INSERT INTO olympics (host_city, olympic_year) VALUES ('#{ self.host_city }','#{ self.olympic_year }')"
      else
        sql = "UPDATE olympics SET host_city='#{self.host_city}', olympic_year='#{self.olympic_year}' WHERE id='#{self.id}'"
      end

      conn.exec(sql)

    end

    # DESTROY method
    def self.destroy id
      conn = self.open_connection

      sql = "DELETE FROM olympics WHERE id=#{id}"

      conn.exec(sql)
    end

    # The data we get back from the DB isn't particularly clean, so we need to create a method to clean it up before we send it to the Controller
    def self.hydrate olympic_data

      # Create a new instance of Post
      olympic = Olympics.new

      # Assign the id, title and body properties to those that come back from the DB
      olympic.id = olympic_data['id']
      olympic.host_city = olympic_data['host_city']
      olympic.olympic_year = olympic_data['olympic_year']

      # Return the post
      olympic

    end

end
