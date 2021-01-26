extends Node2D

func _ready():
	var data = $FirstSprite.texture.get_data()
	# it's generated using threads and you may need to wait
	if data == null:
		yield($FirstSprite.texture, "changed")
		data = $FirstSprite.texture.get_data()
	print(data)
	var img = Image.new()
	var itex = ImageTexture.new()
	itex.create_from_image(data)
	
	# these flags aren't saved as part of data.
	# if you want to set them, you need to do so manually
	itex.flags = itex.FLAG_CONVERT_TO_LINEAR
	$SecondSprite.texture = itex
