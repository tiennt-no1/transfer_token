require 'bcrypt'

class User


    attr_accessor :password, :id, :amount

    def initialize(hash)
        hash.each do |key,val|
            eval("@#{key} = #{val}")
        end
    end

    def self.all
        Dir['db/user*.txt'].each do |file|
            data = JSON.parse(File.read(file))
            user = User.new(data)
            pp user

        end
    end

end
