def save_books
    updated_books = []


    @books.each do |book|
    updated_books << {publisher:book.publisher,cover_state:book.cover_state,publish_date:book.publish_date}
        File.write('json/books.json', JSON.pretty_generate(updated_books))
    end
end

def save_label
    updated_labels = []
    @labels.each do |label|
        updated_labels <<{title:label.title,color:label.color}
        File.write('json/labels.json', JSON.pretty_generate(updated_labels))
        end
end


