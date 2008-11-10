$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module LogrotateFilename
  VERSION = '0.1.0'
end

class Time
  def day_string
    year.to_s + mon_formatted + day_formatted
  end
  
  def mon_formatted
    mon.to_s.size == 2 ? mon.to_s : "0" + mon.to_s
  end
  alias :month_formatted :mon_formatted
          
  def day_formatted
    day.to_s.size == 2 ? day.to_s : "0" + day.to_s
  end
  
  def day_offset(o)
    self - o * 86400
  end
end

module Logrotate
  class Filename < String
    COMPRESS_TYPES = [ :gz, :bz2, :lzma ]

    def initialize(str, point_of_reference = Time.now)
      raise Logrotate::InvalidPointOfReferenceError unless point_of_reference.is_a?(Time)
      super(str)      
      @point_of_reference = point_of_reference
      raise Logrotate::InvalidFilenameError unless valid?
    end
    
    def dated
      path + "/" + dated_filename
    end
    
    private

      def valid?
        filename =~ Regexp.new(".\\.(\\d|\\d+\\.(#{COMPRESS_TYPES.join("|")}))$") 
      end
      
      def compress_type
        COMPRESS_TYPES.each do |ct|
          return ct if filename =~ Regexp.new("\\.#{ct}$")
        end
        nil
      end
      
      def compress
        compress_type ? "."+compress_type.to_s : ""
      end
            
      def number
        filename.split(".")[number_location].to_i
      end
      
      def basename
        filename.split(".")[0..number_location-1].join(".")
      end

      def dated_filename
        basename + "." + @point_of_reference.day_offset(number).day_string + compress
      end

      def filename
        File.basename(self)
      end
      
      def path
        File.dirname(self)
      end
      
      def number_location
        compress_type ? -2 : -1
      end
  end
  
  class InvalidFilenameError < StandardError
  end

  class InvalidPointOfReferenceError < StandardError
  end
end
