import 'package:flutter/material.dart';
import 'startingVideo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int nbSlivers = 25;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/starrynight.jpg"),
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  expandedHeight: 250,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: size.height * 0.1,
                          fit: BoxFit.contain,
                          image: AssetImage("images/iconemugler.png"),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Le Cercle",
                          style: TextStyle(
                            color: Colors.grey[50],
                            fontSize: size.height * 0.05,
                          ),
                        ),
                      ],
                    ),
                  )),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index % 4 == 0) {
                      return VideoPlayerScreen();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Text("Ne faites qu'un avec MUGLER"),
                              Text("Rejoingnez le Cercle"),
                            ],
                          )),
                    );
                  },
                  childCount: nbSlivers,
                ),
              )
            ],
          )),
    );
  }
}
