# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{globalize2}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Fuchs, Joshua Harvey, Clemens Kofler, John-Paul Bader"]
  s.date = %q{2011-05-09}
  s.description = %q{Rails I18n: de-facto standard library for ActiveRecord data translation}
  s.email = %q{joshmh@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.textile"
  ]
  s.files = [
    "Gemfile",
    "LICENSE",
    "README.textile",
    "Rakefile",
    "VERSION",
    "generators/db_backend.rb",
    "generators/templates/db_backend_migration.rb",
    "globalize2.gemspec",
    "init.rb",
    "lib/globalize.rb",
    "lib/globalize/active_record.rb",
    "lib/globalize/active_record/adapter.rb",
    "lib/globalize/active_record/attributes.rb",
    "lib/globalize/active_record/migration.rb",
    "lib/i18n/missing_translations_log_handler.rb",
    "lib/i18n/missing_translations_raise_handler.rb",
    "test/active_record/fallbacks_test.rb",
    "test/active_record/locale_specific_attributes_test.rb",
    "test/active_record/migration_test.rb",
    "test/active_record/sti_translated_test.rb",
    "test/active_record/translates_test.rb",
    "test/active_record/translation_class_test.rb",
    "test/active_record/validation_tests.rb",
    "test/active_record_test.rb",
    "test/all.rb",
    "test/data/models.rb",
    "test/data/no_globalize_schema.rb",
    "test/data/schema.rb",
    "test/i18n/missing_translations_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/joshmh/globalize2}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Rails I18n: de-facto standard library for ActiveRecord data translation}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<globalize2>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<globalize2>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<globalize2>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

