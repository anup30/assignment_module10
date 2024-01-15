// assignment final, module 10
import 'package:device_preview/device_preview.dart'; // in pubspec dependencies: device_preview: ^1.1.0
import 'package:flutter/material.dart';

void main(){runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true, //-------------------------------------------------------------------------------------------------------------
      builder: (BuildContext context) {
        return MaterialApp(
          useInheritedMediaQuery: true, // deprecated
          builder: DevicePreview.appBuilder, //
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },

    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String,dynamic>> myItems =
  [
    {
      'dressName': 'Pullover',
      'imageLink': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQufd0U6Vs-xWwlTJnYCfvUQQqnYCqQeY5E5w&usqp=CAU",
      'color': 'Black',
      'size': 'L',
      'amount': 1,
      'unitPrice': 51,
      'unitPriceTotal': 51,
    },
    {
      'dressName': 'T-Shirt',
      'imageLink': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQymGEGdXz1EU7dLBYt5NsOCCeKne6DpIFCeg&usqp=CAU",
      'color': 'Gray',
      'size': 'L',
      'amount': 1,
      'unitPrice': 30,
      'unitPriceTotal': 30,
    },
    {
      'dressName': 'Sport Dress',
      'imageLink': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi8mstRLMsAdZio_hkVkOFzbrcEiLPOVi3Hg&usqp=CAU",
      'color': 'Black',
      'size': 'M',
      'amount': 1,
      'unitPrice': 43,
      'unitPriceTotal': 43,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(backgroundColor: Color(0xffF9F9F9),actions: const [Icon(Icons.search)],),
      body: LayoutBuilder(
        builder: (context,constrains){
          double w1 = constrains.maxWidth;
          double h1 = constrains.maxHeight;
          if(w1>h1){w1=h1;}
          double multi = w1/400; // multiplier for responsive
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12*multi),
                    child: Text('My Bag',style: TextStyle(fontSize: 30*multi,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: myItems.length,
                    itemBuilder:(context,index){
                      return Card(
                        margin: EdgeInsets.only(left: 10*multi, right: 10*multi,bottom: 20*multi,),
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 3,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 120*multi,
                              width: 120*multi, // a bit more worked.
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10*multi),
                                  bottomLeft: Radius.circular(10*multi),
                                ),
                                child: Image.network(myItems[index]['imageLink'],fit: BoxFit.fill,),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height:60*multi,
                                    child: ListTile(
                                      title: Text(myItems[index]['dressName'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18*multi),),
                                      subtitle: Row(
                                        children: [
                                          Text('Color: ',style: TextStyle(color: Colors.grey,fontSize: 14*multi),),
                                          Text(myItems[index]['color'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14*multi),),
                                          Text('   '),
                                          Text('Size: ',style: TextStyle(color: Colors.grey),),
                                          Text(myItems[index]['size'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14*multi),),
                                        ],
                                      ),
                                      trailing: Icon(Icons.more_vert,color: Colors.grey,size: 24*multi,),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60*multi,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 3*multi,
                                                  offset: Offset(0,1*multi), // direction, dx dy
                                                ),
                                              ],
                                            ),
                                            child: CircleAvatar(
                                              radius:20*multi,
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                onPressed: (){
                                                  if(myItems[index]['amount']>1){myItems[index]['amount']--;setState(() {});}
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 25*multi,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8*multi),
                                            child: Text("${myItems[index]['amount']}"),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3*multi,
                                                    offset: Offset(0,1*multi), // direction, dx dy
                                                  ),
                                                ],
                                              ),
                                              child: CircleAvatar(
                                                  radius:20*multi,
                                                  backgroundColor: Colors.white,
                                                  child: IconButton(
                                                      onPressed: (){myItems[index]['amount']++;if(myItems[index]['amount']==5){_showSimpleDialog(context, "${myItems[index]['dressName']}");}setState(() {});},
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 25*multi,
                                                        color: Colors.grey,)
                                                  )
                                              )
                                          ),
                                        ],
                                      ),
                                      trailing: Text("${myItems[index]['amount']*myItems[index]['unitPrice']}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14*multi),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height:10*multi,), ///////////////////////////
              Padding(
                padding: EdgeInsets.only(left: 24*multi,right: 24*multi,),
                child: Row(
                  children: [
                    Text('Total amount:',style: TextStyle(fontSize: 20*multi,fontWeight:FontWeight.bold, color: Colors.grey,),),
                    Spacer(),
                    Text("${sendTotalAmount()}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20*multi),),
                  ],
                ),
              ),
              SizedBox(
                height: 80*multi,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(12*multi),
                  child: ElevatedButton(
                    onPressed: () { mySnackBar(context,"Congratulations for buying!");
                    },
                    child: Text('CHECK OUT',style: TextStyle(fontSize: 18*multi),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffEF0304), // Helvetia Red
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height:20*multi,), ///////////////////////////
            ],
          );
        },
      ),
    );
  }
  String sendTotalAmount(){
    num totalAmount=0; // works for num totalAmount=0; problem with int <------
    for(int i=0; i<myItems.length; i++){
      totalAmount += (myItems[i]['amount']*myItems[i]['unitPrice']);
    }
    return totalAmount.toString();
  }
  mySnackBar(context,msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(msg,)))); // size ----------------------------
  }
  void _showSimpleDialog(BuildContext context, String dress) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => SimpleDialog(
        title: Center(child: Text('Congratulations',style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          Container(
            child: Column(children: [Text(''),Text('You have added'),Text('5'),Text('$dress on your bag!'),Text('')],), // size --------- search different option ?
          ),
          SimpleDialogOption( // multiple possible
            onPressed: () {
              Navigator.pop(context, 'Option 2');
            },
            child: ElevatedButton(
              onPressed: (){Navigator.pop(context, 'OKAY');},
              child: Text('OKAY'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffEF0304),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ); //.then((value) => print('Selected option: $value'));
  }
}