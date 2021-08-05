require "json"

class Sorter

  def initialize
    @sequence = []
    @dep_tasks_graph = build_graph
  end

  def sort
    @dep_tasks_graph.keys.each do |dependency|
      if !dependency.tracked
        unless @dep_tasks_graph[dependency].empty?
          deep_track(dependency)
        end
      end
    end

    result = @sequence.reverse_each.group_by { |task| task.parent }
    result.each do |dependency, tasks|
      puts tasks.sort.reverse.join(", ")
    end
  end

  def deep_track(dependency)
    dependency.tracked = true

    tasks = @dep_tasks_graph[dependency]
    tasks.each do |task|
      if !task.tracked
        task.parent = dependency
        deep_track(task)
      end
    end

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
      dependency = tasks[dependency_name]

      (dep_tasks[dependency] ||= []) << task
      dep_tasks[task] ||= []
    end

    dep_tasks.sort_by { |k| k }.reverse.to_h
  end
end