class BaseScraper
	constructor: (@db) ->
		
	run: () ->
		@currentRunTime = new Date().now
		console.log("called base run.")
	#Returns the current running time of this instance, returns null if not running
	
	runTime: () ->
	
	isRunning: () -> 
		return @runTime!==null
		
		