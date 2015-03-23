require 'sinatra'
set :bind, '0.0.0.0'


#for duplicate code in get '/:birthdate', post '/'
    def setup_index_view
        birthdate = params[:birthdate].gsub("-","")
        @birth_path_num = Person.get_birth_path_num(birthdate)
        @message = Person.numerology_msg (@birth_path_num)
        "#{@message}"
        erb :index
    end

get '/' do
    erb :form
end

#recovered this from a previous commit. had initially deleted due to duplicate in post '/'
get '/:birthdate' do
    setup_index_view
end

post '/' do
    birthdate = params[:birthdate].gsub("-","")
    if Person.valid_birthdate(birthdate)
        setup_index_view
        redirect "/message/#{@birth_path_num}"
    else
        @error = "You should enter a valid birthdate in the form of mmddyyyy."
        erb :form
    end
end     

get '/message/:birth_path_num' do
    birth_path_num = params[:birth_path_num].to_i
    @message = Person.numerology_msg(birth_path_num)
    erb :index
end