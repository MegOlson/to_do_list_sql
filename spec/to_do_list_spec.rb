require 'spec_helper'

DB = PG.connect({:dbname => 'to_do_list_test'})

describe(List) do
  let(:list) { List.new({:name => "Epicodus stuff", :list_id => nil}) }
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all).to eq []
    end
  end

  describe("#name") do
    it("tells you its name") do
      expect(list.name).to eq "Epicodus stuff"
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list.save
      expect(list.list_id).to be_an_instance_of Fixnum
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list.save
      expect(List.all).to eq [list]
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :list_id => nil})
      list2 = List.new({:name => "Epicodus stuff", :list_id => nil})
      expect(list1).to eq list2
    end
  end
  describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus stuff", :list_id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff", :list_id => nil})
      test_list2.save()
      expect(List.find(test_list2.list_id())).to(eq(test_list2))
    end
  end
end
