module ApplicationHelper
    def people_form_method(person)
        if person.new_record?
            @method = "post"
        else
            @method = "put"
        end
        @method
    end
    
#    def people_form_action(person)
#        if person.new_record?
#            @action = "<%= "/people/#{@person.id}" %>"
#        else
#            @action = "/people"
#    end
end
