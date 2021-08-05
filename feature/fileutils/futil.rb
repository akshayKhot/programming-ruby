require "fileutils"
include FileUtils::Verbose

def run(a, *b, **c)
  pp [a, b, c]
end

run 10
run 10, 20
run 10, 20, 30, 40
run 10, 20, 30, 40, [50, 60]
run 10, 20, 30, 40, name: "akshay", age: 29
run 10, name: "akshay", age: 29
