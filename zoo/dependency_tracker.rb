require "json"

class DependencyTracker

  def initialize
    @sequence = []
    @dependency_graph = build_graph
  end

  def track
    @dependency_graph.keys.each do |dependency|
      unless dependency.tracked || @dependency_graph[dependency].empty?
        deep_track(dependency)
      end
    end

    result = @sequence.reverse_each.group_by { |task| task.parent }
    result.values.each do |tasks|
      puts tasks.sort.reverse.join(", ")
    end
  end

  def deep_track(dependency)
    dependency.tracked = true

    tasks = @dependency_graph[dependency]
    tasks.each do |task|
      if !task.tracked
        task.parent = dependency
        deep_track(task)
      end
    end

    @sequence.push(dependency)
  end

  def build_graph
    tasks = {}    # to ensure no duplicate tasks are created
    dependency_tasks = {}

    File.readlines("zoo/input.txt").each do |line|
      dependency_name, task_name = line.chomp.split("->")

      tasks[dependency_name] ||= Task.new(dependency_name)
      tasks[task_name] ||= Task.new(task_name)

      task = tasks[task_name]
      dependency = tasks[dependency_name]

      (dependency_tasks[dependency] ||= []) << task
      dependency_tasks[task] ||= []
    end

    dependency_tasks.sort_by { |k| k }.reverse.to_h
  end
end