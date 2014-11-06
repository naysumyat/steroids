path = require "path"
pathExtra = require "path-extra"

pathExtra.tempdir()

class Paths

  @npm: path.join __dirname, "..", ".."
  @applicationDir: process.cwd()
  @steroids: path.join @npm, "bin", "steroids"

  @globalPrefix: (cb) ->
    npm =  require "npm"
    npm.load {}, ->
      cb(path.join npm.globalPrefix)

  @bower: path.join @npm, "node_modules", "bower", "bin", "bower"

  @steroidsGenerator: path.join @npm, "node_modules", "generator-steroids", "generators", "app"

  @staticFiles: path.join @npm, "public"
  @connectStaticFiles: path.join @npm, "node_modules", "steroids-connect"
  @appgyverStaticFiles: path.join @staticFiles, "__appgyver"
  @oauthSuccessHTML: path.join @appgyverStaticFiles, "login", "oauth2_success.html"

  @scriptsDir: path.join @npm, "support", "scripts"

  @bannersDir: path.join @npm, "support"
  @banners:
    logo: path.join @bannersDir, "logo"
    connect: path.join @bannersDir, "connect"
    attention: path.join @bannersDir, "attention"
    SUCCESS: path.join @bannersDir, "success-caps"
    error: path.join @bannersDir, "error"
    awesome: path.join @bannersDir, "awesome"
    usage:
      compact: path.join @bannersDir, "usage", "compact"
      extended: path.join @bannersDir, "usage", "extended"
      footer: path.join @bannersDir, "usage", "footer"
      emulate: path.join @bannersDir, "usage", "emulate"
      debug: path.join @bannersDir, "usage", "debug"
    ready: path.join @bannersDir, "ready"
    resetiOSSim: path.join @bannersDir, "iossim-reset"
    newVersionAvailable: path.join @bannersDir, "new-version-available"
    newClientVersionAvailable: path.join @bannersDir, "new-client-version-available"
    deployCompleted: path.join @bannersDir, "deploy-completed"
    loggedOut: path.join @bannersDir, "loggedout"
    loggedIn: path.join @bannersDir, "loggedin"
    safariListingHeader: path.join @bannersDir, "safari-listing-header"
    dataUsage: path.join @bannersDir, "data-usage"
    legacy:
      requiresDetected: path.join @bannersDir, "legacy-requiresdetected"
      capitalizationDetected: path.join @bannersDir, "legacy-capitalizationdetected"
      specificSteroidsJSDetected: path.join @bannersDir, "legacy-specificsteroidsjsdetected"
      simulatorType: path.join @bannersDir, "legacy-simulatortype"
      serve: path.join @bannersDir, "legacy-serve"
      debugweinre: path.join @bannersDir, "legacy-debugweinre"

  @application:
    appDir: path.join @applicationDir, "app"
    configDir: path.join @applicationDir, "config"
    distDir: path.join @applicationDir, "dist"
    wwwDir: path.join @applicationDir, "www"
    nodeModulesDir: path.join @applicationDir, "node_modules"
    bowerComponentsDir: path.join @applicationDir, "bower_components"
    logDir: path.join @applicationDir, "logs"
    logFile: path.join @applicationDir, "logs", "steroids.log"

  @application.dist =
    configIosXml: path.join @application.distDir, "config.ios.xml"

  @application.configs =
    application: path.join @application.configDir, "application.coffee"
    cloud: path.join @application.configDir, "cloud.json"
    bower: path.join @applicationDir, "bower.json"
    configIosXml: path.join @application.wwwDir, "config.ios.xml"
    configAndroidXml: path.join @application.wwwDir, "config.android.xml"
    packageJson: path.join @applicationDir, "package.json"
    appgyverSettings: path.join @application.distDir, "__appgyver_settings.json"
    app: path.join @application.configDir, "app.coffee"
    structure: path.join @application.configDir, "structure.coffee"
    data:
      sandboxdb: path.join @application.configDir, "sandboxdb.yaml"
      raml: path.join @application.configDir, "cloud.raml"
    legacy:
      bower: path.join @application.configDir, "bower.json"

  @application.sources =
    controllerDir: path.join @application.appDir, "controllers"
    controllers: path.join @application.appDir, "controllers", "**", "*"
    modelDir: path.join @application.appDir, "models"
    models: path.join @application.appDir, "models", "**", "*"
    viewDir: path.join @application.appDir, "views"
    views: path.join @application.appDir, "views", "**", "*"
    layoutDir: path.join @application.appDir, "views", "layouts"
    staticDir: path.join @applicationDir, "www"
    statics: path.join @applicationDir, "www", "**", "*"

  @application.compiles =
    coffeescripts: path.join @application.distDir, "**", "*.coffee"
    sassfiles: path.join @application.distDir, "**", "*.sass"
    scssfiles: path.join @application.distDir, "**", "*.scss"
    models: path.join @application.distDir, "models", "**", "*"

  @application.compileProducts =
    models: path.join @application.distDir, "models", "models.js"

  @temporaryZip: path.join pathExtra.tempdir(), "steroids_project.zip"
  @vendor: path.join @npm, "vendor"

  @userHome: if process.platform == 'win32' then process.env.USERPROFILE else process.env.HOME
  @storedSettings: path.join @userHome, ".appgyver"
  @oauthTokenPath: path.join @storedSettings, "token.json"

  @rippleBinary: path.join @npm, "node_modules", "ripple-emulator", "bin", "ripple"

  @test:
    basePath: path.join @applicationDir, "test"
    unitTestPath: path.join @applicationDir, "test", "unit"
    functionalTestPath: path.join @applicationDir, "test", "functional"

  @iosSim =
    path: path.join @npm, "node_modules", "ios-sim", "bin", "ios-sim"
  @chromeCli =
    path: path.join @npm, "node_modules", "chrome-cli", "bin", "chrome-cli"

  @emulate:
    android:
      default: path.join @npm, "node_modules", "steroids-android-packages", "builds", "application.apk"
      debug: path.join @npm, "node_modules", "steroids-android-packages", "builds", "debug.apk"

module.exports = Paths
