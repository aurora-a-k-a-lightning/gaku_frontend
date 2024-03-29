require_relative 'common_gaku_gemspec_mixin'

Gem::Specification.new do |s|
  set_gaku_gemspec_shared s

  s.name          = 'gaku_frontend'
  s.summary       = 'GAKU Engine Frontend module'
  s.description   = 'Frontend functionality for GAKU Engine. See https://github.com/GAKUEngine/gaku'

  s.files         = Dir.glob("{app,config,db,lib}/**/*") +
                    [
                      'Rakefile',
                      'gaku_api.gemspec'
                    ]

  s.add_dependency 'simple_command'
  s.add_dependency 'jwt'
  s.add_dependency 'active_model_serializers'
  s.add_dependency 'msgpack_rails'
  s.add_dependency 'kaminari'

  s.add_dependency 'gaku_core', s.version

  s.add_development_dependency 'gaku_testing', s.version
end
