class Tweet
  attr_accessor :message, :username
  attr_reader :id


  def self.all
    sql = <<-SQL
    SELECT * FROM tweets
    SQL

    results = DB[:conn].execute(sql)
  #   [{"id"=>8,
  # "username"=>"coffee_dad",
  # "message"=>"having coffee",
  # 0=>8,
  # 1=>"coffee_dad",
  # 2=>"having coffee"}, {}, {},...]

  # [[8, 'coffee_dad', 'having coffee'], [9, '', '']]

  # => [<Tweet 0x071267823 @message='having coffee' @username='coffee_dad'>]

    results.map do |tweet_info|
      Tweet.new(tweet_info)
    end
  end

  def initialize(props={})
    @message = props['message']
    @username = props['username']

    @id = props['id']
  end

  # tweet = Tweet.new({'username' => 'coffee_dad', 'message' => 'coffee'})
  # tweet.save

  def save
    # if the tweet instance has already been in the Database

    # update it

    # else (if its brand new)

    # create it


    sql = <<-SQL
    INSERT INTO tweets (message, username)
    VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.message, self.username)

  end

  def persisted?
    !!self.id
  end
  
end
