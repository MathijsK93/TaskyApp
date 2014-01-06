class Tasky.Views.TasksIndex extends Backbone.View
	template: JST['tasks/index']
	
	events:
		'submit #new_task' : 'createTask'
	
	initialize: ->
		@collection.on('reset', @render, this)

	render: ->
		$(@el).html(@template(tasks: @collection))
		this
		
	createTask: (event) ->
		event.preventDefault()
		@collection.create name: $('#new_task_name').val()