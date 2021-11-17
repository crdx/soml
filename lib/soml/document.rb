module SOML
    class Document
        include Enumerable

        def initialize(fields = [])
            @fields = fields
        end

        def each(&block)
            @fields.each(&block)
        end

        def [](i)
            @fields[i]
        end

        def to_s
            @fields.join("\n")
        end

        def add(name, value)
            @fields << Field.new(name, value)
        end

        def self.parse(soml)
            in_field = false
            state = Struct.new(:key, :value, :fields, :delim).new(nil, [], [], nil)

            soml.lines.map(&:chomp).each do |line|
                if in_field && line == state.delim
                    state.fields << Field.new(state.key, Util.dedent(state.value.join("\n")))
                    in_field = false
                elsif in_field
                    state.value << line
                else
                    next if line.strip[0] == '#'

                    state.key, value = line.strip.split(' ', 2)
                    if value =~ /<<(.*)/
                        in_field = true
                        state.value = []
                        state.delim = $1
                    else
                        state.fields << Field.new(state.key, value)
                    end
                end
            end

            Document.new(state.fields)
        end
    end
end
