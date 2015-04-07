require 'spec_helper'

RSpec.configure do |c|
  c.use_transactional_examples = true
  c.order = "defined"
end

RSpec.describe Report, :type => :model do
    #it "with search" do
      #report = Report.create(reportname: "report 1")
      #report = Report.search("r", nil)
      #expect(report.reportname).to eq("report 1")
    #end

  it "has none to begin with" do
    expect(Report.count).to eq 0
  end

  it "has one after adding one" do
    Report.create
    expect(Report.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Report.count).to eq 0
  end

  it "report the existing constant" do
    report = mock_model("Report")
    report.should be_a(Report)
  end

  after(:all) { Report.destroy_all }
end