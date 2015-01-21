class Patients
  attr_reader(:name, :doc_id, :birthday)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @doc_id = attributes.fetch(:doc_id)
    @birthday = attributes.fetch(:birthday)
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      doc_id = patient.fetch("doc_id").to_i()
      birthday = patient.fetch("birthday")
      patients.push(Patients.new({:name => name, :doc_id => doc_id, :birthday => birthday}))
    end
    patients
  end

  define_method(:save) do
    DB.exec("INSERT INTO patients (name, doc_id, birthday) VALUES ('#{@name}', #{@doc_id}, '#{@birthday}')")
  end

  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&(self.list_id().==(another_patient.doc_id()))
  end
end
