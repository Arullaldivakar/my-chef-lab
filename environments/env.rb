name "dev"
description "this is the Dev environment"
cookbook "apache","= 0.1.5"
cookbook "mysql","= 0.1.0"
override_attributes({
	"author2" => {
          "name" =>  "Arullaldivakar"
	}})
