class Tasky.Views.Task extends Backbone.View
	template: JST['tasks/task']
	tagName: 'li'

	initialize: ->
		# alert 'hi'
		@model.on('change', @render, this)

	render: ->
		$(@el).html(@template(task: @model))
		this