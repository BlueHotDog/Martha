vows = require('vows')
assert = require('assert')
Martha = require('../lib/martha.coffee').martha

# mcaros
filesAreLoaded = (files, fileName)->
  assert.isNotNull(files)
  assert.isNotZero(files.size)
  assert.include(files, fileName)


vows.describe('Martha')
.addBatch(

  'when Martha is good - ':
    topic: ->
      return new Martha('scraper_fixtures/')

    'when loading scrapers from files':
      topic: (marty)->
        return marty.loadScarpersFromDir()

      'it should have files loaded': (files)-> assert.isNotNull(files)

      'should load one scarper from file': (files)-> assert.isNotZero(files.size)

      'it should have one file named blah': (files)-> assert.include(files, 'blah')

    'when trying to init a new market from scraper':
      topic: (marty)->
        return marty.loadScarpersFromDir(@callback)

      'it should have files loaded (test all)': (files)-> filesAreLoaded(files, 'blah')


).addBatch(

  'when Martha is bad - ':
    'when the the path is invalid':
      topic: ->
        createBadMarty = -> new Martha('invalid_paths/', this.callback)

      'it should throw an error': (createBadMarty)->
        assert.throws(createBadMarty(),Object)

)
.export(module)
