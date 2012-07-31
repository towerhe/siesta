module Siesta
  class TestSuite
    class Group
      include ::Virtus

      attribute :path, String
      attribute :suite, TestSuite

      def name
        @name ||= path.gsub(suite.path, '')

        @name.blank? ? 'global' : @name
      end

      def items
        @items ||= Dir.glob(File.join(path, '*.t.js')).inject([]) do |c, f|
          c << Item.new(path: f, group: self, suite: suite) unless File.directory?(f)
          
          c
        end        
      end
    end

    class Item
      include ::Virtus

      attribute :path, String
      attribute :group, Group
      attribute :suite, TestSuite

      def url
        @url ||= File.join('/assets', path.gsub(suite.path, ''))
      end
    end

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def groups
      @groups ||= Dir.glob(File.join(path, '**', '*')).inject([]) do |c, f|
        c << Group.new(path: f, suite: self) if File.directory?(f)

        c
      end

      @groups << Group.new(path: path, suite: self)
    end
  end
end
