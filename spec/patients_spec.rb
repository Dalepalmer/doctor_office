require('spec_helper')

describe(Patients) do
  describe("#name") do
    it("lets you give a doctor's name.") do
      test_patient = Patients.new({:name => "scrub the zebra", :doc_id => 1, :birthday => 19920105})
      expect(test_patient.name()).to(eq("scrub the zebra"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Patients.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patient to the array of saved patients") do
      test_patient = Patients.new({:name => "learn SQL", :doc_id => 1, :birthday => 19920105})
      test_patient.save()
      expect(Patients.all()).to(eq([test_patient]))
    end
  end

  describe("#doc_id)") do
    it("lets you read the doc ID out") do
      test_patient = Patients.new({:name => "learn SQL", :doc_id => 1, :birthday => 19920105})
      expect(test_patient.doc_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same patient if it has the same name") do
      patient1 = Patients.new({:name => "learn SQL", :doc_id => 1, :birthday => 19920105})
      patient2 = Patients.new({:name => "learn SQL", :doc_id => 1, :birthday => 19920105})
      expect(patient1).to(eq(patient2))
    end
  end


end
