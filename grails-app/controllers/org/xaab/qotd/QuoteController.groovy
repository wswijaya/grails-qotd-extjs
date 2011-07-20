package org.xaab.qotd

import grails.plugins.springsecurity.Secured

class QuoteController {

	def scaffold = true
	
	def quoteService
	
	def random = {
//		def staticAuthor = "Anonymous"
//		def staticContent = "Real Programmers do not eat much quiche"
//		[ author: staticAuthor, content: staticContent ]
		
		def randomQuote = quoteService.getRandomQuote()
		[quote: randomQuote]
	}
	
	def ajaxRandom = {
		def randomQuote = quoteService.getRandomQuote()
		render "<q>${randomQuote.content}</q><p>${randomQuote.author}</p>"
	}
}
