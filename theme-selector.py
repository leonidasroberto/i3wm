import os
import sys

# background -> cor fonte i3blocks
# foreground -> cor aba ativa 
# color1 -> cor preenchimento indicador de desktop ativo 
# color2 -> background i3blocks
# color3 -> cor font inativa i3blocks ind. desktop / aba inativa
# color4 -> cor indicador resize / ugencia
# color5 -> cor borda indicador ativa desktop 
# color6 -> cor fonte aba ativa
# color7 -> cor fonte indicador desktop ativo
# color8 -> cor separador i3blocks

try:
	themeselect = sys.argv[1]
except:
	print("Nenhum tema informado!")
	exit()

localConfig="~/.config/i3/config"

themes = {
		"schemes": [
        	{"name":"theme1", "scheme": [
				{"name":"background", "value":"#F8F8F2"},
            	{"name":"foreground", "value":"#FFFFFF"}, 
	           	{"name":"color1", "value":"#44475A"},  
            	{"name":"color2", "value":"#282A36"}, 
            	{"name":"color3", "value":"#BFBFBF"}, 
            	{"name":"color4", "value":"#FF5555"}, 
				{"name":"color5", "value":"#FFFFFF"}, 
           	 	{"name":"color6", "value":"#000000"},
				{"name":"color7", "value":"#FFFFFF"},
            	{"name":"color8", "value":"#FFFFFF"} 
        	]},
        	{"name":"theme2", "scheme": [
            	{"name":"background", "value":"#FFFFFF"},
            	{"name":"foreground", "value":"#ffd60a"},
            	{"name":"color1", "value":"#ffc300"},
            	{"name":"color2", "value":"#001d3d"},
            	{"name":"color3", "value":"#BFBFBF"},
            	{"name":"color4", "value":"#FF5555"},
            	{"name":"color5", "value":"#ffd60a"},
            	{"name":"color6", "value":"#000814"},
            	{"name":"color7", "value":"#000000"},
            	{"name":"color8", "value":"#FFFFFF"}
        	]},
			{"name":"theme3", "scheme": [
            	{"name":"background", "value":"#FFFFFF"},
            	{"name":"foreground", "value":"#c32530"},
            	{"name":"color1", "value":"#c32530"},
            	{"name":"color2", "value":"#053c5e"},
            	{"name":"color3", "value":"#BFBFBF"},
            	{"name":"color4", "value":"#FF5555"},
            	{"name":"color5", "value":"#c32530"},
            	{"name":"color6", "value":"#c32530"},
            	{"name":"color7", "value":"#FFFFFF"},
            	{"name":"color8", "value":"#FFFFFF"}
        	]},
			{"name":"theme4", "scheme": [
            	{"name":"background", "value":"#293241"},
            	{"name":"foreground", "value":"#ee6c4d"},
            	{"name":"color1", "value":"#ee6c4d"},
            	{"name":"color2", "value":"#e0fbfc"},
            	{"name":"color3", "value":"#000000"},
            	{"name":"color4", "value":"#FF5555"},
            	{"name":"color5", "value":"#ee6c4d"},
            	{"name":"color6", "value":"#ee6c4d"},
            	{"name":"color7", "value":"#293241"},
            	{"name":"color8", "value":"#293241"}
        	]},
		]
    }

def setTheme(selected):
	status=False
	count=0
	for x in themes["schemes"]:
		if(selected == x["name"]):
			status=True
			for n in themes["schemes"][count]["scheme"]:
				###print("N -> ", n["name"])
				os.system("sed -i '/set ${0}/c\\set ${0} \"{1}\"' {2}". format(n["name"], n["value"], localConfig))
			os.system("i3-msg reload > /dev/null")
		count+=1
	if(not status):
		print("Tema não encontrado!")


if(themeselect == "list"):
	for v in themes["schemes"]:
		print(v["name"])
	exit()

setTheme(themeselect)
