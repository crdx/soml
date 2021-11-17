require 'soml'

describe SOML do
    let (:singleline_document) do
        <<~EOF
            Field1 123
        EOF
    end

    let (:multiline_document) do
        <<~EOF
            Lyric1 Never
            Lyric2 Gonna
            Lyric3 Give
            Lyric4 You
            Lyric5 Up
        EOF
    end

    let (:multiline_field_document) do
        <<~EOD
            Field1 <<EOF
                Hello
                world
            EOF
            Field2 Hello
            Field3 world
        EOD
    end

    let (:singleline_multiline_field_document) do
        <<~EOS
            Field1 <<EOF
                Just one line here
            EOF
        EOS
    end

    it 'parses a single-line document' do
        document = SOML::Document.parse(singleline_document)
        expect(document.to_s).to eq(singleline_document.chomp)
    end

    it 'parses a multi-line document' do
        document = SOML::Document.parse(multiline_document)
        expect(document.to_s).to eq(multiline_document.chomp)
    end

    it 'parse a multi-line field' do
        document = SOML::Document.parse(multiline_field_document)

        expect(document.to_s).to eq(multiline_field_document.chomp)
        expect(document[0].value).to eq("Hello\nworld")
        expect(document[1].value).to eq('Hello')
        expect(document[2].value).to eq('world')
    end

    it 'parses comments' do
        document = SOML::Document.parse('#Field')
        expect(document.to_s).to be_empty
    end

    it 'converts a single-line multi-line field into a single-line field' do
        document = SOML::Document.parse(singleline_multiline_field_document)
        expect(document.first.value).to eq('Just one line here')
    end

    it 'lets you add fields to a document' do
        document = SOML::Document.new
        document.add('Field1', '123')
        expect(document.first.value).to eq('123')
    end
end
