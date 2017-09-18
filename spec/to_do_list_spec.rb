require 'spec_helper'

describe(List) do
  let(:list) { List.new({:name => "Epicodus stuff", :id => nil}) }
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
      expect(list.id).to be_an_instance_of Fixnum
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
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to eq list2
    end
  end
end