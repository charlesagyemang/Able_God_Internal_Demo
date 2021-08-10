const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

export default environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)