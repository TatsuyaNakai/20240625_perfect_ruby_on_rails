// webpackerが設定している内容を読み込みます
const { environment } = require('@rails/webpacker')

// rails-erb-loaderの設定を読み込みます
const erb = require('./loaders/erb')

// jQueryの設定を読み込みます
const provide = require('./plugin/provide')

// environment.loadersの配列に設定を追加します
environment.loaders.prepend('erb', erb)

// environment.pluginsの配列に設定を追加します
environment.plugins.prepend('provide', provide)

module.exports = environment
