import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'contenedores',
      home: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          ),
          home: const ContenedoresContent(),
        ),
      ),
    ),
  );
}

// Con comentarios para q no se me olvide lo q investigue :p
class ContenedoresContent extends StatelessWidget {
  const ContenedoresContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            /* QUIERO ACLARAR QUE SOLO FUNCIONA BIEN EN WEB POR EL TEMA DE
             * DEFINIR TAMAÑOS FIJOS PARA CASI TODOS LOS CONTENEDORES
             */
            children: [
              firstRow(),
              const SizedBox(height: 12),
              secondRow(),
              const SizedBox(height: 12),
              thirdRow(context),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  firstColumn(),
                  bigContainer(context),
                  lastColumn(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row firstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Contenedor 1
        simpleContainer(
          const Text(
            "básico",
            textAlign: TextAlign.center,
          ),
          300,
          150,
          const BoxDecoration(color: Colors.white),
        ),

        const SizedBox(width: 10),

        // Contenedor 2
        simpleContainer(
          const Text("bordes", textAlign: TextAlign.center),
          300,
          150,
          BoxDecoration(
            color: Colors.white12,
            border: Border.all(
              color: Colors.black,
              width: 0.2,
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Contenedor 3
        Expanded(
          child: simpleContainer(
            const Text("Contenedor q se ajusta al tamaño"),
            null,
            150,
            BoxDecoration(
              color: Colors.white24,
              border: Border.all(color: Colors.black87, width: 0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),
      ],
    );
  }

  Row secondRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Contenedor 4
        simpleContainer(
          const Text(
            "Gradiente",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2),
          ),
          400,
          150,
          BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(240, 84, 79, 1),
                  Color.fromRGBO(253, 240, 213, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(25)),
        ),

        const SizedBox(width: 12),

        // Contenedor 5
        Expanded(
          child: simpleContainer(
            const Text(
              "Gradiente de tamaño variable :D",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 3,
              ),
            ),
            null,
            150,
            const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(71, 49, 68, 1),
                  Color.fromRGBO(234, 239, 177, 1)
                ],
              ),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(150), right: Radius.elliptical(32, 50)),
            ),
          ),
        ),
      ],
    );
  }

  Row thirdRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gato tonto derritiendose x el calor"),
                ),
              );
            },
            child: simpleContainer(
              null,
              null,
              200,
              const BoxDecoration(
                  color: Color.fromRGBO(240, 30, 50, 0.6),
                  image: DecorationImage(
                    image: AssetImage('assets/images/melting_cat.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
            ),
          ),
        )
      ],
    );
  }

  Column firstColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Contenedor 7
        simpleContainer(
          const Text(
            "contenedores",
            style: TextStyle(color: Colors.white),
          ),
          200,
          null,
          const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(65, 82, 31, 1),
                Color.fromRGBO(208, 177, 122, 1)
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 5),

        // Contenedor 8
        simpleContainer(
          const Text(
            "en",
            style: TextStyle(color: Colors.black54),
          ),
          200,
          null,
          const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(208, 177, 122, 1),
                Color.fromRGBO(250, 223, 199, 1),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),

        // Contenedor 9
        simpleContainer(
          const Text("cascada"),
          200,
          null,
          const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(250, 223, 199, 1),
                Color.fromRGBO(253, 234, 236, 1),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        )
      ],
    );
  }

  bigContainer(BuildContext context) {
    // Contenedor 10
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: Offset.fromDirection(10),
          ),
        ],
      ),
      width: 300,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            // Contenedor 11
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Hola")));
              },
              child: simpleContainer(
                const Text("arribA"),
                100,
                100,
                const BoxDecoration(
                  color: Colors.blue,
                  border: Border(
                    top: BorderSide(color: Colors.black54, width: 2),
                    right: BorderSide(color: Colors.pink, width: 3),
                    left: BorderSide(color: Colors.deepPurple, width: 5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 100,
            // Contenedor 12
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("soy")));
              },
              child: simpleContainer(
                const Text(
                  "en mediO",
                  style: TextStyle(color: Colors.white),
                ),
                100,
                100,
                BoxDecoration(
                  color: Colors.white12,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset.fromDirection(50),
                      blurRadius: 5,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            // Contenedor 13
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("snackbar")));
              },
              child: simpleContainer(
                const Text("AbajO"),
                100,
                100,
                const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(130, 155, 230, 1),
                      Color.fromRGBO(250, 48, 175, 1),
                    ],
                    radius: 1.012,
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.elliptical(23, 12),
                    right: Radius.circular(28),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column lastColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Botón 1 pulsao")));
              },
              child: simpleContainer(
                const Icon(
                  Icons.reply,
                  size: 32.0
                ),
                100,
                null,
                const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: BorderDirectional(
                    top: BorderSide(color: Colors.black),
                    start: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Botón 2 pulsao")));
              },
              child: simpleContainer(
                const Icon(
                  Icons.upload,
                  size: 32.0,
                ),
                100,
                null,
                const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.black),
                      end: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container simpleContainer(
    Widget? content,
    double? width,
    double? height,
    BoxDecoration decoration,
  ) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: decoration,
      child: Center(child: content),
    );
  }
}
