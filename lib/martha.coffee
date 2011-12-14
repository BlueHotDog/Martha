mongoose = require('mongoose')
fs = require('fs')
_ = require('underscore')

class Martha
  constructor: (@scarper_dir = 'scrapers/') ->
    @scrapers = {}
    #@_initDB()
  
  fetch: () ->		
    _.each(@scrapers, (scarper) => 
      scarper.on('new_product', (market_name, product) => @_insertProduct(market_name, product)
      )
    )
  	
  _insertProduct:(market_name, product) ->
    @model.findOne({name: market_name}, (err, market) => market.products.push(product) market.save() )
  
  _scraperDone: (market_name) ->
    @scrapers[market_name].done = true
    if _(@scrapers).all((scraper) -> scraper.done)
      console.log('DONE')
  
  _initDB: () ->
	  #todo: get the connection from config
    mongoose.connect("mongodb://root:hello@ds029187.mongolab.com:29187/martha")
    product = new mongoose.Schema(
      sku: String
      name: String
      created_at: Date
      price: Number
    )
  
    market = new mongoose.Schema(
      name: String
      products: [product]
    )
  
    @model = mongoose.model('market', market)    
  
  loadScrapers: () ->
    files = @loadScarapers()
    @_initScrapers(files)

  loadScarpersFromDir: () ->
    #todo: handle non coffee script files?
    fs.readdirSync(@scarper_dir)

  _initScrapers: (files) ->
    @_initScraper(@scarper_dir+file) for file in files

  _initScraper: (location) ->
    scraper = require(location)
    @scrapers[scraper.name] = scraper

    @_initMarket(scraper.name)

    scraper.done = false
    scraper.on('new_product', (market_name, product) => @_insertProduct(market_name, product))
    scraper.on('done', (market_name) => @_scraperDone(market_name))

  _initMarket: (name) ->
    market = @model.findOne({name: name}, (err, doc) =>
      if !doc
        m = new @model({name: name})
        m.save()
    )

exports.martha = Martha