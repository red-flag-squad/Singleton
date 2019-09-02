class My_printer
    PRINTING_DELAY = 10
    @instance = nil

    private_class_method :new

    def initialize
        @charcode = :ASCII
        @status = Status.new(PRINTING_DELAY)
    end

    def self.reset
        @instance = nil
    end

    def self.get_instance
        @instance = new() unless @instance
        @instance
    end

    def use charcode
        @charcode = charcode
    end

    def char_code
        @charcode
    end

    def print(job)
        @status.check_busy
        @current_job = job
        @status.set_as_busy
    end

    def status
        return @status.to_s
    end

    class Status
        MESSAGES={:printing=>'printing',:busy => 'Printer is busy'}

        def initialize(printing_delay)
            @delay = printing_delay
            @busy_till = Time.now - @delay
        end

        def set_as_busy
            @busy_till = Time.now + @delay
        end

        def check_busy
            raise MESSAGES[:busy] if busy?
        end

        def to_s
            MESSAGES[:printing] if busy?
        end

        private

        def busy?
            Time.now <= @busy_till
        end

    end
end
