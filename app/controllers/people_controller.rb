require 'sinatra'
set :bind, '0.0.0.0'

#@note=""

get '/people' do
    @people = Person.all
    erb :"/people/index"
end

get '/people/new' do
    @person = Person.new
    erb :"/people/new"
end

post '/people' do
    @person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate])
    if @person.valid?
        if params[:birthdate].include?("-")
            birthdate = params[:birthdate]
#        elsif !Person.valid_birthdate(birthdate.gsub("-",""))
#            @errors = "You should enter a valid birthdate in the form of mmddyyyy."
#            erb :"/people/new"
        else
            birthdate = DateTime.strptime(params[:birthdate], "%m%d%Y") #careful: interprets input as DD-MM-YY; if entered as MM-DD-YY && DD >12, birthdate error.
        end
        @person.save
        redirect "/people/#{person.id}"
    else
#        @error = "The data you entered isn't valid"
        @errors = ''
        @person.errors.full_messages.each do |message|
            @errors = "#{@errors} #{message}."
        end
        erb :"/people/new"
    end
end

get '/people/:id' do
    @person = Person.find(params[:id])
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    birth_path_num = Person.get_birth_path_num(birthdate_string)
    @message = Person.numerology_msg(birth_path_num)
    erb :"/people/show"
end   

get '/people/:id/edit' do
    @person = Person.find(params[:id])
    erb :"/people/edit"
end

put '/people/:id' do
    person = Person.find(params[:id])
    person.first_name = params[:first_name]
    person.last_name = params[:last_name]
    person.birthdate = params[:birthdate]
    person.save
    redirect "/people/#{person.id}"
end

delete '/people/:id' do
    person = Person.find(params[:id])
#    @note="You deleted #{person.first_name} #{person.last_name}!"
    person.destroy
    redirect "/people"
end