import 'package:flutter/material.dart';

// class ScrollableAppBarDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Scrolling AppBar Demo'),
//               background: Container(
//                 color: Colors.red,
//               )
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//               childCount: 50,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class ScrollableAppBarDemo extends StatefulWidget {
  const ScrollableAppBarDemo({Key? key}) : super(key: key);

  @override
  State<ScrollableAppBarDemo> createState() => _ScrollableAppBarDemoState();
}

class _ScrollableAppBarDemoState extends State<ScrollableAppBarDemo> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool _isScrolledname = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(

              expandedHeight:  _isScrolled ? 100.0 : 200.0,
              // flexibleSpace: FlexibleSpaceBar(
              //   title: _isScrolledname ? Text("Hi Satya") : Text(_isScrolled ? 'Condensed App Bar' : 'Expanded App Bar'),
              // ),
              pinned: true,
              actions: [
                Container(
                  color: _isScrolled ? Colors.red : Colors.yellow,
                  child:
                  _isScrolledname ? Text("Hi Satya",style: TextStyle(
                    color: Colors.black
                  ),) : Text(_isScrolled ? 'Condensed App Bar' : 'Expanded App Bar',style: TextStyle(
                      color: Colors.black
                  ),)
                  ,
                ),
                SizedBox(width: 150,)
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                height:  100.0, // Adjust the height according to your needs
                color: Colors.white10,
                alignment: Alignment.center,
                child: Text(
                  'Custom Container Inside Slivers',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 100,
              ),
            ),

            // _isScrolled ?
            //
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       SizedBox(
            //         width: 100,
            //
            //       ),
            //       IconButton( icon: new Icon(Icons.search), alignment: Alignment.topRight,  ),
            //     ],
            //   ),
            // )
            //     :
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Search',
            //       filled: true,
            //       fillColor: Colors.white,
            //       suffixIcon: IconButton(
            //         icon: Icon(Icons.search),
            //         onPressed: () {},
            //       ),
            //       contentPadding: EdgeInsets.all(8.0),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //   ),
            // ),


          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {

        if(_scrollController.offset > 400 && _scrollController.offset < 500  ){
          print("111111111111");
          _isScrolled = true;
          //    _isScrolledname = false;
        }

        else if(_scrollController.offset > 800){
          _isScrolledname = true;

          print("3333333333");
        }
        else{
          print("22222222222");
          _isScrolledname = false;
          _isScrolled = false;
        }

        // _isScrolled = _scrollController.offset > 500; // Change the value as per your requirement
        //
        // print("wwwww"+_scrollController.offset.toString());
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
