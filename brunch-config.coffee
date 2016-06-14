# Common configs
postCssProcessors = [
  require('postcss-import')(
    root: '.'
    path: [
      './css'
      './node_modules'
    ]
  )
  require 'postcss-normalize'
  require 'autoprefixer'
]

# Main config object
module.exports =

  paths:
    public: './public'
    watched: [
      './css'
    ]

  files:
    stylesheets:
      joinTo:
        'style.css': /style\.css/

  plugins:
    postcss:
      processors: postCssProcessors

  overrides:
    production:
      sourceMaps: false
      plugins:
        postcss:
          processors: [
            postCssProcessors...
            require('cssnano')(
              safe: true
              autoprefixer: false
            )
          ]
