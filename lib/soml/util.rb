module SOML
    class Util
        def self.dedent(str)
            indentation_level = str.lines.map { |line| line[/^\s*/].length }.min
            return str if indentation_level == 0
            return str.lines.map { |line| line[indentation_level..-1] }.join    
        end

        def self.indent(str, level: 4)
            str.lines.map { |line| ' ' * level + line }.join
        end
    end
end
