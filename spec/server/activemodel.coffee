activemodel= require( "../../server/activemodel" ).ActiveModel
chai = require "chai"
should = chai.should()

describe "activemodel", ->
	describe "sanity check", ->
		it "should not be null", ->
			activemodel.should.not.equal null
		# it
		it "should have count", ->
			activemodel.count.should.equal 0
		# it
		describe "redis-db", ->
			beforeEach (done) ->
				@cat_data = { fur : "black" , legs : 4 }
				@cat = new activemodel @cat_data
				@cat.save done
			# beforeEach
			it "should create a new model", ->
				@cat.get( "fur" ).should.equal "black" 
				@cat.get( "legs" ).should.equal 4
			# it
			it "should serialize properly", ->
				JSON.stringify( @cat ).should.equal( JSON.stringify @cat_data )
			# it
			it "should reload", (done) ->
				@cat.reload done
			# it
			it "should allow for updates", (done) ->
				@cat.update
					fur : "brown"
				, (err, obj) =>
					@cat.get( "fur" ).should.equal "brown"
					@cat.get( "legs" ).should.equal 4
					done err
				# update
			# it
			afterEach (done) ->
				@cat.destroy done
			# afterEach
		# redis-db
	# sanity check
# activemodel
