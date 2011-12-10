class Martha
	constructor: () ->
		@scrapers = _initScrapers()
	fetch: () ->
		for scraper in @scrapers do
			
			#should init a db helper class for the specific site
			#so we can do something like 
	initDB: () ->
		
	_initScrapers: () ->
		#the scrapers should be run in an asynchronious fashion, so we need to hold a refernce
		#here, we should init the scrapers and pass them some db-access helper, each helper should be site-specific
		#so that the scrapers can just do something like @db.append(@productData)
