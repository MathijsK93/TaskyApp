window.Tasky =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		new Tasky.Routers.Tasks()
		Backbone.history.start(pushState: true)

$(document).ready ->
	Tasky.initialize()
