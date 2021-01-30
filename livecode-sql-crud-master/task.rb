require "pry-byebug"
class Task
  attr_accessor :title, :description, :done
  attr_reader :id

  def initialize(attrs = {})
    @id = attrs[:id]
    @title = attrs[:title]
    @description = attrs[:description]
    @done = attrs[:done] || false
  end

  def save
    @id.nil? ? create : update
  end

  def create
    query = <<-SQL
      INSERT INTO tasks (title, description, done)
      VALUES (?, ?, ?)
    SQL
    DB.execute(query, @title, @description, @done ? 1 : 0)
    @id = DB.last_insert_row_id
  end

  def update
    query = <<-SQL
      UPDATE tasks SET title = ?, description = ?, done = ?
      WHERE id = ?
    SQL
    DB.execute(query, @title, @description, @done ? 1 : 0, @id)
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end

  def self.all
    results = DB.execute('SELECT * FROM tasks')
    results.map do |result|
      build_task_from_row(result)
    end
  end


  def self.find(id)
    result = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    return if result.nil?

    build_task_from_row(result)
  end

  def self.build_task_from_row(row)
    Task.new({
      id: row["id"],
      description: row["description"],
      title: row["title"],
      done: row['done'] == 1
    })
  end

end
