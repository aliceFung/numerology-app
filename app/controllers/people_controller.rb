require 'sinatra'
set :bind, '0.0.0.0'

get '/people' do
    @people = Person.all
    erb :"/people/index"
end

get '/people/new' do
    @person = Person.new
    erb :"/people/new"
end

post '/people' do
  if params[:birthdate].include?("-")
    birthdate = params[:birthdate]
  else
      birthdate = DateTime.strptime(params[:birthdate], "%m%d%Y")
  end
    #step 2 check, error for birthdate = nil    Is it an input form error? Dashes are ok, 12/12/2001 is not, nor 02feb12
  if birthdate.nil?
        birthdate=Time.now
  else
      birthdate
  end
    
    person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
#    @id = person.id
    redirect "/people/#{person.id}"
end

get '/people/:id' do
#    "This is a person show page"
    @person = Person.find(params[:id])
#    @first_name = @person[:first_name]
#    @last_name = @person[:last_name]
    @message = @person[:birthdate]
#    birthdate_string = @person.birthdate.strftime("%m%d%Y")
#    birth_path_num = Person.get_birth_path_num(birthdate_string)
#    @message = Person.numerology_msg(birth_path_num)
    erb :"/people/show"
end   