extends Node2D

# Caminho das texturas/imagens.
var visual = {
	"chapeu" : [
	"res://imagens/hats/bone.png",
	"res://imagens/hats/chapeu.png",
	"res://imagens/hats/cone.png",
	"res://imagens/hats/peaky.png",
	],
	"cor" : [
		"res://imagens/color/brown.png",
		"res://imagens/color/cream.png",
		"res://imagens/color/pink.png",
		"res://imagens/color/white.png"
	]
	}

# Índice, nas listas, das texturas.
var hat = 0
var cor = 0

# Imagem e caminho onde será gravada.
var img
var imgname

# Som do botão.
func tocarSom():
	$audio.play()
	pass

# warning-ignore:unused_argument
func _process(delta):
	# Coloca a textura no sprite do chapeu e da cor
	$ViewportContainer/Viewport/hatFoto.texture = load(visual["chapeu"][hat])
	$ViewportContainer/Viewport/corFoto.texture = load(visual["cor"][cor])
	
	$hat.texture = load(visual["chapeu"][hat])
	$cor.texture = load(visual["cor"][cor])
	
	# Desativa o botão caso o hat seja 0
	if hat == 0:
		$ViewportContainer/Viewport/hatLeft.disabled = true
	else:
		$ViewportContainer/Viewport/hatLeft.disabled = false
	# Desativa o botão caso o hat seja 0
	if hat == 3:
		$ViewportContainer/Viewport/hatRight.disabled = true
	else:
		$ViewportContainer/Viewport/hatRight.disabled = false
	# Desativa o botão caso o hat seja 0
	if cor == 3:
		$ViewportContainer/Viewport/colorRight.disabled = true
	else:
		$ViewportContainer/Viewport/colorRight.disabled = false
	# Desativa o botão caso o hat seja 0
	if cor == 0:
		$ViewportContainer/Viewport/colorLeft.disabled = true
	else:
		$ViewportContainer/Viewport/colorLeft.disabled = false
	
	# atualiza img
	img = $ViewportContainer/Viewport.get_texture().get_data()
	pass

# Adiciona +1 a variavel, ao pressionar o botão
func _on_hatRight_pressed():
	hat += 1
	tocarSom()
	pass
func _on_hatLeft_pressed():
	hat -= 1
	tocarSom()
	pass
func _on_colorLeft_pressed():
	cor -= 1
	tocarSom()
	pass
func _on_colorRight_pressed():
	cor += 1
	tocarSom()
	pass

# Parte que salva a imagem no dispositivo
func _ready():
# warning-ignore:return_value_discarded
	OS.request_permissions()
	pass
func _on_done_pressed():
	var file = File.new()
	img.flip_y()
	imgname = OS.get_system_dir(3)+"/nft"
	while true:
		if file.file_exists(imgname+".png"):
			imgname += "1"
			continue
		else:
			var erro = img.save_png(imgname+".png")
			if erro == OK:
				img.save_png(imgname+".png")
				OS.alert("Sua NFT foi salva! :D \n\nCaso não ache na galeria, vá até: "+OS.get_system_dir(3), "IMAGEM SALVA!")
			else:
				OS.alert("Hmm, parece que faltam algumas permissões para o APP!", "ERRO")
			break
	pass
