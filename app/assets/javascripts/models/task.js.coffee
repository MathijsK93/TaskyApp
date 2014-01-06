class Tasky.Models.Task extends Backbone.Model
	
	defaults:
		name: '',
		completed: false
	
	toggleCompleted: ->
		@save
			completed: !@get('completed')
