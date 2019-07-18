%Interfaces gr�ficas
%IMAGENES
%
:-use_module(library(pce)).
:-pce_image_directory('./imagenes').
:- use_module(library(pce_style_item)).
:-consult('BaseConocimiento.pl').
resource(img_principal,image,image('mapaColombia.jpg')).
resource(icon,image,image('principal.jpg')).
resource('Amazonas', image, image('amazonas.jpg')).
resource('Antioquia', image, image('Antioquia.jpg')).
resource('Arauca', image, image('arauca.jpg')).
resource('Atl�ntico', image, image('atlantico.jpg')).
resource('Bol�var', image, image('bolivar.jpg')).
resource('Boyac�', image, image('boyaca.jpg')).
resource('Caldas', image, image('caldas.jpg')).
resource('Caquet�', image, image('caqueta.jpg')).
resource('Casanare', image, image('casanare.jpg')).
resource('Cauca', image, image('cauca.jpg')).
resource('Cesar', image, image('cesar.jpg')).
resource('Choc�', image, image('choco.jpg')).
resource('C�rdoba', image, image('cordoba.jpg')).
resource('Cundinamarca', image, image('cundinamarca.jpg')).
resource('Guain�a', image, image('guainia.jpg')).
resource('Guajira', image, image('guajira.jpg')).
resource('Guaviare', image, image('guaviare.jpg')).
resource('Huila', image, image('huila.jpg')).
resource('Magdalena', image, image('magdalena.jpg')).
resource('Meta', image, image('meta.jpg')).
resource('Nari�o', image, image('nari�o.jpg')).
resource('Nortedesantander', image, image('nortesantander.jpg')).
resource('Putumayo', image, image('putumayo.jpg')).
resource('Quind�o', image, image('quindio.jpg')).
resource('Risaralda', image, image('risaralda.jpg')).
resource('Sanandres', image, image('sanandres.jpg')).
resource('Sucre', image, image('sucre.jpg')).
resource('Tolima', image, image('tolima.jpg')).
resource('Valledelcauca', image, image('vallecauca.jpg')).
resource('Vaup�s', image, image('vaupes.jpg')).
resource('Vichada', image, image('vichada.jpg')).
resource('Santander', image, image('santander.jpg')).

%%%
%BUSQUEDA POR DEPTOS

principal:-new(D,dialog('Guia turistica Colombiana')),
new(BtnDep,button('Busqueda de dpto',message(@prolog,departamentos))),
new(BtnMas,button('Mas Informacion',message(@prolog,mas))),
new(LblImg,label(icon,resource(icon))),

send_list(D,append,[BtnDep,BtnMas,LblImg]),
send(D,open_centered).

mas:-new(D,dialog('Acerca de Colombia')),
new(LblTitulo,label(titulo, 'Colombia: Vive Colombia, Viaja por Ella' )),
new(LblInfo,label(info,'Temporadas altas Diciembre-Febrero, Temporada mediaMarzo-Septiembre, Temporada Baja Octubre-Noviembre')),
send(LblTitulo,font,font(tahoma,bold,20)),

send_list(D,append,[LblTitulo,LblInfo]),
send(D,open_centered).

departamentos:-new(Dp,dialog('Atractivos por Departamento')),
new(MenuDepto,menu('Departamentos:',cycle)),
send_list(MenuDepto,append,['Amazonas','Antioquia','Arauca','Atl�ntico','Bol�var','Boyac�','Caldas','Caquet�','Casanare','Cauca','Cesar','Choc�','C�rdoba','Cundinamarca','Guain�a','Guaviare','Huila','La Guajira','Magdalena','Meta','Nari�o','Norte de Santander','Putumayo','Quind�o','Risaralda','San Andres y Providencia','Santander','Sucre','Tolima','Valle del Cauca','Vaup�s','Vichada']),

new(BtnHor,button('Buscar',message(@prolog,municipios,MenuDepto?selection))),
new(LblImg,label(mapa,resource(img_principal))),

send_list(Dp,append,[MenuDepto,BtnHor,LblImg]),
send(Dp,open_centered).

municipios(X):-new(D,dialog('municipios')),
depa(X,L),
new(MenuDepto,menu('Municipios',cycle)),
new(BtnBus,button('Buscar',message(@prolog,info,MenuDepto?selection))),
send_list(MenuDepto,append,L),

new(LblImg,label(mapa,resource(X))),

send_list(D,append,[MenuDepto,BtnBus,LblImg]),
send(D,open_centered).

info(Mun):-new(D,dialog('Informacion')),
municipio(Mun,Ho,Atr),
new(MenuHob,menu('Departamentos:',cycle)),
send_list(MenuHob,append,Ho),
new(MenuAtr,menu('Departamentos:',cycle)),
send_list(MenuAtr,append,Atr),

send_list(D,append,[MenuHob,MenuAtr]),
send(D,open_centered).


%BUSQUEDA POR HOBBIES
hobbies:-new(Dp,dialog('Atractivos por Hobbies')),
new(MenuHobbies,menu('Departamentos:',cycle)),
send_list(MenuHobbies,append,['Avistamiento Ballenas','Bicicleta','Buggie','Buceo','Cabalgata','Caminata','Caminata Monta�a','Camping','Canopy','Careteo','Coleo','Diversi�n Acu�tica','Escalar','Espeleolog�a','Hamaca','Jet Ski','Jumping','Kayak','Observaci�n Aves','Observaci�n Aves, Fauna','Observaci�n Aves, Flora y Fauna','Observaci�n Fauna','Observaci�n Flora','Observaci�n Flora y Fauna','Observaci�n Patrimonio Cultural','Observatorio Estrellas','Paracaidismo','Parapente','Playa','Rafting','Rappel','Relajaci�n y Yoga','Sky','Snorkeling','Surf','Telef�rico']),
new(Op, menu('Atractivos', marked)),
send(Op, append, norte), send(Op,append, sur),
send(Op, size,size(300,300)),
send(Dp, display, Op, point(100, 40)),
new(BtnHor,button('Buscar',message(@prolog,infoPlantar))),

send_list(Dp,append,[MenuHobbies,Op,BtnHor]),
send(Dp,open_centered).

