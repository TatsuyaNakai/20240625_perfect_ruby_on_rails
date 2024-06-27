process.env.NODE_ENV = process.env.NODE_ENV || 'development'

// Webpackerで設定された、初期の設定から加えて読み込んだ設定オブジェクトを読み込みます。
const environment = require('./environment')

module.exports = environment.toWebpackConfig()
