import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_clone_app/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000)
    ));

    return MaterialApp(
      title: 'Nubank Clone',
      theme: ThemeData(
        primaryColor: Color(0xff6d2177),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class OverlayedUI extends StatefulWidget {

  Widget midWidget;

  OverlayedUI(this.midWidget);

  @override
  _OverlayedUIState createState() => _OverlayedUIState(midWidget);
}

class _OverlayedUIState extends State<OverlayedUI> {

  Widget midWidget;

  _OverlayedUIState(this.midWidget);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              child: Text('X'),
              onPressed: () => Navigator.pop(context),
            ),
            midWidget
          ],
        ),
      )
    );
  }

}

class CobrarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan> [
                      TextSpan(text: 'Quanto', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' você quer cobrar?')
                    ]
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(text: 'R\$'),
                      TextSpan(text: ' 0,00')
                    ]
                  )
                ),
                Text('Não especificar um valor >', style: TextStyle(color: Colors.grey, fontSize: 12),)
              ]
            ),
            SizedBox (
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () => print('CLICADO'),
                child: Text('CONFIRMAR', style: TextStyle(color: Color(0xff6d2177))),
              )
            )
          ],
        )
      )
    );
  }

}

class _MyHomePageState extends State<MyHomePage> {
  User user = User();

  @override
  Widget build(BuildContext context) {

    Stack stack = Stack(
      children: <Widget>[
        Column(

          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NuContaInfo(),
            SlidingCardsView(),
            ShortcutsCards()
          ],
        ),
//        OverlayedUI(CobrarWidget())
      ],
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
        color: Color(0xff6d2177),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: stack
      ),
    );
  }
}

class NuContaInfo extends StatefulWidget {
  @override
  _NuContaInfoState createState() => _NuContaInfoState();

}

class _NuContaInfoState extends State<NuContaInfo> {

  TextStyle whiteStyle = TextStyle(
      color: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text('Felipe', textAlign: TextAlign.center, style: whiteStyle,),
        children: <Widget>[
          RichText(
            text: TextSpan(
                style: whiteStyle,
                children: <TextSpan>[
                  TextSpan(text: 'Banco '),
                  TextSpan(text: '260 - Nu Pagamentos S.A.', style: TextStyle(fontWeight: FontWeight.bold)),
                ]
            ),
          ),
          RichText(
            text: TextSpan(
                style: whiteStyle,
                children: <TextSpan> [
                  TextSpan(text: 'Agência '),
                  TextSpan(text: '0001', style: TextStyle(fontWeight: FontWeight.bold))
                ]
            ),
          ),
          RichText(
            text: TextSpan(
                style: whiteStyle,
                children: <TextSpan>[
                  TextSpan(text: 'Conta '),
                  TextSpan(text: '4505274-9', style: TextStyle(fontWeight: FontWeight.bold))
                ]
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.help_outline, color: Colors.white,),
                              Text('Me ajuda', style: whiteStyle,),
                            ],
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.person, color: Colors.white,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Perfil', style: whiteStyle,),
                                    Text('Nome de preferência, telefone, e-mail', style: whiteStyle,),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right)
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.attach_money, color: Colors.white,),
                                Text('Configurar NuConta', style: whiteStyle,),],
                            ),
                            Icon(Icons.chevron_right)
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.credit_card, color: Colors.white,),
                                Text('Configurar Cartão', style: whiteStyle,),],
                            ),
                            Icon(Icons.chevron_right)
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.card_giftcard, color: Colors.white,),
                                Text('Configurar Rewards', style: whiteStyle,),
                              ],
                            ),
                            Icon(Icons.chevron_right)
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  GestureDetector(
                    onTap: (){
                      print("Container clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.smartphone, color: Colors.white,),
                                Text('Configurações do app', style: whiteStyle,),],
                            ),
                            Icon(Icons.chevron_right)
                          ]
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffAA4ACA),),
                  OutlineButton(
                      borderSide: BorderSide(color: Color(0xffAA4ACA)),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Color(0xffAA4ACA))
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('SAIR DA CONTA', style: whiteStyle,),
                      )
                  ),
                ],
              )
          ),
        ],
      );
  }

}

