require 'bcrypt'

class User
    attr_accessor :name, :password

    include BCrypts
    
    def self.find_by_name(name)
        @instance = self.new
        @instance.name = name
    end

    def password
        @password ||= Password.new(password_hash)
    end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end


end
