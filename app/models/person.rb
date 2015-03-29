class Person < ActiveRecord::Base
    
    validates_presence_of :birthdate, :first_name, :last_name
    
    def self.get_birth_path_num (birthdate)
    number = birthdate[0].to_i + birthdate [1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
    number = number.to_s
    number = number[0].to_i + number[1].to_i
        
        if number > 9
            number = number.to_s
            number = number[0].to_i + number[1].to_i
        else number
        end
        return number
    end
    
    
    def self.numerology_msg (birth_path_num)  
        num = "Your numerology number is #{birth_path_num}. "
        case birth_path_num
            when 1
            msg = "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
            when 2
            msg = "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
            when 3
            msg = "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
            when 4
            msg = "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
            when 5
            msg = "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
            when 6
            msg = "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
            when 7
            msg = "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
            when 8
            msg = "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
            when 9
            msg = "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
        else
            msg = "Somehow your numerology number is not 1 through 9."
            num = "Error: "
        end
        numerology_msg = num + msg
    end



    def self.valid_birthdate(input)
        if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
            return true
        else
            return false
        end
    end
    
end