import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:media/widgets/vidio_player.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final videoController = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://file-examples.com/storage/fea8fc38fd63bc5c39cf20b/2017/04/file_example_MP4_480_1_5MG.mp4"
  ];
  final username = ["@johnnyb123", "jenifer"];
  final caption = ["My View after waing up evry day...", "Great"];
  final songName = ["Johnny B-Good Money", "Eminem"];
  final lenghtLiked = ["1337", "2000"];
  final profileImage = [""];
  final commentCount = ["2137", "1402"];

  bool liked = true;
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: PageView.builder(
      itemCount: videoController.length,
      controller: PageController(initialPage: 0, viewportFraction: 1),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            VideoPlayerItem(videoUrl: videoController[index]),
            Positioned.fill(
                top: 80,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Follow | ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Recommedations",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 18,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/img/Subscribe.png",
                                width: 138,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/user.png',
                                    width: 32,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            username[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 2),
                                          SizedBox(
                                              width: 21,
                                              child: Image.asset(
                                                  "assets/img/verify.png")),
                                          const Text(
                                            "-15 min ago",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: GradientText(
                                          "547k Followers",
                                          colors: const [
                                            Color(0xFFFD7842),
                                            Color(0xFFF64E56),
                                            Color(0xFFC340AD),
                                            Color(0xFF7148CF),
                                            Color(0xFFF64E56),
                                          ],
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                caption[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "#view #landscape #sunset",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 180,
                                height: 32,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Image.asset("assets/img/song.png"),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        "Johnny B - Good Money",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 120)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Container(
                          width: 80,
                          margin: EdgeInsets.only(top: size.height / 2.80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(height: 30),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: SvgPicture.asset(
                                            "assets/icon/Share.svg"),
                                      )),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          liked = !liked;
                                        });
                                        debugPrint(liked.toString());
                                      },
                                      child: liked
                                          ? SizedBox(
                                              width: 44,
                                              height: 45,
                                              child: SvgPicture.asset(
                                                "assets/icon/Likes_gradient.svg",
                                              ),
                                            )
                                          : SizedBox(
                                              width: 44,
                                              height: 44,
                                              child: SvgPicture.asset(
                                                  "assets/icon/Likes.svg"),
                                            )),
                                  const SizedBox(height: 2),
                                  Text(
                                    commentCount[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: SvgPicture.asset(
                                            "assets/icon/comments.svg"),
                                      )),
                                  const SizedBox(height: 2),
                                  Text(
                                    commentCount[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
