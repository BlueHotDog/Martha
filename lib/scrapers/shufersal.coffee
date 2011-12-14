emitter = require('events').EventEmitter

class ShufersalScraper extends emitter
	constructor: (@db) ->
		@superName = "Shufersal"
		super(@db)

	fetch: () ->

		#mucho logic goes here :-\
