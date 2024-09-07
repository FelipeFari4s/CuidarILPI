import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cuidar_ilpi/pages/home/Detail/course_content.dart';
import 'package:cuidar_ilpi/pages/home/constants.dart';

class CourseDetail extends StatefulWidget {
  final String imgDetail;
  final String title;
  /*final String price;*/
  const CourseDetail(
      {super.key,
      required this.imgDetail,
      required this.title,
      /*required this.price*/});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  bottom: 350,
                  child: Container(
                    height: size.height * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imgDetail),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // of best seller
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("BEST SELLER"),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          //for title
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          ),

                          //for rating and no of users
                          Row(
                            children: [
                              Row(
                                //user
                                children: [
                                  SvgPicture.asset("images/user_icon.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text("18K"),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 25),

                              //star-favorite
                              Row(
                                //user
                                children: [
                                  SvgPicture.asset("images/star_icon.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text("4.8"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          /*Row(
                            children: [
                              Text(
                                //widget.price,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "\$70",
                                style: TextStyle(
                                  fontSize: 30,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          )*/
                        ],
                      ),
                    ),
                  ],
                ),
                CourseContent(size: size),
              ],
            )
          ],
        ),
      ),
      bottomSheet: bottomParts(),
    );
  }

  Container bottomParts() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 55,
              width: 70,
              decoration: BoxDecoration(
                color: redLight,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset("images/cart_icon.svg"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                
                height: 65,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
