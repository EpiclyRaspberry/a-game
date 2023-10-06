extends TextEdit

func logconsole(thing):
	print(thing)
	text += "{str}\n".format({"str": thing})
