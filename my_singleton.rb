class My_singleton
    @@instance = new
    private_class_method :new

    def self.get_instance
        @@instance
    end
end