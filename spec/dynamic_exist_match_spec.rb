require File.dirname(__FILE__) + '/spec_helper'

describe ActiveRecord::DynamicExistMatch do
  it "should not match method name" do
    ActiveRecord::DynamicExistMatch.match("not_exists_at_all").should be_nil
  end

  it "should match method name successfully" do
    match = ActiveRecord::DynamicExistMatch.match("exists_by_age_and_sex_and_location?")
    match.should_not be_nil
    match.attribute_names.should == %w(age sex location)
  end
end

# class DynamicScopeTest < ActiveRecord::TestCase
#   def test_dynamic_scope
#     assert_equal Post.scoped_by_author_id(1).find(1), Post.find(1)
#     assert_equal Post.scoped_by_author_id_and_title(1, "Welcome to the weblog").first, Post.find(:first, :conditions => { :author_id => 1, :title => "Welcome to the weblog"})
#   end
# end
