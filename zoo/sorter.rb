require "json"
require "set"

class Sorter

  def initialize
    @sequence = []
    @dep_tasks_graph = build_graph
  end

  def sort
    @dep_tasks_graph.keys.each do |dependency|
      if dependency.color == :white
        dfs_visit(dependency)
      end
    end

    @sequence.reverse_each { |task| puts task }
  end

  def dfs_visit(dependency)
    dependency.color = :gray

    tasks = @dep_tasks_graph[dependency]
    tasks.each do |task|
      if task.color == :white
        task.parent = dependency
        dfs_visit(task)
      end
    end

    dependency.color = :black

    @sequence.push(dependency)
  end

  def build_graph
    tasks = {}
    dep_tasks = {}

    File.readlines("zoo/input.txt").each do |line|
      dependency_name, task_name = line.chomp.split("->")

      tasks[dependency_name] ||= Task.new(dependency_name)
      tasks[task_name] ||= Task.new(task_name)

      task = tasks[task_name]
      dep_tasks[task] ||= []

      dependency = tasks[dependency_name]
      (dep_tasks[dependency] ||= []) << task
    end

    # jj dep_tasks.sort_by { |k| k }.reverse.to_h
    dep_tasks.sort_by { |k| k }.reverse.to_h
  end

  # def to_s
  #   @dep_tasks_graph.each do |dependency, tasks|
  #     print "#{dependency} (#{dependency.color}) -> "
  #     print tasks.join ", "
  #     puts
  #   end
  # end
end