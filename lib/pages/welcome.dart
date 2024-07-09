import 'package:bilet/bloc/welcome_bloc.dart';
import 'package:bilet/bloc/welcome_event.dart';
import 'package:bilet/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 34),
            width: double.infinity, // Ekranın tamamını kaplayacak şekilde ayarlandı
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "İleri",
                      "Aradığın en uygun uçak bileti",
                      "assets/images/boy.png",
                      pageController,
                    ),
                    // Diğer sayfalar eklenebilir
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _page(int index, BuildContext context, String buttonName, String title, String imagePath, PageController pageController) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 300,
        height: 300,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(

            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceIn,
            );
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil("myHomePage", (route) => false);
          }
        },
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color:Colors.blue,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow:const [
              BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0,4),
            ),
            ],
            gradient: const LinearGradient(
              colors: [Colors.blueAccent,Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end:Alignment.bottomRight,
            )
            
          ),
    
          
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    ],
  );
}
