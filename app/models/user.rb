class User < ApplicationRecord

	vallidates :username , presence: true ,
			   uniqueness:{case_sensitive: false},  
			   length: { minimum:3, maximum: 25 } 

	VALID_EMAIL_REGEX: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/i
	vallidates :email , presence: true ,
			   uniqueness:{case_sensitive: false},  
			   length: { maximum: 100 } 
			   format:{with: VALID_EMAIL_REGEX }


end 