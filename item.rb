class Item
    attr_accessor :genre, :author, :source, :label, :publish_date, :publish_date
    attr_reader :id, :archived, 

    def initialize(genre, author, source,label,publish_date,archived)
        @id =Random.rand(0..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def move_to_archive()
        if(can_be_archived?())
            @archived = true           
        end        
    end

    private
    def can_be_archived?()
        @publish_date>10
    end
 

end