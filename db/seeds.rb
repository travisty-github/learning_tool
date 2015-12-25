# Subjects
Subject.create(title: "Widget Operations")
Subject.create(title: "Poodle Grooming")
Subject.create(title: "Lawnmower Racing")

# Generate 10 chunks for each subject
Subject.all.each do |s|
  1.upto(10) do |i|
    Chunk.create(question: "Question #{i}", answer: "Answer #{i}",
                 subject: s)
     end
end
