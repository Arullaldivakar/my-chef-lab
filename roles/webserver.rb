name "webserver"
description "webserver roles"
run_list "recipe[chef-client::delete_validation]","recipe[chef-client::cron]","recipe[chef-client]","recipe[security]", "recipe[apache]"
