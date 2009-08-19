require File.dirname(__FILE__) + '/spec_helper'

class ActiveRecordDynamicExistsTestRecord < ActiveRecord::Base
end

describe ActiveRecord::Base do
  before(:all) do
    connection = ActiveRecordDynamicExistsTestRecord.connection
    begin
      connection.create_table(:active_record_dynamic_exists_test_records) do |t|
        t.string :name
        t.string :description
      end
    rescue Exception => e
      puts "Error in before(:each): #{e}"
    end
  end

  after(:all) do
    [ActiveRecordDynamicExistsTestRecord].each do |klass|
      begin
        klass.connection.drop_table(klass.table_name)
      rescue Exception => e
        puts "Error in after(:each): #{e}"
      end
    end
  end

  it "should respond to exists_by_*" do
    ActiveRecordDynamicExistsTestRecord.respond_to?("exists_by_name?").should be_true
    ActiveRecordDynamicExistsTestRecord.respond_to?("exists_by_name_and_description?").should be_true
  end

  it "should query the db correctly" do
    record = ActiveRecordDynamicExistsTestRecord.create!(:name => "Vijay", :description => "Aravamudhan")
    
    ActiveRecordDynamicExistsTestRecord.exists_by_id?(record.id).should be_true
    ActiveRecordDynamicExistsTestRecord.exists_by_name?(record.name).should be_true
    ActiveRecordDynamicExistsTestRecord.exists_by_name_and_description?(record.name, record.description).should be_true
  end
end
