class Tasky.Views.Task extends Backbone.View
	template: JST['tasks/task']
	tagName: 'li'
	className: 'list-group-item'

	events:
		'click :checkbox': 'toggleCompleted'
		'click .destroy': 'remove'
		
	initialize: ->
		@model.on('remove', @render, this)

	render: ->
		$(@el).html(@template(task: @model))
		@isCompleted()
		this
		
	toggleCompleted: ->
		@model.toggleCompleted()
		@$('input').parent().toggleClass('completed')
		
	isCompleted: ->
		if @model.get('completed')
			@$('input').parent().addClass('completed')
			
	remove: ->
		@model.destroy()
		@remove()