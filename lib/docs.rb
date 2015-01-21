class Docs
  attr_reader(:name, :doc_id, :speciality)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
    @doc_id = attributes.fetch(:doc_id)
  end

  define_singleton_method(:all) do
    returned_docs = DB.exec("SELECT * FROM docs;")
    docs = []
    returned_docs.each() do |doc|
      name = doc.fetch("name")
      speciality = doc.fetch("specialty")
      id = doc.fetch("id").to_i()
      docs.push(Docs.new({:name => name, :id => id, :speciality => speciality}))
    end
    docs
  end

  define_singleton_method(:find) do |id|
    found_doc = nil
    Docs.all().each() do |doc|
      if doc.id().==(id)
        found_doc = doc
      end
    end
    found_doc
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO docs (name) VALUES ('#{@name} #{@speciality}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_doc|
    self.name().==(another_doc.name()).&(self.id().==(another_doc.id()))
  end

  define_method(:patients) do
    doc_patients =  []
    patients = DB.exec("SELECT * FROM patients WHERE doc_id = #{self.id()}")

    patients.each() do |patient|
      name = patient.fetch("name")
      doc_id = patient.fetch("doc_id").to_i()
      birthday = patient.fetch("birthday")
      doc_patients.push(Patients.new(:name => name, :doc_id => doc_id, :birthday => birthday))
    end
    doc_patients
  end
end
