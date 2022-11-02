import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "piano.dart";
import "drums.dart";
import 'global_variables.dart' as global;
import "device_select.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
    ), drawer: Drawer(
      child: LayoutBuilder(builder: ((context, constraints) {
        Size windowSize = Size(constraints.maxWidth, constraints.maxHeight);
        return Container(
            child: Column(
          children: [
            SizedBox(
              height: windowSize.height * 0.1,
            ),
            ListTile(
                enableFeedback: true,
                leading: Icon(Icons.device_hub, color: Colors.white),
                title: const Text("Select Bluetooth Device",
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiscoveryPage()),
                  );
                })
          ],
        ));
      })),
    ), body: LayoutBuilder(
      builder: ((context, constraints) {
        Size windowSize = Size(constraints.maxWidth, constraints.maxHeight);
        return Container(
            height: windowSize.height * 0.8,
            width: windowSize.width,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Piano(keys: [
                              global.MusicKey("C3", 1),
                              global.MusicKey("C3#", 2),
                              global.MusicKey("D3", 3),
                              global.MusicKey("D3#", 4),
                              global.MusicKey("E3", 5),
                              global.MusicKey("F3", 6),
                              global.MusicKey("F3#", 7),
                              global.MusicKey("G3", 8),
                              global.MusicKey("G3#", 9),
                              global.MusicKey("A3", 10),
                              global.MusicKey("A3#", 11),
                              global.MusicKey("B3", 12),
                              global.MusicKey("C4", 1),
                              global.MusicKey("C4#", 2),
                              global.MusicKey("D4", 3),
                              global.MusicKey("D4#", 4),
                              global.MusicKey("E4", 5),
                              global.MusicKey("F4", 6),
                              global.MusicKey("F4#", 7),
                              global.MusicKey("G4", 8),
                              global.MusicKey("G4#", 9),
                              global.MusicKey("A4", 10),
                              global.MusicKey("A4#", 11),
                              global.MusicKey("B4", 12),
                              global.MusicKey("C5", 13)
                            ]),
                          ));
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 115, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: windowSize.width * 0.3,
                        height: windowSize.height * 0.7,
                        padding: EdgeInsets.all(windowSize.height * 0.05),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: windowSize.height * 0.5,
                                  child: SvgPicture.string(
                                    '''<svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="1280.000000pt" height="802.000000pt" viewBox="0 0 1280.000000 802.000000" preserveAspectRatio="xMidYMid meet">
<metadata>
Created by potrace 1.15, written by Peter Selinger 2001-2017
</metadata>
<g transform="translate(0.000000,802.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
<path d="M0 4015 l0 -4005 6400 0 6400 0 0 4005 0 4005 -6400 0 -6400 0 0 -4005z m1380 1685 l0 -2280 220 0 220 0 0 -1685 0 -1685 -890 0 -890 0 0 3965 0 3965 670 0 670 0 0 -2280z m1820 5 l0 -2275 228 -2 227 -3 3 -1688 2 -1687 -900 0 -900 0 0 1685 0 1685 230 0 230 0 0 2280 0 2280 440 0 440 0 0 -2275z m2270 -1690 l0 -3965 -885 0 -885 0 0 1690 0 1690 220 0 220 0 0 2275 0 2275 665 0 665 0 0 -3965z m1370 1695 l0 -2270 225 0 225 0 0 -1695 0 -1695 -890 0 -890 0 0 3958 c0 2177 3 3962 7 3965 3 4 303 7 665 7 l658 0 0 -2270z m1810 -10 l0 -2280 225 0 225 0 0 -1685 0 -1685 -882 0 -883 0 2 1692 3 1693 220 3 220 2 0 2270 0 2270 435 0 435 0 0 -2280z m1840 5 l0 -2275 233 -2 232 -3 3 -1687 2 -1688 -910 0 -910 0 2 1683 3 1682 223 3 222 2 0 2280 0 2280 450 0 450 0 0 -2275z m2270 -1690 l0 -3965 -880 0 -880 0 0 1690 0 1690 215 0 215 0 0 2275 0 2275 665 0 665 0 0 -3965z"/>
</g>
</svg>''',
                                    color: Colors.white,
                                  )),
                              Text("Piano",
                                  style: TextStyle(color: Colors.white))
                            ]))),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Drums(pads: [
                                    global.MusicKey("1d", 1),
                                    global.MusicKey("2d", 2),
                                    global.MusicKey("3d", 3),
                                    global.MusicKey("4d", 4),
                                    global.MusicKey("5d", 5),
                                    global.MusicKey("6d", 6)
                                  ])));
                    },
                    child: Container(
                        width: windowSize.width * 0.3,
                        height: windowSize.height * 0.7,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 115, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: windowSize.height * 0.5,
                                  child: SvgPicture.string(
                                      '''<svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="960.000000pt" height="1280.000000pt" viewBox="0 0 960.000000 1280.000000" preserveAspectRatio="xMidYMid meet">
<metadata>
Created by potrace 1.15, written by Peter Selinger 2001-2017
</metadata>
<g transform="translate(0.000000,1280.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
<path d="M3139 12406 c-75 -51 -135 -174 -249 -511 -80 -237 -93 -268 -202 -477 -95 -182 -159 -366 -203 -583 -35 -174 -47 -305 -46 -518 l0 -188 -105 -119 c-126 -143 -172 -185 -474 -441 -209 -176 -251 -217 -378 -366 -187 -221 -311 -392 -373 -517 -45 -90 -52 -113 -61 -202 -15 -128 -1 -216 50 -317 68 -138 223 -262 378 -302 112 -29 326 -14 448 32 23 8 143 65 269 125 246 120 298 135 331 99 18 -20 18 -23 -3 -138 -53 -297 -71 -488 -97 -1058 -8 -192 -16 -351 -18 -352 -1 -1 -125 -4 -276 -6 -446 -8 -802 -65 -1126 -182 -111 -40 -319 -137 -346 -162 -15 -13 -18 -33 -18 -112 0 -79 -4 -101 -20 -126 -27 -41 -25 -63 5 -71 l25 -6 0 -414 0 -413 -26 -26 c-32 -32 -28 -59 9 -63 l28 -3 -2 -77 c-4 -118 9 -161 56 -193 54 -35 183 -89 356 -148 79 -27 167 -58 195 -69 28 -11 246 -59 485 -106 435 -86 509 -103 509 -112 0 -3 -13 -22 -29 -42 -91 -115 -210 -414 -264 -667 -57 -262 -44 -502 35 -660 l31 -63 -61 -163 c-63 -171 -108 -298 -222 -634 -249 -732 -366 -1053 -436 -1204 -24 -52 -44 -107 -44 -122 0 -55 57 -60 133 -12 44 27 72 70 82 122 26 143 156 526 400 1176 111 297 219 586 240 643 26 71 41 100 49 94 6 -5 90 -63 186 -129 l175 -121 -6 -218 c-4 -121 -10 -357 -14 -526 l-8 -307 -46 -6 c-170 -21 -268 -56 -340 -121 -101 -91 -123 -209 -65 -334 67 -142 216 -238 407 -265 42 -5 47 -9 47 -31 0 -28 31 -94 67 -141 20 -28 30 -33 64 -33 33 0 47 6 69 30 30 32 56 122 47 166 -4 21 12 34 147 118 286 178 485 329 572 433 22 26 66 83 97 127 53 74 57 77 66 55 5 -13 61 -169 124 -346 64 -177 125 -340 137 -363 24 -47 71 -80 115 -80 34 0 75 24 75 44 0 7 -82 215 -181 462 l-182 449 12 75 c7 41 48 221 91 400 106 440 131 570 137 720 7 167 -1 188 -90 229 -74 33 -147 96 -182 155 -86 148 3 273 243 341 l92 27 57 -38 c121 -81 276 -120 511 -132 l137 -7 8 -65 c18 -142 -8 -457 -47 -590 -69 -229 -191 -366 -380 -426 -92 -29 -193 -92 -259 -163 -39 -42 -47 -57 -47 -89 0 -44 20 -68 85 -100 112 -55 314 -82 685 -89 262 -4 314 -3 464 16 331 42 497 96 521 171 19 59 -92 149 -271 220 -307 122 -460 282 -526 548 -27 111 -29 321 -4 462 9 51 18 95 19 97 2 1 25 -4 52 -12 196 -59 593 62 764 233 51 51 53 52 48 24 -3 -16 -20 -52 -37 -79 -38 -61 -49 -106 -50 -193 0 -109 54 -298 127 -444 19 -38 50 -114 70 -170 31 -90 98 -236 132 -291 11 -18 3 -50 -63 -245 -42 -124 -82 -230 -89 -236 -7 -6 -69 -59 -139 -119 -136 -115 -143 -126 -114 -184 17 -31 54 -51 96 -51 16 0 31 -3 33 -7 3 -5 -24 -107 -59 -228 -48 -169 -60 -223 -51 -231 19 -18 76 -34 118 -34 68 0 81 21 149 255 34 116 63 211 63 212 1 1 81 9 177 19 l175 17 136 63 c249 114 394 202 630 381 127 96 311 206 322 193 2 -3 56 -196 121 -430 214 -772 229 -822 250 -847 l21 -25 27 21 c35 28 51 81 45 150 -3 31 -113 504 -246 1051 -304 1254 -311 1283 -370 1526 -39 161 -55 211 -80 247 -17 25 -31 48 -31 50 0 3 47 -12 104 -32 l104 -36 57 -115 c193 -391 560 -1036 1095 -1925 134 -222 223 -382 224 -399 6 -78 195 -164 220 -100 12 31 -14 92 -96 225 -418 685 -742 1250 -1279 2233 -129 237 -109 218 -283 262 -59 15 -114 33 -122 41 -9 10 -14 38 -14 86 -1 40 -5 104 -10 142 -6 42 -7 680 -3 1619 l6 1549 113 53 c242 114 501 187 1145 324 345 73 404 94 327 118 -285 88 -975 315 -1196 393 -184 66 -239 90 -316 140 l-94 60 -6 72 c-3 40 -9 296 -14 569 -4 274 -11 500 -14 504 -4 3 -22 -6 -41 -21 l-34 -27 -7 -547 -7 -546 -41 -42 c-116 -119 -182 -89 -207 92 -6 44 -16 193 -21 330 -14 335 -38 512 -96 690 -54 166 -116 285 -217 419 -59 78 -60 79 -93 230 -86 392 -180 610 -330 762 l-66 67 -85 326 c-62 239 -84 339 -82 376 1 28 3 94 3 147 1 105 -8 128 -68 172 -40 30 -133 27 -206 -6 -71 -32 -151 -96 -192 -153 l-33 -46 -75 6 c-41 3 -214 28 -385 55 -505 79 -697 100 -935 100 -234 0 -369 -23 -493 -84 l-68 -33 -13 31 c-7 17 -41 104 -77 193 -59 150 -66 163 -89 163 -14 0 -41 -11 -61 -24z m55 -691 c25 -68 61 -114 109 -135 l40 -18 -53 -16 c-75 -22 -145 -21 -169 3 -17 17 -19 32 -17 108 2 48 16 174 32 278 l29 190 6 -180 c4 -136 10 -192 23 -230z m2520 390 c22 -23 29 -74 23 -173 -4 -68 5 -155 39 -406 40 -290 46 -323 72 -370 46 -81 99 -224 118 -315 12 -64 15 -115 11 -210 -7 -187 -50 -315 -169 -509 -22 -37 -99 -170 -171 -297 -151 -269 -233 -397 -329 -516 -66 -82 -71 -87 -131 -103 -101 -27 -258 -109 -321 -167 -31 -28 -53 -55 -50 -60 3 -5 30 13 61 40 31 28 86 66 124 86 75 39 199 88 206 81 7 -7 -127 -114 -202 -161 -70 -43 -119 -59 -325 -105 -390 -87 -648 -98 -848 -35 -90 29 -155 68 -234 141 -32 29 -94 71 -139 93 -45 23 -78 41 -74 41 3 0 84 -18 178 -39 95 -22 198 -45 230 -51 31 -6 57 -13 57 -15 0 -2 -16 -13 -35 -25 -36 -22 -45 -40 -21 -40 8 0 50 14 93 31 63 26 96 33 173 36 94 5 95 4 148 -30 36 -24 69 -36 108 -41 31 -3 69 -13 84 -21 16 -8 45 -15 65 -15 86 0 -7 76 -107 87 -64 7 -91 20 -142 67 l-38 37 7 67 c6 57 12 73 41 104 40 44 41 51 14 78 -39 39 -210 19 -210 -25 0 -16 23 -40 51 -55 27 -15 25 -84 -4 -134 -25 -43 -25 -44 -118 -79 l-67 -24 -263 59 c-370 83 -468 98 -620 98 -79 0 -129 -4 -129 -10 0 -6 42 -10 103 -11 l102 -1 -65 -13 c-132 -27 -249 -83 -367 -177 -68 -53 -84 -74 -30 -38 58 39 174 90 244 107 92 22 266 22 358 -2 86 -21 197 -73 248 -116 54 -45 97 -123 97 -178 0 -87 -67 -175 -182 -240 -33 -19 -60 -43 -71 -64 -23 -42 -60 -62 -87 -47 -32 17 -67 71 -121 185 -43 93 -52 107 -61 91 -7 -13 -7 -45 2 -107 13 -91 10 -150 -11 -175 -19 -23 -78 -16 -189 21 -57 19 -121 35 -142 35 -34 0 -38 -3 -38 -26 0 -42 -30 -95 -86 -151 -131 -132 -469 -303 -722 -365 -129 -32 -299 -30 -404 5 -137 44 -235 125 -286 235 -35 75 -42 211 -17 298 23 79 76 178 133 250 26 33 63 86 81 119 116 208 362 486 668 757 127 112 411 348 419 348 3 0 38 -27 77 -61 40 -33 84 -67 100 -75 25 -14 27 -13 27 6 0 12 -16 55 -35 97 -19 42 -35 86 -35 97 0 13 30 55 71 101 80 89 127 176 136 253 5 44 9 52 42 70 20 11 98 38 174 61 218 65 330 125 428 228 155 163 239 425 239 750 l0 102 83 43 c58 30 104 65 158 118 80 78 116 137 144 232 15 52 20 59 63 80 43 21 60 23 207 23 117 0 183 -5 245 -19 132 -28 365 -108 494 -169 113 -54 117 -57 105 -79 -25 -50 -89 -125 -137 -163 -57 -45 -67 -61 -51 -81 27 -33 100 -6 196 74 32 27 128 124 213 217 152 165 254 255 290 255 10 0 25 -7 34 -15z m492 -1799 c116 -292 120 -299 161 -328 139 -95 250 -384 304 -796 32 -243 27 -678 -9 -714 -4 -4 -144 -49 -312 -101 -592 -184 -829 -257 -835 -257 -4 0 -5 6 -2 14 6 14 -126 68 -311 127 -41 13 -70 25 -65 26 4 2 122 -19 261 -46 210 -40 255 -46 259 -34 3 8 2 18 -3 22 -7 6 -407 84 -939 183 -55 10 -104 20 -110 23 -22 11 144 -9 630 -79 422 -59 511 -70 518 -58 5 7 6 16 3 19 -3 3 -106 20 -228 38 -123 18 -214 33 -203 34 11 0 126 -8 255 -19 290 -24 270 -24 270 0 0 15 -7 20 -27 21 -16 0 -298 21 -628 47 -589 46 -600 48 -603 69 -4 26 31 22 -567 68 -247 20 -457 37 -465 38 -9 1 1 12 25 27 88 54 151 136 130 170 -10 17 27 11 105 -15 66 -22 84 -24 184 -20 61 3 226 10 366 16 292 12 514 32 587 54 28 8 78 35 110 59 85 62 82 61 276 101 135 27 212 37 327 42 87 4 150 10 150 16 0 6 -61 8 -167 4 -131 -4 -198 -12 -305 -35 -76 -16 -138 -26 -138 -23 0 3 19 19 41 35 23 16 84 70 137 120 l95 91 88 3 c69 3 89 7 89 18 0 12 -15 13 -82 8 l-82 -7 19 29 c29 44 226 417 322 609 135 269 203 459 219 613 4 34 11 62 15 62 5 0 9 8 9 17 0 9 2 14 4 12 2 -2 57 -138 122 -303z m1051 -1782 c21 -17 52 -49 68 -71 l30 -39 295 -82 c162 -45 438 -122 612 -170 174 -48 320 -91 324 -95 4 -4 -112 -7 -257 -7 -271 0 -1785 -15 -2509 -24 -264 -4 -398 -2 -385 4 11 5 166 50 345 99 996 275 1154 321 1174 340 12 11 46 34 76 51 49 27 63 30 122 28 57 -3 72 -8 105 -34z m-3227 -90 c272 -15 497 -31 500 -35 3 -3 21 -10 40 -14 213 -46 702 -192 864 -258 l60 -25 -145 -45 c-79 -25 -172 -54 -206 -64 -35 -10 -63 -20 -63 -23 0 -6 40 -13 490 -90 574 -98 1031 -160 1183 -160 l77 0 73 -61 c39 -33 73 -64 75 -69 4 -11 -16 -17 -102 -30 -38 -6 -77 -15 -86 -20 -9 -5 -27 -35 -38 -67 -52 -141 -203 -333 -351 -443 -140 -105 -348 -193 -531 -225 -52 -10 -122 -25 -155 -36 -33 -10 -78 -21 -100 -25 -61 -9 -199 19 -400 81 -274 86 -363 84 -396 -8 -15 -41 -43 -57 -103 -57 -128 0 -371 133 -422 232 -34 66 33 98 179 84 40 -4 82 -10 94 -13 17 -4 27 4 48 35 15 22 42 46 63 56 91 40 833 276 867 276 31 0 45 8 82 44 37 38 44 50 41 78 -3 32 -5 33 -51 36 -32 2 -83 -7 -150 -27 -241 -71 -374 -101 -442 -101 -37 0 -134 12 -214 26 -244 43 -334 29 -450 -73 -52 -46 -70 -84 -86 -190 -4 -22 -14 -48 -23 -56 -9 -8 -163 -61 -342 -116 -370 -115 -371 -116 -364 -134 3 -10 -53 -31 -208 -81 -117 -37 -310 -99 -429 -137 -119 -38 -221 -69 -228 -69 -6 0 -11 -9 -11 -20 0 -11 6 -20 14 -20 8 0 119 33 247 74 129 41 235 73 236 72 2 -1 -54 -27 -124 -56 -71 -29 -156 -66 -190 -82 -60 -28 -66 -28 -200 -26 l-137 3 -13 60 c-17 84 -16 324 3 485 8 74 42 294 75 488 32 194 66 414 74 490 20 179 34 248 56 275 l18 22 61 -34 c110 -60 168 -59 272 4 l56 35 77 -11 c95 -14 137 -4 185 47 34 35 36 36 95 30 33 -3 283 -17 555 -32z m4590 -413 c-27 -16 -204 -50 -577 -112 -574 -94 -702 -125 -850 -205 -123 -67 -167 -61 -285 38 -62 51 -18 45 -853 123 -409 39 -668 74 -745 103 -34 13 216 19 1290 33 487 6 1094 14 1350 18 691 11 686 11 670 2z m-3758 -591 c62 -29 34 -68 -70 -99 -38 -12 -90 -24 -116 -27 -34 -5 -60 -18 -94 -46 -59 -48 -137 -88 -174 -88 -41 0 -82 43 -74 77 11 40 36 72 82 104 54 37 77 46 199 75 107 25 197 27 247 4z m2183 -1332 c-4 -733 -9 -1334 -10 -1336 -1 -1 -35 41 -75 94 -185 242 -384 390 -557 412 l-58 8 3 54 c4 73 46 194 133 386 147 326 176 425 186 646 9 181 7 246 -13 438 -26 246 -7 387 67 500 58 90 62 92 167 111 53 9 112 17 130 18 l34 1 -7 -1332z m-571 821 c-109 -166 -148 -266 -208 -541 -47 -212 -74 -293 -121 -354 -176 -228 -147 -634 59 -840 83 -83 154 -115 265 -121 108 -7 179 -41 267 -129 74 -73 146 -211 169 -319 45 -214 -7 -420 -134 -538 -54 -50 -65 -67 -124 -203 -174 -400 -457 -1152 -457 -1216 0 -25 -13 -61 -26 -77 -13 -15 -60 57 -93 143 -79 203 -187 602 -178 660 3 17 19 69 36 116 34 95 41 187 17 244 -29 69 -111 107 -286 133 l-105 15 -275 -61 c-353 -79 -452 -91 -710 -88 -159 1 -229 -2 -314 -16 -466 -78 -715 -268 -693 -529 3 -37 8 -72 12 -78 3 -5 48 -30 99 -55 111 -54 178 -118 196 -186 16 -56 8 -189 -20 -334 -21 -109 -176 -729 -189 -752 -3 -6 -124 336 -269 760 -145 425 -272 797 -283 828 l-21 56 -169 81 -169 81 0 254 0 254 37 49 c69 93 144 173 209 224 l65 52 187 24 c563 71 945 146 1153 226 l79 30 0 69 c0 66 1 69 30 84 17 9 30 18 30 22 0 3 -16 23 -35 44 l-35 39 2 413 c3 403 3 412 23 415 37 7 38 20 6 70 -24 38 -31 60 -31 98 0 71 -17 121 -53 160 -35 37 -355 193 -532 259 -97 36 -305 82 -550 120 -60 10 -116 21 -122 24 -7 4 72 68 193 154 192 138 209 148 257 152 59 4 156 32 337 97 69 25 139 48 156 51 30 6 31 4 43 -43 7 -27 31 -77 53 -112 88 -137 222 -229 345 -236 56 -4 72 -1 128 27 41 21 80 50 108 82 l44 50 119 -40 c455 -154 942 -109 1310 120 48 30 116 82 153 115 36 34 67 61 68 60 2 -2 -22 -40 -53 -87z m-3044 -124 c0 -3 -103 -57 -230 -120 -195 -97 -237 -115 -277 -115 -25 0 -44 3 -41 6 5 4 535 231 546 234 1 0 2 -2 2 -5z m-50 -78 c0 -2 -50 -39 -110 -82 -67 -48 -109 -84 -106 -92 4 -9 -6 -11 -42 -7 -26 3 -54 8 -62 11 -9 2 54 40 145 87 155 80 175 90 175 83z m-685 -227 c350 -15 607 -39 752 -71 l51 -12 4 -51 c2 -28 4 -52 3 -54 -1 -1 -64 7 -141 19 -615 91 -1183 99 -1768 22 l-49 -6 5 57 c3 31 7 58 10 61 35 35 668 55 1133 35z m-1221 -87 c2 -10 7 -32 11 -50 6 -31 5 -32 -32 -38 -135 -20 -273 -48 -349 -70 -108 -32 -272 -108 -336 -158 l-48 -37 0 30 c0 17 7 46 15 66 13 31 28 42 137 94 194 92 458 177 560 179 27 1 38 -4 42 -16z m2225 -24 c169 -47 574 -224 644 -281 22 -18 29 -34 34 -77 l6 -55 -29 21 c-75 53 -281 138 -564 233 -102 34 -188 65 -192 68 -4 4 -10 31 -14 60 -6 50 -6 52 17 52 12 0 57 -9 98 -21z m-629 -109 c168 -13 316 -35 386 -57 l54 -17 0 -108 0 -108 -35 0 -35 0 0 -164 0 -164 42 -79 c33 -63 42 -91 46 -146 l5 -68 -34 5 c-657 106 -833 121 -1442 121 l-467 0 0 31 c0 18 9 51 20 75 16 37 19 65 19 174 0 167 -9 218 -42 253 -23 24 -27 38 -33 123 -8 114 -25 102 171 119 330 29 1028 34 1345 10z m-1600 -151 c0 -65 -5 -89 -24 -128 -24 -47 -25 -49 -16 -220 8 -167 9 -174 34 -200 18 -19 26 -38 26 -63 0 -36 -1 -37 -47 -43 -350 -47 -537 -107 -634 -202 l-47 -45 -6 38 c-3 22 -8 186 -12 366 -3 181 -7 331 -8 335 -2 15 202 109 325 151 172 57 379 106 402 95 4 -2 7 -40 7 -84z m2376 -30 c312 -105 465 -179 507 -242 11 -18 16 -103 21 -419 4 -219 5 -398 2 -398 -3 0 -27 16 -52 35 -62 48 -186 105 -450 209 l-222 87 -10 42 c-26 98 -25 104 7 144 l30 38 7 173 7 172 -46 43 -47 43 0 82 c0 82 0 83 22 71 12 -7 113 -43 224 -80z m-1106 -704 c268 -24 678 -83 771 -111 17 -5 44 -84 29 -84 -4 0 -61 11 -126 25 -588 121 -1351 143 -1938 54 -71 -10 -130 -18 -132 -17 -1 2 -5 15 -9 30 -6 25 -4 28 32 37 105 28 429 71 638 85 122 8 565 -3 735 -19z m-1505 -115 c9 -39 3 -46 -45 -54 -67 -11 -277 -83 -348 -120 l-67 -35 41 37 c55 50 187 127 287 168 104 43 123 43 132 4z m1360 -35 c154 -6 372 -27 535 -51 139 -20 353 -63 362 -72 4 -4 -36 -44 -90 -87 -53 -44 -155 -131 -227 -195 -176 -156 -338 -244 -491 -269 l-59 -9 -600 280 c-330 154 -608 287 -617 296 -38 33 -23 48 60 60 162 25 374 44 567 51 195 8 269 7 560 -4z m1177 -25 c59 -16 126 -37 150 -47 60 -23 415 -212 427 -226 5 -7 12 -29 16 -50 l7 -38 -68 42 c-139 86 -401 197 -574 245 -36 10 -68 22 -72 28 -10 15 -10 76 0 76 5 0 56 -13 114 -30z m-2364 -292 c166 -139 282 -228 432 -327 l205 -136 -75 -3 c-98 -4 -251 19 -447 68 -287 71 -577 169 -687 234 -35 20 -46 33 -46 51 0 33 101 139 194 204 68 47 169 101 189 101 4 0 110 -86 235 -192z m2513 69 c113 -45 409 -223 409 -246 0 -26 -206 -75 -455 -110 -232 -33 -578 -71 -584 -65 -19 19 172 284 301 418 l83 86 80 -25 c44 -13 119 -40 166 -58z m-2291 -44 c235 -100 515 -239 625 -311 91 -59 169 -134 162 -155 -5 -16 -97 -66 -121 -67 -32 0 -160 79 -361 224 -94 67 -417 310 -480 359 -62 49 -52 46 175 -50z m1855 35 c-107 -130 -742 -758 -766 -758 -9 0 32 155 49 185 16 31 59 67 172 143 134 90 281 209 440 355 69 63 127 113 129 111 2 -2 -9 -18 -24 -36z m-951 -585 c23 -33 24 -38 11 -63 -7 -14 -21 -33 -30 -40 -15 -13 -20 -11 -36 9 -19 23 -25 83 -13 115 10 27 42 18 68 -21z m-108 -244 l94 -81 -2 -236 -3 -235 -142 -111 -142 -111 -61 -190 c-34 -104 -65 -194 -69 -198 -5 -4 -15 3 -25 17 -103 158 -26 718 146 1061 41 80 94 165 104 165 4 0 48 -36 100 -81z m4612 -887 c1 -414 -2 -752 -6 -752 -12 0 -54 48 -85 97 -34 54 -61 71 -144 92 -85 22 -115 54 -94 104 133 324 197 630 188 889 -4 138 -3 150 18 196 26 56 92 135 109 129 8 -3 12 -219 14 -755z m-233 333 c-1 -104 -16 -177 -91 -437 -79 -274 -91 -375 -55 -455 23 -49 58 -70 138 -83 31 -5 64 -17 74 -26 38 -34 31 -110 -13 -138 -14 -9 -25 -4 -55 26 -34 34 -98 67 -108 56 -2 -2 3 -24 12 -49 25 -68 9 -98 -80 -153 l-71 -45 -43 40 c-24 22 -48 37 -54 33 -7 -4 -9 -26 -4 -60 l6 -54 -40 0 c-48 0 -106 44 -116 90 -5 22 45 184 205 672 183 556 216 647 243 676 28 29 32 31 41 15 6 -10 11 -58 11 -108z m495 -539 c38 -230 70 -429 70 -442 0 -29 -31 -44 -94 -44 -41 0 -44 2 -50 31 -6 33 -6 916 0 889 2 -8 35 -203 74 -434z m-4426 275 l108 -37 284 -800 c215 -604 283 -807 280 -831 -3 -18 -17 -61 -32 -95 -92 -207 -217 -342 -479 -519 -93 -63 -196 -136 -227 -162 l-58 -48 0 254 0 253 28 45 c16 24 77 95 135 158 154 165 152 159 152 421 0 241 -8 290 -70 417 -43 86 -122 164 -196 190 l-49 18 0 110 c0 60 -3 235 -7 388 -5 235 -4 277 8 277 8 -1 63 -18 123 -39z m-351 -273 c6 -307 2 -407 -18 -414 -13 -5 -295 193 -295 207 0 6 59 174 142 403 8 21 28 36 82 62 39 19 73 34 77 34 3 0 9 -132 12 -292z m2444 -574 c57 -106 250 -311 333 -352 l41 -20 -48 -35 c-136 -99 -274 -129 -345 -75 -28 21 -38 126 -37 373 0 226 0 229 17 190 10 -22 27 -59 39 -81z m-2168 -39 c109 -56 182 -378 136 -600 -15 -74 -108 -271 -157 -333 l-28 -35 0 492 c0 336 3 491 10 491 6 0 24 -7 39 -15z m3569 -241 c-21 -20 -161 -114 -165 -111 -2 3 39 133 62 195 3 9 22 0 60 -29 46 -34 54 -45 43 -55z m-3903 -836 c52 -27 51 -17 42 -295 -5 -145 -13 -262 -18 -268 -19 -19 -82 29 -113 86 -26 50 -28 60 -23 136 3 54 1 81 -5 77 -22 -14 -51 -102 -57 -171 l-6 -73 -60 29 c-73 36 -95 54 -129 105 -32 48 -35 130 -7 192 66 145 262 239 376 182z"/>
<path d="M3387 9953 c-16 -15 -5 -54 31 -109 45 -68 99 -120 168 -159 27 -16 69 -41 93 -57 160 -102 65 86 -116 232 -97 79 -159 111 -176 93z"/>
<path d="M4755 9737 c-64 -17 -88 -30 -114 -63 -41 -52 -18 -104 44 -104 19 0 63 11 97 23 35 13 81 27 104 30 78 13 173 47 184 67 9 16 5 22 -22 36 -43 23 -222 29 -293 11z"/>
<path d="M3030 9436 c0 -13 12 -16 66 -16 76 0 251 -24 339 -46 164 -42 301 -107 388 -184 30 -28 58 -46 61 -41 12 19 -108 112 -209 162 -148 72 -324 114 -567 134 -67 6 -78 5 -78 -9z"/>
<path d="M2476 10964 c-4 -14 -5 -28 -3 -31 3 -2 8 8 11 23 4 14 5 28 3 31 -3 2 -8 -8 -11 -23z"/>
</g>
</svg>''',
                                      color: Colors.white)),
                              Text("Drum",
                                  style: TextStyle(color: Colors.white))
                            ])))
              ],
            )));
      }),
    ));
  }
}
