

class Corrector 
    def initialize(name)
        @name = name
    end

    def correct_name
       @name =  @name.capitalize
        if @name.length > 10
            @name = @name[0,9]
        end
        @name
    end

end