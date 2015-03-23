require 'sinatra'
set :bind, '0.0.0.0'

get '/people/:id' do
#    "This is a person show page"
    @person = Person.find(params[:id])
#    @first_name = @person[:first_name]
#    @last_name = @person[:last_name]
#    @birthdate = @person[:birthdate]
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    birth_path_num = Person.get_birth_path_num(birthdate_string)
    @message = Person.numerology_msg(birth_path_num)
    erb :"/people/show"
end

get '/people' do
    @people = Person.all
    erb :"/people/index"
end
    