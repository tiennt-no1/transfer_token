
class User

  attr_accessor :password, :id, :amount, :file_name, :token

  def initialize(hash)
    hash.each do |key, val|
      eval("@#{key} = '#{val}'")
    end
  end

  def self.all
    Dir['db/user*.txt'].map do |file|
      data = JSON.parse(File.read(file))
      user = User.new(data)
      user.file_name = file
      user
    end
  end

  def to_hash
    { id: @id, password: @password, amount: @amount, token: @token }
  end

  def save
    File.write(@file_name, self.to_hash)
  end

  def self.find_by_id(id)
    file = "db/user#{id}.txt"
    data = JSON.parse(File.read(file))
    user = User.new(data)
    user.file_name = file
    user
  end

  def validate(token)
    User.all.each do |user|
      return user if user.token == token
    end
    nil
  end

end
