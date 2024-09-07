import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cuidar_ilpi/pages/home/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: SingleChildScrollView(  // Adicionado para rolagem
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Olá Antônio,",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "(profissional da ILPI)",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              searchBar(),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categorias",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Column(  // Substituído por Column para incluir todos os botões
                children: [
                  courseButton(
                    context,
                    "Monitoramento de saúde da pessoa idosa institucionalizada",
                    "assets/images/home/marketing.png",
                    '/monitoring',
                  ),
                  courseButton(
                    context,
                    "Orientações para atividades básicas de vida diárias",
                    "assets/images/home/photography.png",
                    '/sign_up',
                  ),
                  courseButton(
                    context,
                    "Segurança do cuidado à pessoa idosa institucionalizada",
                    "assets/images/home/music.jpg",
                    '/login',
                  ),
                  courseButton(
                    context,
                    "Funcionalidade global da pessoa idosa",
                    "assets/images/home/ux_detail.png",
                    '/login',
                  ),
                  courseButton(
                    context,
                    "Legislação importante",
                    "assets/images/home/marketing.png",
                    '/login',
                  ),
                  courseButton(
                    context,
                    "Dicas de saúde e bem-estar para quem cuida",
                    "assets/images/home/photography.png",
                    '/login',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  GestureDetector courseButton(BuildContext context, String title, String imagePath, String routeScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeScreen);
       /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetail(
              imgDetail: imagePath,
              title: title,
            ),
          ),
        );*/
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Limita o texto a 2 linhas
                overflow: TextOverflow.ellipsis, // Adiciona reticências se o texto for muito longo
              ),
            ),
          ],
        ),
      ),
    );
  }

AppBar myAppBar() {
  return AppBar(
    toolbarHeight: 60,
    elevation: 0.0,
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(top: 16),  // Adiciona padding para mover o conteúdo para baixo
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print("Burger icon tapped!");
            },
            child: SvgPicture.asset(
              "assets/images/home/burger_icon.svg",
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Profile picture tapped!");
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://media.istockphoto.com/id/912073272/pt/foto/happy-senior-man-sitting-at-home.jpg?s=612x612&w=0&k=20&c=MibpEi0DRrCFJmmKdXY0dBjkp6w2BWDa-ZA-hfR_6Qs=",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1d1617).withOpacity(.15),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: "Search for anything",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.25),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}