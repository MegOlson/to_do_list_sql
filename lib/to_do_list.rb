class List
  attr_reader(:name, :list_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @list_id = attributes.fetch(:list_id)
  end

  def self.all
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      list_id = list.fetch("list_id").to_i
      lists.push(List.new({:name => name, :list_id => list_id}))
    end
    lists
  end

  def self.find(list_id)
   found_list = nil
   List.all().each() do |list|
     if list.list_id().==(list_id)
       found_list = list
     end
   end
   found_list
  end

  def save
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING list_id;")
    @list_id = result.first.fetch("list_id").to_i
  end

  def tasks
    list_tasks = []
    tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.list_id()};")
    tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      list_tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    list_tasks
  end

  def ==(another_list)
    self.name == another_list.name && self.list_id == another_list.list_id
  end
end
