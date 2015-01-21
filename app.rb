require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/patients')
require('./lib/docs')
require('pg')

DB = PG.connect({:dbname => "doc_office"})

get("/") do
  @patients = Patients.all()
  @docs = Docs.all()
  erb(:index)
end

post("/patients") do
  name = params.fetch("name")
  birthday = params.fetch("birthday")
  docs_id = params.fetch("docs_id").to_i()
  patient = patient.new({:name => name, :doc_id => docs_id, :birthday => birthday })
  patient.save()
  @doc = Docs.find(docs_id)
  erb(:patients)
end


post("/docs") do
  name = params.fetch("doc_name")
  specialty = params.fetch("specialty")
  docs = Docs.new({:name => name, :id => nil, :speciality => specialty})
  docs.save()
  @docs = Docs.all()
  erb(:index)
end

get("/docs/:id") do
  @doc = Docs.find(params.fetch("id").to_i())
  erb(:patients)
end
