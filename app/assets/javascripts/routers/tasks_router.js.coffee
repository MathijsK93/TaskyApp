class Tasky.Routers.Tasks extends Backbone.Router

	routes:
		'' : 'index'
		'tasks/:id' : 'show'
		
	initialize: ->
		@collection = new Tasky.Collections.Tasks()
		@collection.fetch()
		
	index: ->
		view = new Tasky.Views.TasksIndex(collection: @collection)
		$('.tasks-container').html(view.render().el)
		
	show: (id) ->
		alert "Task #{id}"