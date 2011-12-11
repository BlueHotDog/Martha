zombie = require("zombie")
browser = new zombie.Browser(
	userAgent:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.2 Safari/535.11"
	debug: true
	runScripts: true
)

browser.visit("http://www.shufersal.co.il/yashir/navigate_mall.asp", (e, browser, status) ->
	doc = browser.document
	browser.fire("DOMContentLoaded", doc, (err, browser, status) ->
		console.log browser.html()
		browser.evaluate("test()")
		console.log browser.html()
		setTimeout(->console.log browser.html(),6000)
	)
)