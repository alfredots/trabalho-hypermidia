<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="nclpart" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rg_video_principal" top="0" left="0" width="100%" height="100%" zIndex="5" />
			<region id="rg_video_principal2" top="0" left="0" width="100%" height="100%" zIndex="6" />
			<region id="rg_legenda" top="80%" left="80%" width="10%" height="10%" zIndex="6" />
			<region id="rg_legenda2" top="80%" left="80%" width="10%" height="10%" zIndex="7" />
			
			<region id="rg_menu22" left="40%" top="60%" width="20%" height="20%" zIndex="6"/>
			<region id="rg_menu33" left="70%" top="60%" width="20%" height="20%" zIndex="6"/>			
		</regionBase>
		
		<descriptorBase>
			<descriptor id="desc_video_principal" region="rg_video_principal"/>
			<descriptor id="desc_video_principal2" region="rg_video_principal2"/>
			<descriptor id="desc_legenda" region="rg_legenda" explicitDur="10s"/>
			<descriptor id="desc_legenda2" region="rg_legenda2"/>
			
			<descriptor id="desc_menu22" region="rg_menu22"
			focusIndex="1"  moveRight="2" 
			focusBorderWidth="5" focusBorderColor="white"/>
			
			<descriptor id="desc_menu33" region="rg_menu33" 
			focusIndex="2" moveLeft="1" 
			focusBorderWidth="5" focusBorderColor="white"/>
			
		</descriptorBase>
		
		<connectorBase>
			<importBase documentURI="connectorBase.ncl" alias="conB"/>
		</connectorBase>
	</head>
	
	<body>
		<context id="ctx_nclpart">
			<!--Video principal-->
			<media id="video_principal" src="media/hipermidia2.mp4" descriptor="desc_video_principal">
				<area id="area_legenda" begin="00:00:18"/>
				<area id="area_menu3" begin="00:01:00"/>
				<area id="area_menu2" begin="00:01:00"/>
			</media>
			
			<media id="entrevista" src="media/entrevista.mp4" descriptor="desc_video_principal2"/>
			<media id="hello" src="media/helloginga.mp4" descriptor="desc_video_principal2"/>
			<media id="apps" src="media/apps.mp4" descriptor="desc_video_principal2"/>
			
			<media id="btn_legenda" src="media/1.png" descriptor="desc_legenda"/>
			<media id="btn_legenda2" src="media/sair.png" descriptor="desc_legenda2"/>
			
			<media id="menu2" src="media/hello-ginga.png" descriptor="desc_menu22"/>
			<media id="menu3" src="media/galapagos-app.png" descriptor="desc_menu33"/>
			
			<port id="p_video_principal" component="video_principal"/>
			
			<!---->
			<link xconnector="conB#onBeginStart">
				<bind role="onBegin" interface="area_legenda" component="video_principal"/>
				<bind role="start" component="btn_legenda"/>
			</link>
			
			<!--referente a entrevista-->
			
			<link xconnector="conB#onKeySelectionStart">
				<bind role="onSelection" component="btn_legenda">
					<bindParam name="keyCode" value="1"/>
				</bind>
				<bind role="start" component="entrevista"/>	
			</link>
			
			<link xconnector="conB#onBeginPause">
				<bind role="onBegin" component="entrevista"/>
				<bind role="pause" component="video_principal"/>
			</link>
			
			<link xconnector="conB#onBeginStart">
				<bind role="onBegin" component="entrevista"/>
				<bind role="start" component="btn_legenda2"/>
			</link>
			
			<link xconnector="conB#onKeySelectionResume">
				<bind role="onSelection" component="btn_legenda2">
					<bindParam name="keyCode" value="2"/>
				</bind>
				<bind role="resume" component="video_principal"/>	
			</link>
			
			<link xconnector="conB#onKeySelectionAbort">
				<bind role="onSelection" component="btn_legenda2">
					<bindParam name="keyCode" value="2"/>
				</bind>
				<bind role="abort" component="entrevista"/>	
			</link>
			
			<link xconnector="conB#onKeySelectionAbort">
				<bind role="onSelection" component="btn_legenda2">
					<bindParam name="keyCode" value="2"/>
				</bind>
				<bind role="abort" component="btn_legenda2"/>	
			</link>
			
			<!--menu final do app-->
			
			<link xconnector="conB#onBeginStart">
				<bind role="onBegin" interface="area_menu2" component="video_principal"/>
				<bind role="start" component="menu2"/>
			</link>
			
			<link xconnector="conB#onBeginStart">
				<bind role="onBegin" interface="area_menu3" component="video_principal"/>
				<bind role="start" component="menu3"/>
			</link>
			
			<!--Ao selecionar op inicia video desejado-->
			<link xconnector="conB#onKeySelectionStart">
				<bind role="onSelection" component="menu2"/>
				<bind role="start" component="hello"/>
			</link>
			
			<link xconnector="conB#onSelectionStart">
				<bind role="onSelection" component="menu3"/>
				<bind role="start" component="apps"/>
			</link>
			
			<!--Ao iniciar video aborta principal e menus-->
			<link xconnector="conB#onBeginAbortN">
				<bind role="onBegin" component="hello"/>
				<bind role="abort" component="video_principal"/>
				<bind role="abort" component="menu2"/>
				<bind role="abort" component="menu3"/>
			</link>
			
			<link xconnector="conB#onBeginAbortN">
				<bind role="onBegin" component="apps"/>
				<bind role="abort" component="video_principal"/>
				<bind role="abort" component="menu2"/>
				<bind role="abort" component="menu3"/>
			</link>
			
			<link xconnector="conB#onEndAbortN">
				<bind role="onEnd" component="video_principal"/>
				<bind role="abort" component="menu2"/>
				<bind role="abort" component="menu3"/>
			</link>
			
		</context>
	</body>
</ncl>