# -*- encoding: utf-8 -*-
# stub: beautiful-jekyll-theme 6.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "beautiful-jekyll-theme".freeze
  s.version = "6.0.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://beautifuljekyll.com/updates/", "documentation_uri" => "https://github.com/daattali/beautiful-jekyll#readme" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dean Attali".freeze]
  s.date = "2023-06-08"
  s.email = ["daattali@gmail.com".freeze]
  s.homepage = "https://beautifuljekyll.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Beautiful Jekyll is a ready-to-use Jekyll theme to help you create an awesome website quickly. Perfect for personal blogs or simple project websites, with a focus on responsive and clean design.".freeze

  s.installed_by_version = "3.7.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.9.3".freeze])
  s.add_runtime_dependency(%q<jekyll-paginate>.freeze, ["~> 1.1".freeze])
  s.add_runtime_dependency(%q<jekyll-sitemap>.freeze, ["~> 1.4".freeze])
  s.add_runtime_dependency(%q<kramdown-parser-gfm>.freeze, ["~> 1.1".freeze])
  s.add_runtime_dependency(%q<kramdown>.freeze, ["~> 2.3.2".freeze])
  s.add_runtime_dependency(%q<webrick>.freeze, ["~> 1.8".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.16".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze])
end
