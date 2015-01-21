require('spec_helper')


describe(Docs) do
  describe(".all") do
    it("starts off with no doctors") do
      expect(Docs.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a doctor by their ID number") do
      test_doc = doc.new({:name => "Epicodus stuff", :id => nil})
      test_doc.save()
      test_doc2 = doc.new({:name => "Home stuff", :id => nil})
      test_doc2.save()
      expect(Docs.find(test_doc2.id())).to(eq(test_doc2))
    end
  end


  describe("#name") do
    it("tells you their name") do
      doc = Docs.new({:name => "Epicodus stuff", :id => nil})
      expect(doc.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets their ID when you save it") do
      doc = Docs.new({:name => "Epicodus stuff", :id => nil})
      doc.save()
      expect(doc.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save doctors to the database") do
      doc = Docs.new({:name => "Epicodus stuff", :id => nil})
      doc.save()
      expect(doc.all()).to(eq([doc]))
    end
  end

  describe("#==") do
    it("is the same doc if it has the same name") do
      doc1 = Docs.new({:name => "Epicodus stuff", :id => nil})
      doc2 = Docs.new({:name => "Epicodus stuff", :id => nil})
      expect(doc1).to(eq(doc2))
    end
  end


  describe("#patients") do
    it("returns an array of patientss for that doctor") do
      test_doc = doc.new({:name => "Epicodus stuff", :id => nil})
      test_doc.save()
      test_patient = Patients.new({:description => "learn SQL", :doc_id => test_doc.id(), :birthday => 19920105})
      test_patient.save()
      test_patient2 = Patients.new({:description => "Review Ruby", :doc_id => test_doc.id(), :birthday => 19920105})
      test_patient2.save()
      expect(test_doc.patients()).to(eq([test_patient, test_patient2]))
    end
  end


end
