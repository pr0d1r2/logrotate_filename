require File.dirname(__FILE__) + '/spec_helper.rb'

describe Logrotate::Filename do
  VALID = { :uncompressed => "/var/log/messages.1",
            :gz           => "/var/log/messages.1.gz",
            :bz2          => "/var/log/messages.1.bz2",
            :lzma         => "/var/log/messages.1.lzma" }
  
  INVALID = { :uncompressed => "/var/log/messages",
              :gz           => "/var/log/messages.gz",
              :bz2          => "/var/log/messages.bz2",
              :lzma         => "/var/log/messages.lzma" }

  context "new" do
    it "should act as string" do
      x = Logrotate::Filename.new(VALID.values.first)
      x.should == VALID.values.first
    end

    context "should raise if filename has no basename" do
      it "" do      
        lambda {
          Logrotate::Filename.new(".1")
        }.should raise_error(Logrotate::InvalidFilenameError)
      end
      
      it "(with path)" do
        lambda {
          Logrotate::Filename.new("/var/log/.1")
        }.should raise_error(Logrotate::InvalidFilenameError)
      end
    end

    context "should raise if filename is invalid" do
      INVALID.each_pair do |k,v|
        it k.to_s do
          lambda {
            Logrotate::Filename.new(v)
          }.should raise_error(Logrotate::InvalidFilenameError)
        end
      end
    end

    context "should support filenames" do
      VALID.each_pair do |k,v|
        it k.to_s do
          lambda {
            Logrotate::Filename.new(v)
          }.should_not raise_error(Logrotate::InvalidFilenameError)
        end
      end
    end

    it "should raise if point of reference is not Time" do
      lambda {
        Logrotate::Filename.new(VALID.values.first, "")
      }.should raise_error(Logrotate::InvalidPointOfReferenceError)
    end
  end
  
  context "dated" do
    context "should support filenames compressed with" do
      VALID.each_pair do |k,v|
        next if k == :uncompressed
        it k.to_s do
          x = Logrotate::Filename.new(v)
          x.dated.should =~ Regexp.new("\\.#{k}$")
        end
      end
    end
  end
end