class SlidingCardsView extends StatefulWidget {

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();

}

class _SlidingCardsViewState extends State<SlidingCardsView> {

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: PageView(
          children: <Widget>[
            SlidingCard(Icons.credit_card, 'Cartão de crédito', CreditCardMidWidget()),
            SlidingCard(Icons.credit_card, 'NuConta', NuContaMidWidget()),
            SlidingCard(Icons.card_giftcard, 'Rewards', RewardsMidWidget())
          ],
        ),
      )
    );
  }
}

class SlidingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget midWidget;

  SlidingCard(this.icon, this.title, this.midWidget);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, OldPageRoute());
        },
        child: Container(
          height: 350,
          color: Colors.white,
          padding: EdgeInsets.only(top: 15),
          child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(this.icon),
                              Text(this.title)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: this.midWidget
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFFEBEBEB),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.directions_bus, color: Colors.grey,),
                      Text('Apagar compra de R\$ 11,99 em Uber '),
//                            'do Brasil Tecnolo com 1.199pts'),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                  ),
                )
            ),
          ],
        )
        ),
      ),
    );
  }

}

class OldPageRoute extends CupertinoPageRoute {
  OldPageRoute() : super(builder: (BuildContext context) => Old());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return new ScaleTransition(scale: animation, child: Old());
  }
}

class Old extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Vestuário', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title: Text('Vestuário', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title: Text('Vestuário', style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }

}

class RewardsMidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
            text: TextSpan(
                style: TextStyle(color: Color(0xff6d2177), fontSize: 35),
                children: <TextSpan>[
                  TextSpan(text: '1.370', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' pts')
                ]
            )
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan> [
                TextSpan(text: 'Você acumulou '),
                TextSpan(text: '460 pontos', style: TextStyle(color: Color(0xff6d2177), fontWeight: FontWeight.bold)),
                TextSpan(text: ' nos últimos 30 dias'),
              ]
          ),
        )
      ],
    );
  }

}

class NuContaMidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Saldo disponível'),
        Text('R\$ 1999,00'),
      ],
    );
  }

}

class CreditCardMidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle blueStyle = TextStyle(
        color: Color(0xff34C2E0)
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('FATURA ATUAL', style: blueStyle,),
        RichText(
            text: TextSpan(
                style: TextStyle(color: Color(0xff34C2E0), fontSize: 35),
                children: <TextSpan>[
                  TextSpan(text: 'R\$ '),
                  TextSpan(text: ' 1.956', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ',02')
                ]
            )
        ),
        RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Limite disponível '),
                  TextSpan(text: 'R\$ 3000,00', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                ]
            )
        ),
      ],
    );
  }

}

class ShortcutsCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ShortcutCard(Icons.code, 'Cobrar'),
          ShortcutCard(Icons.help_outline, 'Me Ajuda'),
          ShortcutCard(Icons.lock_open, 'Bloquear cartão'),
          ShortcutCard(Icons.payment, 'Cartão virtual'),
          ShortcutCard(Icons.arrow_downward, 'Depositar'),
          ShortcutCard(Icons.arrow_upward, 'Transferir'),
          ShortcutCard(Icons.space_bar, 'Pagar'),
          ShortcutCard(Icons.settings, 'Ajustar limite'),
          ShortcutCard(Icons.person_add, 'Indicar amigos'),
          ShortcutCard(Icons.short_text, 'Organizar atalhos'),
        ],
      )
    );
  }

}

class ShortcutCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const ShortcutCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OverlayWidget())),
      onTap: () => showDialog(child: OverlayedUI(CobrarWidget()), context: context),
      child: Container(
        height: 90,
        width: 90,
        margin: EdgeInsets.only(right: 7),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xffAA4ACA),
          borderRadius: BorderRadius.circular(10)
        ),
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(this.icon, color: Colors.white),
            Text(this.title, style: TextStyle(color: Colors.white),)
          ],
        )
      )
    );
  }

}
