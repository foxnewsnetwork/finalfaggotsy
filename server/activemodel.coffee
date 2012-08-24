# The root model file all the other models must inherit
backbone = require 'backbone'

this.ActiveModel = class ActiveModel extends backbone.Model
	@client : require("redis").createClient() ,
	@count : 0 ,	
	@attr_accessible : (attributes...) ->
		((a) =>
			this.set a, null
		)(attribute) for attribute in attributes		
	, # attr_accessible
	
	initialize : (data) ->
		this.set data
	, # initialize
	
	reload : (done) ->
		if !@id?
			return done()
		ActiveModel.client.hgetall @id, (err, obj) =>
			if !err?
				this.set obj
			else
			# if no error
			done err, obj
		# hgetall
	, # reload
	
	save : (done) ->
		if !@id?
			@id = "am#{ActiveModel.count}"
			ActiveModel.count += 1
		# if
		ActiveModel.client.HMSET( @id, this.attributes , done )
	, # save
	
	update : (data, done) ->
		if !@id?
			return null
		else
			this.set data
			this.save done
		# if-else
	, # update
	
	destroy : (done) ->
		if !@id?
			return done()
		else
			ActiveModel.client.del @id, done
		# if-else
	, # destroy
# backbone model


