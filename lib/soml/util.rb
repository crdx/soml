module SOML
    class Util
        def self.dedent(str)
            indentation_level = str.lines.map { _1[/^\s*/].length }.min
            return str if indentation_level == 0

            return str.lines.map { _1[indentation_level..] }.join
        end

        def self.indent(str, level: 4)
            str.lines.map { ' ' * level + _1 }.join
        end
    end
end
