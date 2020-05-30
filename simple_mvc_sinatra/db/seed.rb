todos = [
  "Wake up",
  "Code",
  "Coding Challenge",
  "Do labs",
  "Read readmes"
]

todos.each do |t|
  Todo.create(content: t)
end
