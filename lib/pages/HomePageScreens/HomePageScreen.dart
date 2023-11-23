import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/data/Firebase/RealtimeDatabase.dart';
import 'package:foodfast/data/Theme/AppColors.dart';
import 'package:foodfast/widgets/CardHome.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  final Map<String, String> images = {
    "image/ajedrez.jpeg": "No siempre debes ganar para sentirte bien, recuerda que las derrotas nos vuelven mejor que antes.",
    "image/mente_burbujas.jpeg": "La preocupación no elimina el dolor del mañana, sino que elimina la fuerza del hoy",
    "image/mentes.jpeg": "La brecha entre la vida que quieres y la que estás viviendo se llama mentalidad, enfoque y consistencia.",
    "image/respiracion_profunda.jpeg": "Cuando cambias el modo en que ves las cosas, las cosas que ves cambian también",
  };

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  late String _phrase;

  @override
  void initState() {
    // TODO: implement initState
    _phrase = widget.images.values.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.quaternaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CarouselSlider(
                items: widget.images.entries.map((e) => CardHome(imageName: e.key,)).toList(),
                options: CarouselOptions(height: MediaQuery.of(context).size.height*0.5, enableInfiniteScroll: true, viewportFraction: 0.7, enlargeCenterPage: true, onPageChanged: (index, reason) {
                  setState(() {
                    _phrase = widget.images.values.elementAt(index);
                  });
                },),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Container(
                  child: Center(child: Text("\"${_phrase}\"", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700, fontSize: 20), textAlign: TextAlign.center,)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


