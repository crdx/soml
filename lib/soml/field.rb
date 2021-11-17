module SOML
    class Field
        attr_reader :name
        attr_reader :value

        def initialize(name, value)
            @name = name
            @value = value
        end

        def to_s
            if multi_line?
                to_multi_line
            else
                to_single_line
            end
        end

        private

        def multi_line?
            @value.to_s.include?("\n")
        end

        def to_single_line
            '%s %s' % [@name, @value]
        end

        def to_multi_line
            template = <<~EOT
                %s <<EOF
                %s
                EOF
            EOT
            template.chomp % [@name, Util.indent(@value)]
        end
    end
end
