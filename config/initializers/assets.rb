Rails.configuration.assets.paths += [
  Rails.root.join('app/assets/images'),
  Rails.root.join('app/assets/builds')
]

Rails.configuration.assets.excluded_paths += [
  ActionText::Engine.root.join('app/assets/javascripts'),
  ActionView::Railtie.root.join('lib/assets/compiled')
]
