require 'bcrypt'

class User


    attr_accessor :password, :id, :amount, :file_name

    def initialize(hash)
        hash.each do |key,val|
            eval("@#{key} = #{val}")
        end
    end

    def self.all
        Dir['db/user*.txt'].each do |file|
            data = JSON.parse(File.read(file))
            user = User.new(data)
            user.file_name = file
        end
    end

    def to_hash
        {id : @id, password: @password, amount: @amount}
    end

    def save
        File.write(@file_name, self.to_hash)
    end

end
