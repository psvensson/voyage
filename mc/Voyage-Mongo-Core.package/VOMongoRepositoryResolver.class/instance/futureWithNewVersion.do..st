private persistence
futureWithNewVersion: aFuture do: aBlock
	| newVersion |
	
	newVersion := self newVersion.
	aBlock 
		value: aFuture futureId 
		value: aFuture realObject 
		value: (aFuture serialized 
			at: VOMongoSerializer fieldVersion put: newVersion;
			yourself).
		
	self cacheAt: aFuture futureId put: aFuture realObject.
	self cacheAt: aFuture futureId putVersion: newVersion.