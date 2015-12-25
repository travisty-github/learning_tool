# Subjects
Subject.create(title: "Widget Operations")
Subject.create(title: "Poodle Grooming")
Subject.create(title: "Lawnmower Racing")

# Generate 10 chunks for each subject
chunk_numbers = [*1..10]
Subject.all do |s|
  chunk_numbers.each do |cn|
    Chunk.create(question: "Question #{cn}", answer: "Answer #{cn}",
                 subject_id: s.id)
     end
end
