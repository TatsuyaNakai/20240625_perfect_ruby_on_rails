const { environment } = require('@rails/webpacker')
const provide = require('./plugin/provide')

environment.plugins.prepend('Provide', provide)

module.exports = environment
