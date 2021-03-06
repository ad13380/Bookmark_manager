require 'database_connection'

describe DatabaseConnection do 
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
  
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'executes an SQL statement given as an argument' do
      connection = described_class.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks")

      DatabaseConnection.query("SELECT * FROM bookmarks")     
    end
  end
end

# run .setup pass in a database name (test database)
# expect 