Gem::Specification.new do |s|
  s.name = %q{logrotate_filename}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcin Nowicki"]
  s.date = %q{2008-11-10}
  s.description = %q{Ruby class to manipulate logrotate file names}
  s.email = ["pr0d1r2@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README", "README.rdoc", "Rakefile", "lib/logrotate_filename.rb", "script/console", "script/destroy", "script/generate", "spec/logrotate_filename_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Pr0d1r2/logrotate_filename/tree/master}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{logrotate_filename}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Ruby class to manipulate logrotate file names}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<newgem>, [">= 1.0.7"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.0.7"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.0.7"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
