class Tasky.Views.TasksIndex extends Backbone.View
	template: JST['tasks/index']
	
	events:
		'submit #new_task' : 'createTask'
	
	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('remove', @render, this)
		@collection.on('add', @appendTask, this)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendTask)
		this
		
	appendTask: (task) =>
		view = new Tasky.Views.Task(model: task)
		@$('#tasks').append(view.render().el)
		
	createTask: (event) ->
		event.preventDefault()
		attributes = name: $('#new_task_name').val()
		@collection.create attributes,
			wait: true
			success: -> $('#new_task')[0].reset()