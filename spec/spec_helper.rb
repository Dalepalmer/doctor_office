require('rspec')
require('patients')
require('docs')
require('pg')

DB = PG.connect({:dbname => 'doc_office_test'})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM patients *;")
      DB.exec("DELETE FROM docs *;")
    end
  end
