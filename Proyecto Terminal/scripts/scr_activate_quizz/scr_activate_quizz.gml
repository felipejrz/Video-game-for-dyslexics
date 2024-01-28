function scr_activate_quizz() {
	switch(global.quest_status[? "TheQuizz"]){
		case 0:	
			scr_new_text_box("\n!Hola!, mi nombre es Tucánon el Pregunton",0);
			scr_new_text_box("¿Por que de mi nombre? \npues por que me gusta\n hacer preguntas a las personas",0);
			scr_new_text_box("Cada vez que me contestes \nuna pregunta correcta\n Te dare una moneda",0);
			global.quest_status[? "TheQuizz"] = 1;
		case 1:
			scr_new_text_box("¿Quieres jugar Tucántrivia?",0, ["7:Si", "8:No"]);break;
		case 2:
		    var _opcion = floor(random_range(1, 60));
		    switch (real(_opcion)) {
		        case 1: scr_new_text_box("¿Cuál es la capital de Francia?", 0, ["1:París", "2:Londres", "2:Berlín"]); break;
		        case 2: scr_new_text_box("¿Cuántos días tiene el mes de marzo?", 0, ["2:28", "2:30", "1:31"]); break;
		        case 3: scr_new_text_box("¿Quién escribió 'Don Quijote de la Mancha'?", 0, ["1:Cervantes", "2:Shakespeare", "2:Hemingway"]); break;
		        case 4: scr_new_text_box("¿En qué año comenzó la Segunda Guerra Mundial?", 0, ["1:1939", "2:1945", "2:1914"]); break;
		        case 5: scr_new_text_box("¿Cuál es el río más largo del mundo?", 0, ["2:Nilo", "1:Amazonas", "2:Misisipi"]); break;
		        case 6: scr_new_text_box("¿Cuál es el animal terrestre más grande?", 0, ["2:Elefante africano", "2:Jirafa", "1:Hipopótamo"]); break;
		        case 7: scr_new_text_box("¿Quién pintó la Mona Lisa?", 0, ["1:Leonardo da Vinci", "2:Vincent van Gogh", "2:Pablo Picasso"]); break;
		        case 8: scr_new_text_box("¿Cuántos continentes hay en el mundo?", 0, ["1:7", "2:5", "2:6"]); break;
		        case 9: scr_new_text_box("¿Cuál es el planeta más grande del sistema solar?", 0, ["2:Júpiter", "2:Marte", "1:Saturno"]); break;
		        case 10: scr_new_text_box("¿Cuál es la capital de Japón?", 0, ["1:Tokio", "2:Pekín", "2:Seúl"]); break;
		        case 11: scr_new_text_box("¿Quién descubrió América en 1492?", 0, ["1:Cristóbal Colón", "2:Marco Polo", "2:Fernando de Magallanes"]); break;
		        case 12: scr_new_text_box("¿Cuántos lados tiene un triángulo?", 0, ["1:3", "2:4", "2:5"]); break;
		        case 13: scr_new_text_box("¿Cuál es el océano más grande?", 0, ["1:Pacífico", "2:Atlántico", "2:Índico"]); break;
		        case 14: scr_new_text_box("¿En qué año terminó la Primera Guerra Mundial?", 0, ["1:1918", "2:1925", "2:1914"]); break;
		        case 15: scr_new_text_box("¿Cuál es la flor típica de Japón?", 0, ["1:Sakura", "2:Tulipán", "2:Rosa"]); break;
		        case 16: scr_new_text_box("¿Quién escribió 'Romeo y Julieta'?", 0, ["1:William Shakespeare", "2:Jane Austen", "2:Charles Dickens"]); break;
		        case 17: scr_new_text_box("¿Cuál es el país más grande del mundo?", 0, ["1:Rusia", "2:China", "2:Estados Unidos"]); break;
		        case 18: scr_new_text_box("¿En qué año llegó el hombre a la luna?", 0, ["2:1969", "2:1975", "1:1961"]); break;
		        case 19: scr_new_text_box("¿Cuál es el símbolo químico del oro?", 0, ["1:Au", "2:Ag", "2:Fe"]); break;
		        case 20: scr_new_text_box("¿Cuál es el instrumento musical de viento más grande?", 0, ["2:Tuba", "2:Flauta", "1:Trombón"]); break;
		        case 21: scr_new_text_box("¿En qué país se encuentra la Gran Muralla China?", 0, ["1:China", "2:Japón", "2:India"]); break;
		        case 22: scr_new_text_box("¿Cuál es el animal más rápido del mundo?", 0, ["1:Guepardo", "2:Leopardo", "2:Tigre"]); break;
		        case 23: scr_new_text_box("¿Quién fue el primer presidente de Estados Unidos?", 0, ["1:George Washington", "2:Abraham Lincoln", "2:Thomas Jefferson"]); break;
		        case 24: scr_new_text_box("¿Cuál es el elemento más abundante en la Tierra?", 0, ["1:Oxígeno", "2:Hidrógeno", "2:Hierro"]); break;
		        case 25: scr_new_text_box("¿Qué planeta es conocido como 'el planeta rojo'?", 0, ["2:Marte", "2:Júpiter", "1:Venus"]); break;
		        case 26: scr_new_text_box("¿Cuál es la montaña más alta del mundo?", 0, ["2:Monte Everest", "2:Monte McKinley", "1:Monte Kilimanjaro"]); break;
		        case 27: scr_new_text_box("¿Cuántos colores tiene el arcoíris?", 0, ["2:7", "2:5", "1:6"]); break;
		        case 28: scr_new_text_box("¿Quién pintó 'La noche estrellada'?", 0, ["1:Vincent van Gogh", "2:Pablo Picasso", "2:Leonardo da Vinci"]); break;
		        case 29: scr_new_text_box("¿Cuál es la película de animación más taquillera de la historia?", 0, ["2:El Rey León", "2:Frozen", "1:Avengers: Endgame"]); break;
		        case 30: scr_new_text_box("¿Cuál es el océano más pequeño?", 0, ["2:Ártico", "2:Antártico", "1:Índico"]); break;
		        case 31: scr_new_text_box("¿Quién fue el primer ser humano en el espacio?", 0, ["1:Yuri Gagarin", "2:Neil Armstrong", "2:Buzz Aldrin"]); break;
		        case 32: scr_new_text_box("¿Cuál es la moneda de Japón?", 0, ["1:Yen", "2:Dólar", "2:Euro"]); break;
		        case 33: scr_new_text_box("¿En qué año se fundó la ONU?", 0, ["1:1945", "2:1950", "2:1939"]); break;
		        case 34: scr_new_text_box("¿Cuántos lados tiene un cuadrado?", 0, ["1:4", "2:3", "2:5"]); break;
		        case 35: scr_new_text_box("¿Quién escribió 'Harry Potter'?", 0, ["1:J.K. Rowling", "2:Stephen King", "2:George R.R. Martin"]); break;
		        case 36: scr_new_text_box("¿Cuál es el país más pequeño del mundo?", 0, ["1:Ciudad del Vaticano", "2:Mónaco", "2:San Marino"]); break;
		        case 37: scr_new_text_box("¿En qué año se independizó Estados Unidos?", 0, ["2:1776", "2:1789", "1:1776"]); break;
		        case 38: scr_new_text_box("¿Cuál es el metal más pesado?", 0, ["1:Osmio", "2:Platino", "2:Plomo"]); break;
		        case 39: scr_new_text_box("¿Quién fue el famoso científico que formuló la teoría de la relatividad?", 0, ["1:Albert Einstein", "2:Isaac Newton", "2:Galileo Galilei"]); break;
		        case 40: scr_new_text_box("¿Cuál es la moneda de China?", 0, ["1:Yuan", "2:Yen", "2:Won"]); break;
		        case 41: scr_new_text_box("¿En qué continente se encuentra Egipto?", 0, ["1:África", "2:Asia", "2:Europa"]); break;
		        case 42: scr_new_text_box("¿Cuál es la capital de Australia?", 0, ["1:Canberra", "2:Sídney", "2:Melbourne"]); break;
		        case 43: scr_new_text_box("¿Quién fue el primer presidente de México?", 0, ["1:Miguel Hidalgo", "2:Guadalupe Victoria", "2:Benito Juárez"]); break;
		        case 44: scr_new_text_box("¿Cuántas patas tiene una araña?", 0, ["1:8", "2:6", "2:10"]); break;
		        case 45: scr_new_text_box("¿Cuál es el desierto más grande del mundo?", 0, ["1:Sáhara", "2:Atacama", "2:Karakum"]); break;
		        case 46: scr_new_text_box("¿Quién escribió 'Cien años de soledad'?", 0, ["1:Gabriel García Márquez", "2:Julio Cortázar", "2:Isabel Allende"]); break;
		        case 47: scr_new_text_box("¿En qué año se fundó la Cruz Roja?", 0, ["1:1863", "2:1875", "2:1888"]); break;
		        case 48: scr_new_text_box("¿Cuál es el país más poblado del mundo?", 0, ["1:China", "2:India", "2:Estados Unidos"]); break;
		        case 49: scr_new_text_box("¿Quién fue el autor de 'El principito'?", 0, ["1:Antoine de Saint-Exupéry", "2:J.K. Rowling", "2:C.S. Lewis"]); break;
		        case 50: scr_new_text_box("¿Cuál es el órgano más grande del cuerpo humano?", 0, ["1:Cerebro", "2:Piel", "2:Hígado"]); break;
		        case 51: scr_new_text_box("¿En qué año se descubrió América?", 0, ["1:1492", "2:1500", "2:1510"]); break;
		        case 52: scr_new_text_box("¿Cuál es la capital de Argentina?", 0, ["1:Buenos Aires", "2:Brasilia", "2:Santiago"]); break;
		        case 53: scr_new_text_box("¿Quién fue el primer astronauta en dar una vuelta completa a la Tierra?", 0, ["1:Yuri Gagarin", "2:Neil Armstrong", "2:Buzz Aldrin"]); break;
		        case 54: scr_new_text_box("¿Cuál es la moneda de Rusia?", 0, ["1:Rublo", "2:Dólar", "2:Euro"]); break;
		        case 55: scr_new_text_box("¿Quién pintó 'Las meninas'?", 0, ["1:Diego Velázquez", "2:Pablo Picasso", "2:Leonardo da Vinci"]); break;
		        case 56: scr_new_text_box("¿Cuál es el río más caudaloso del mundo?", 0, ["1:Amazonas", "2:Nilo", "2:Misisipi"]); break;
		        case 57: scr_new_text_box("¿En qué año se inventó la imprenta?", 0, ["1:1440", "2:1500", "2:1550"]); break;
		        case 58: scr_new_text_box("¿Cuál es el océano más cálido?", 0, ["1:Atlántico", "2:Pacífico", "2:Índico"]); break;
		        case 59: scr_new_text_box("¿Quién fue el primer emperador romano?", 0, ["1:Julio César", "2:César Augusto", "2:Nerón"]); break;
		        case 60: scr_new_text_box("¿Cuántos dientes tiene un adulto?", 0, ["1:32", "2:28", "2:36"]); break;
		        default: break;
		}
	}
}
