// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';

// 그리드뷰, 리스트뷰.빌더, 스택, 로우 활용!

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              children: [
                FirstTab(),
                SecondTab(),
                ThirdTab(),
              ],
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: TabPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      color: DefaultTabController.of(context).index == 1
          ? Colors.blue[300]
          : Colors.grey[400],
      selectedColor: DefaultTabController.of(context).index == 1
          ? Colors.white
          : Colors.blue,
      indicatorSize: 8,
    );
  }
}

// 첫번째 페이지
class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const songs = [
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  // 여기 패딩을 주면 '라이브러리' 텍스트도 같이 아래로 이동 위로 가서
                  // crossAxisAlignment 에서 설정해주면,
                  // Row의 부축은 세로! 세로방향의 기준이 default 값이 center 로 되어 있음
                  // 그걸 start로 해주면 설정 아이콘만 패딩 지정 가능
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.settings),
                ),
                Text(
                  '라이브러리',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(null),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  ImageIcon(
                    NetworkImage("https://i.ibb.co/hxNbZ8p/shazam.png"),
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'shazam',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.person_rounded),
                  SizedBox(width: 8),
                  Text(
                    '아티스트',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.music_note),
                  SizedBox(width: 8),
                  Text(
                    '회원님을 위한 재생목록',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              "최근 Shazam",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            // '최근 Shazam' 텍스트를 왼쪽으로 이동하는방법
            // 포함하는 Column의 가로방향 -> crossAxisAlignment 를 start로 조정
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                // 가로 방향으로 몇개가 들어가는지
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  var song = songs[index];
                  String imageUrl = song['imageUrl']!;
                  String title = song['title']!;
                  String artist = song['artist']!;
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 1,
                          // 이렇게 하면 전체 회색으로 나옴 -> 박스 색깔을 흰색으로
                        )
                      ],
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.network이미지 조정 -> ClipRRect위젯으로 묶어주면 됨
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            // 이미지의 높이는 폭에 비례,
                            // 그리드의 높이와 함께 변해야함, 그리드의 높이 = 기기의 가로넓이에 비례
                            // MediaQuery.of(context).size.heigh * 0.5 = 그리드의 대략적인 폭
                            // MediaQuery.of(context).size.heigh * 0.5 * 5/3 = 이미지의 높이 (그리드의 거의 전체를 차지)
                            // (228번째 줄, GridView.builder에서 childAspectRatio: 3 / 5 이기 때문)
                            // MediaQuery.of(context).size.heigh * 0.5 * 5/3 * 0.55 = 그리드에서 55% 높이 차지하도록 됨
                            height: MediaQuery.of(context).size.width *
                                0.5 *
                                5 /
                                3 *
                                0.55,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                // 위에 있던 아이 가져옴 주석처리 참고, 그런데 좀 안쪽으로 들어와있음
                                // -> Container()로 감싸주고 컨테이너 크기를 double.infinity로
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    artist,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[700]),
                                  ),
                                  Spacer(), // 남은 공간 크기를 알수가 없어서 에러 -> Padding()을 Expanded()로 감싸줌
                                  Image.network(
                                    "https://i.ibb.co/KG9m5QS/applemusic.png",
                                    width: 60,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 두번째 페이지
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container() 로 내용을 쓰면 왼쪽 위로 붙어버림 -> 프레임 안으로 넣어주기
      // 안에 있는 child 를 SafeArea로 묶어주기 ㄱㄱ (wrap with widget)
      // Gradient 주기 위해 BoxDecoration()
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[300]!, Colors.blue[900]!])),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxis를 조정해도 되고, 사이에 Spacer()를 넣어줘도 됨
              children: [
                GestureDetector(
                  onTap: () {
                    // 눌렀을때 동그랗게 효과가 안나타남
                    DefaultTabController.of(context).animateTo(0);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text(
                        "라이브러리",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                GestureDetector(
                  onTap: () {
                    DefaultTabController.of(context).animateTo(2);
                  },
                  child: Column(
                    children: [
                      // IconButton()은 기본적으로 Padding이 적용되어 밑에 텍스트와 간격이 넓음
                      // GestureDetector()로 바꿔줄수 있음 icon -> child 로 바꿔
                      Icon(
                        Icons.show_chart,
                        color: Colors.white,
                      ),
                      Text(
                        "차트",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // MediaQuery 검색
          Text(
            "Shazam하려면 탭하세요",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 200,
            decoration:
                BoxDecoration(color: Colors.blue[300], shape: BoxShape.circle),
            child: Image.network(
              "https://i.ibb.co/hxNbZ8p/shazam.png",
              color: Colors.white,
              // 위에 alignment가 없으면 어디위치를 기준으로 크기를 어떻게 만들어줘야 할지 몰라서 구현이 안됨
              width: 130,
              height: 130,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      )),
    );
  }
}

// 세번째 페이지
class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartData = {
      'korea': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'global': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'newyork': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'Adele',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
    };

    return SafeArea(
      child: Column(
        children: [
          Text(
            '차트',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 18),
          Expanded(
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      // Container를 Column으로 묶어주고 Column 을 Stack으로 변경
                      color: Colors.purple[900],
                      height: 180,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        Container(
                          // 기기의 폭에 따라서 변하도록 ->
                          // MediaQuery.of(context) : 화면의 길이
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                            ),
                            child: Text(
                              "국가 및 도시별 차트",
                              style: TextStyle(
                                  color: Colors.purple[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '전 세계',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // Row() 패딩으로 감싸기
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "대한민국 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Spacer() 하거나, 위의 MainAxisAlignment 하거나
                      Text(
                        "모두 보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  // 위의 'korea'에 있는 리스트들을 가져오기 위해
                  // chartData에서 map을 써줘서 값들을 하나씩 순회 (map 은 리스트 반환) -> toList()로 변환
                  // 그럼 바깥쪽 [ ] 괄호를 지워줘야 함
                  children: chartData['korea']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // Column() 패딩으로 감싸기
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // Row() 패딩으로 감싸기
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "글로벌 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Spacer() 하거나, 위의 MainAxisAlignment 하거나
                      Text(
                        "모두 보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: chartData['global']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // Column() 패딩으로 감싸기
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // Row() 패딩으로 감싸기
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "뉴욕 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Spacer() 하거나, 위의 MainAxisAlignment 하거나
                      Text(
                        "모두 보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: chartData['newyork']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // Column() 패딩으로 감싸기
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
