#Ensayo & Eror. / Rodrigo Pérez / 1er Sprint - Netlabs Academy 7a Edicion.

 	estrellas=0
	errores=0
	op=""
	dificultad=1

	ganar() {
		case $dificultad in
			1)
				estrellas=$((estrellas+1))
			;;
			2)
				estrellas=$((estrellas+2))
			;;
			3)
				estrellas=$((estrellas+3))
			;;
			4)
				estrellas=$((estrellas+4))
			;;
		esac
	}

	perder() {
		while [[ $errores != 2 ]]
		do
			errores=$((errores+1))
			echo "Incorrecto intenta de nuevo"
			resultado
		done
		if [[ $errores == 2 ]]
		then
			case $dificultad in
				1)
					estrellas=$((estrellas-1))
				;;
				2)
					estrellas=$((estrellas-2))
				;;
				3)
					estrellas=$((estrellas-3))
				;;
				4)
					estrellas=$((estrellas-4))
				;;
			esac
			case $operacionElegida in
				3)
					echo -e 'La resolucion del problema era' $operadorUno 'sumado por si mismo' $operadorDos 'veces -->' $operadorUno $operador $operadorDos '=' $resultadoReal '\n\nIntenta con otro problema.	'				
				;;
				4)
					echo -e 'Para resolver este problema hay que contar cuantas veces entra' $operadorDos 'en' $operadorUno ', entonces -->' $operadorUno $operador $operadorDos '=' $resultadoReal  '\n\nIntenta con otro problema.'
				;;
				*)
					echo -e 'La resolucion del problema era' $operadorUno $operador $operadorDos '=' $resultadoReal ', has perdido una estrella, ahora tienes' $estrellas 'estrella/s\n'
				;;
				esac
				operacionesAritmericas
		fi
	}

	resultado() {
		echo -e "\n$operadorUno $operador $operadorDos"
		read -p "" respuestaUsuario
		if [[ $resultadoReal == $respuestaUsuario ]]
		then
			ganar
			echo -e "Correcto!\nTienes un total de" $estrellas "estrella/s"
			operacionesAritmericas
		elif [[ $respuestaUsuario == 0 ]]
		then
			case $dificultad in
				1)
					estrellas=$((estrellas-1))
				;;
				2)
					estrellas=$((estrellas-2))
				;;
				3)
					estrellas=$((estrellas-3))
				;;
				4)
					estrellas=$((estrellas-4))
				;;
			esac
			inicio
		elif [[ $respuestaUsuario == 00 ]]
		then
			calculadora
		else
			perder
		fi
	}

	# agregar tdas las operaciones a un while, definiendo la variable resultadoReal fuera de ello, diciendo que se haga loop hasta que la funcion seleccionada de un resultado positivo o entero.
	# variable op fuera de un while que refleje las operaciones para seguir repitiendola hasta que decida salirse

	restar() {
		case $dificultad in
			1)
				operadorUno=$((1 + $RANDOM % 20))
				operadorDos=$((1 + $RANDOM % 20))
			;;
			2)
				operadorUno=$((40 + $RANDOM % 100))
				operadorDos=$((40 + $RANDOM % 100))
			;;
			3)
				operadorUno=$((100 + $RANDOM % 250))
				operadorDos=$((100 + $RANDOM % 250))
			;;
			4)
				operadorUno=$((1 + $RANDOM % 99999999999999))
				operadorDos=$((1 + $RANDOM % 99999999999999))
			;;
		esac
		resultadoReal=$(( $operadorUno - $operadorDos ))
		operador="-"
		if [[ $resultadoReal -le 0 ]]
		then
			restar
		else
			resultado
		fi
	}

	sumar() {
		case $dificultad in
			1)
				operadorUno=$((1 + $RANDOM % 20))
				operadorDos=$((1 + $RANDOM % 20))
			;;
			2)
				operadorUno=$((40 + $RANDOM % 100))
				operadorDos=$((40 + $RANDOM % 100))
			;;
			3)
				operadorUno=$((100 + $RANDOM % 250))
				operadorDos=$((100 + $RANDOM % 250))
			;;
			4)
				operadorUno=$((1 + $RANDOM % 99999999999999))
				operadorDos=$((1 + $RANDOM % 99999999999999))
			;;
		esac
		resultadoReal=$(( $operadorUno + $operadorDos ))
		operador="+"
		resultado
	}

	multiplicar() {
		case $dificultad in
			1)
				operadorUno=$((1 + $RANDOM % 9))
				operadorDos=$((1 + $RANDOM % 9))
			;;
			2)
				operadorUno=$((5 + $RANDOM % 50))
				operadorDos=$((5 + $RANDOM % 15))
			;;
			3)
				operadorUno=$((50 + $RANDOM % 99))
				operadorDos=$((50 + $RANDOM % 99))
			;;
			4)
				operadorUno=$((999 + $RANDOM % 9999))
				operadorDos=$((999 + $RANDOM % 9999))
			;;
		esac
		resultadoReal=$(( $operadorUno * $operadorDos ))
		operador="x"
		resultado
	}

	dividir() {
		case $dificultad in
			1)
				operadorUno=$((15 + $RANDOM % 40))
				operadorDos=$((2 + $RANDOM % 10))
			;;
			2)
				operadorUno=$((74 + $RANDOM % 126))
				operadorDos=$((3 + $RANDOM % 112))
			;;
			3)
				operadorUno=$((150 + $RANDOM % 258))
				operadorDos=$((4 + $RANDOM % 246))
			;;
			4)
				operadorUno=$((1500 + $RANDOM % 5000))
				operadorDos=$((6 + $RANDOM % 1000))
			;;
		esac
		resultadoReal=$(( $operadorUno / $operadorDos ))
		operador="/"
		if [ $[ $operadorUno % $operadorDos ] == 0 ]
		then
			if [ $resultadoReal != 1 ]
			then
				resultado
			else
				dividir
			fi
		else
			dividir
		fi
	}

	leerNumeroCalculadora() {
		echo -e "\nDime el primer numero : "
		read a
		echo "Dime el segundo numero : "
		read b
	}

	calculadora() {
		if [ $respuestaUsuario == 00 ]
		then
			echo ""
		else
			clear
		fi
		if [ $estrellas -le 4 ]
		then
			echo "No puedes usar esto si no cuentas con las estrellas suficienes! (mininmo 5)"
			read -p "Intro para continuar"
			inicio
		else
			echo -e "Elije una opcion :\n0. Inicio\n1. Suma\n2. Resta\n3. Multiplicacion\n4. Division."
			read opcionCalculadora

			case $opcionCalculadora in
				0)
					inicio
				;;
				1)
					leerNumeroCalculadora
					res=`echo $a + $b | bc`
				;;
				2)
					leerNumeroCalculadora
					res=`echo $a - $b | bc`
				;;
				3)
					leerNumeroCalculadora
					res=`echo $a \* $b | bc`
				;;
				4)
					leerNumeroCalculadora
					res=`echo "scale=2; $a / $b" | bc`
				;;
				*)
					echo 'No hay opcion para eso.'
					calculadora
				esac
			estrellas=$((estrellas-5))
			echo -e "\nResultado : $res\nSe te han restado 5 estrellas, ahora tienes $estrellas\n"
			if [[ $respuestaUsuario == 00 ]]
			then
				echo "Ahora prueba nuevamente:"
				resultado
			else
				read -p "Intro para continuar"
				calculadora
			fi
		fi
	}

	operacionesAritmericas() {
		errores=0
		case $operacionElegida in
			0)
				inicio
			;;
			1)
				sumar
			;;
			2)
				restar
			;;
			3)
				multiplicar
			;;
			4)
				dividir
			;;
			*)
				clear
				read -p -e 'No hay opcion para eso. Vuelve a intentarlo.\nIntro para continuar.'
				pregunta
		esac
		clear
	}


	pregunta() {
		case $op in
			0)
				exit
			;;
			1)
				clear
				echo -e 'Manual.\n-------------\nEsta aplicacion esta programada para que puedas practicar matematicas de manera sencilla e interactiva.\nEn cuanto completes un problema de forma correcta se te premiara con estrellas dependiendo la dificultad elegida, de igual manera al responder un problema de forma incorrecta tres veces se te dara el resultado y se te restara estrellas dependiendo la dificultad.\n-Dificultad facil, ganar y perder modifica en uno las estrellas\n-Dificultad media, ganar y perder modifica en dos las estrellas\n-Dificultad dificil, ganar y perder modifica en tres las estrellas\n-Dificultad imposible, ganar y perder modifica en cuatro las estrellas\nLa aplicacion tiene incorporada una calculadora que puedes usar como si fuera comodin, al estar frente a un problema que no seas capaz de resolver puedes digitar "00" y la llamaras. Ten en cuenta que esto tiene un costo de 5 estrellas, usalo con cuidado.\nPara salir de la modalidad elegida escribe 0\n-------------'
				read -n 1 -p "Presione cualquier tecla para desplegar el menu nuevamente."
				inicio
			;;
			2)
				clear
				echo -e "Elige lo que desees operar:\n-------------\n0. Inicio\n1. Suma\n2. Resta\n3. Multiplicacion\n4. Division\n-------------"
				read -p "" operacionElegida
				operacionesAritmericas
			;;
			3)
				calculadora

			;;
			4)
				clear
				echo -e 'Elige la dificultad de los problemas.\n1.Facil\n2.Media\n3.Dificil\n4.Imposible (ni lo intentes)'
				read -p "" dificultad
				case $dificultad in
					1)
						dificultadActual='facil'
					;;
					2)
						dificultadActual='media'
					;;
					3)
						dificultadActual='dificil'
					;;
					4)
						dificultadActual='imposible'
					;;
					*)
						echo 'Esa opcion no esta disponible. Intentalo de nuevo'
						read -p 'Intro para continuar'
						pregunta
					;;
				esac
				echo -e "has elegido el modo $dificultadActual.\n-------------"
				read -n 1 -p "Intro para continuar"
				inicio
			;;
			*)
				clear
				read -n 1 -p -e "Elija una de las opciones de la lista.\n-------------\nPresione cualquier tecla para desplegar el menu nuevamente."
				inicio
			;;
		esac
	}

	inicio() {
		clear
		echo -e "A continuacion digita el numero correspondiente de la operacion que desees realizar\n-------------\n0. Salir.\n1. Manual\n2. Operaciones Aritmeticas\n3. Calculadora\n4. Dificultad de las Operaciones\n-------------"
		read -p "" op
		pregunta
	}

	meet() {
		clear
		echo -e "***************************\nBienvenido a Ensayo & Error.\n***************************\nEste programa esta creado para poder practicar la matematica. Antes de comenzar se recomienda leer la seccion de Manual(1).\n-------------"
		read -p "Intro para continuar"
		inicio
	}

	meet