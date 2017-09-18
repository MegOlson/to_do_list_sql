require("rspec")
require("pg")
require("to_do_list")
require("to_do_task")

DB = PG.connect({:dbname => "to_do_list_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
