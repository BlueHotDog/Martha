vows = require('vows')
assert = require('assert')
Martha = require('../lib/martha.coffee').martha

vows.describe('Martha')
	.addBatch(		
		'describe Martha': 
			topic: ->
				return new Martha('tests/scraper_fixtures/')

			'describe loading scrapers from files': 
				topic: (marty)-> 
					return marty.loadScarpersFromDir()	
										
				'it should have files loaded': (files)-> assert.isNotNull(files)	
														
				'should load one scarper from file': (files)-> assert.equal(files.length, 1)	
														
				'it should have one file named blah': (files)-> assert.equal(files[0], 'blah')										
			#'should init a new market from scarper': (martha) ->
).run()