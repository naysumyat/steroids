steroids = require "../../../steroids"
spawn = require("child_process").spawn
path = require "path"
fs = require "fs"
ejs = require "ejs"
util = require "util"

Base = require "../Base"

examples =
  "accelerometer": require("./Examples/accelerometer")
  "animation": require("./Examples/animation")
  "camera": require("./Examples/camera")
  "compass": require("./Examples/compass")
  "device": require("./Examples/device")
  "drawer": require("./Examples/drawer")
  "drumMachine": require("./Examples/drumMachine")
  "geolocation": require("./Examples/geolocation")
  "layerStack": require("./Examples/layerStack")
  "media": require("./Examples/media")
  "modal": require("./Examples/modal")
  "notification": require("./Examples/notification")
  "navigationBar": require("./Examples/navigationBar")
  "photoGallery": require("./Examples/photoGallery")
  "preload": require("./Examples/preload")
  "storage": require("./Examples/storage")

class Example extends Base
  @usageParams: ->
    "<exampleName>"

  @usage: ()->
    """
    Generates an example demonstrating a Steroids feature.

    Options:
      - exampleName: name of the example to generate.  
        
        Available Steroids examples:
        - animation -- Using native animations without moving to another document.
        - drawer -- Using the native Facebook-style drawer.
        - drumMachine -- Demonstrate Steroids Audio API via a kicking drum machine.
        - layerStack -- Native navigation, page transitions and backstack handling.
        - modal -- Using the modal window.
        - navigationBar -- Using the native navigation bar.
        - preload -- Preload WebViews to have them available immediately.
        
        Available Cordova examples:
        - accelerometer -- Access the device's accelerometer.
        - camera -- Access the device's camera and photo library.
        - compass -- Access the device's compass.
        - device -- Access the device properties.
        - geolocation -- Access the device's geolocation data.
        - photoGallery -- Use the Camera and File APIs and Steroids native windowing
                          to create a one-picture photo gallery.
        - media -- Play back audio files through Cordova's Media API.
        - storage -- Use Cordova's SQL Storage API.
    """

  generate: ->

    ExampleClass = examples[@options.name]

    unless ExampleClass
      console.log "Error: No such example #{@options.name}, see 'steroids generate' for help."
      process.exit(1)

    example = new ExampleClass @options
    example.generate()

module.exports = Example
