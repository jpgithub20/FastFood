import 'package:flutter/material.dart';

int cartNumber = 0;

int hamburgerPrice = 5;
int hotdogPrice = 3;
int pizzaPrice = 10;
int wingsPrice = 6;
int tendersPrice = 4;
int friesPrice = 2;
int cookiePrice = 2;
int waterPrice = 1;
int sodaPrice = 2;
int totalPrice = 0;

int hamburgerCount = 0;
int hotdogCount = 0;
int pizzaCount = 0;
int wingsCount = 0;
int tendersCount = 0;
int friesCount = 0;
int cookieCount = 0;
int waterCount = 0;
int sodaCount = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burger Haven",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Main(title: 'Burger Haven'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key, required this.title}) : super(key: key);

  @override
  State<Main> createState() => _Main();

  final String title;
}

class _Main extends State<Main> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = <Widget>[
    FastFood(title: 'Burger Haven'),
    Cart(title: 'Cart'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart: $cartNumber',
          ),
        ],
        backgroundColor: Colors.red,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FastFood extends StatefulWidget {
  const FastFood({Key? key, required this.title}) : super(key: key);

  @override
  State<FastFood> createState() => _FastFood();

  final String title;
}

class _FastFood extends State<FastFood> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = <String>['Hamburger', 'Hot Dog', 'Pizza', 'Chicken Wings', 'Chicken Tenders', 'French Fries', 'Cookies', 'Water', 'Soda'];
    final List<int> prices = <int>[hamburgerPrice, hotdogPrice, pizzaPrice, wingsPrice, tendersPrice, friesPrice, cookiePrice, waterPrice, sodaPrice];
    final List<String> images = <String>[
      'https://cdn.cnn.com/cnnnext/dam/assets/220428140436-04-classic-american-hamburgers-full-169.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/b/b1/Hot_dog_with_mustard.png',
      'https://modpizza.com/wp-content/uploads/2021/12/Website-Maddy.png',
      'https://assets.epicurious.com/photos/5761c748ff66dde1456dfec0/master/pass/crispy-baked-chicken-wings.jpg',
      'https://images-gmi-pmc.edge-generalmills.com/3973d54d-0004-4c06-a9d1-0843f3bf3efa.jpg',
      'https://www.recipetineats.com/wp-content/uploads/2022/09/Crispy-Fries_8.jpg',
      'https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg',
      'https://beverages2u.com/wp-content/uploads/2019/05/nestlebottle-2.png',
      'https://us.coca-cola.com/content/dam/nagbrands/us/coke/en/home/coca-cola-original-20oz.png',
    ];
    final List<int> _itemCount = <int>[hamburgerCount, hotdogCount, pizzaCount, wingsCount, tendersCount, friesCount, cookieCount, waterCount, sodaCount];



    return Scaffold(
      body: ListView.builder(
        itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 300,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: NetworkImage(images[index]),
                      width: 200,
                      height: 200,
                    )
                  ),
                  Center(child: Text('${menuItems[index]}')),
                  Center(child: Text('\$${prices[index]}')),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (index == 0) {
                                hamburgerCount++;
                              }
                              else if (index == 1) {
                                hotdogCount++;
                              }
                              else if (index == 2) {
                                pizzaCount++;
                              }
                              else if (index == 3) {
                                wingsCount++;
                              }
                              else if (index == 4) {
                                tendersCount++;
                              }
                              else if (index == 5) {
                                friesCount++;
                              }
                              else if (index == 6) {
                                cookieCount++;
                              }
                              else if (index == 7) {
                                waterCount++;
                              }
                              else if (index == 8) {
                                sodaCount++;
                              }
                              cartNumber++;
                              totalPrice += prices[index];
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (index == 0) {
                                if (hamburgerCount > 0) {
                                  hamburgerCount--;
                                }
                              }
                              else if (index == 1) {
                                if (hotdogCount > 0) {
                                  hotdogCount--;
                                }
                              }
                              else if (index == 2) {
                                if (pizzaCount > 0) {
                                  pizzaCount--;
                                }
                              }
                              else if (index == 3) {
                                if (wingsCount > 0) {
                                  wingsCount--;
                                }
                              }
                              else if (index == 4) {
                                if (tendersCount > 0) {
                                  tendersCount--;
                                }
                              }
                              else if (index == 5) {
                                if (friesCount > 0) {
                                  friesCount--;
                                }
                              }
                              else if (index == 6) {
                                if (cookieCount > 0) {
                                  cookieCount--;
                                }
                              }
                              else if (index == 7) {
                                if (waterCount > 0) {
                                  waterCount--;
                                }
                              }
                              else if (index == 8) {
                                if (sodaCount > 0) {
                                  sodaCount--;
                                }
                              }
                              if (cartNumber > 0) {
                                cartNumber--;
                              }
                              if (totalPrice > 0) {
                                totalPrice -= prices[index];
                              }
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('${_itemCount[index]}')),
                ],
              )
            );
          }
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.title}) : super(key: key);

  @override
  State<Cart> createState() => _Cart();

  final String title;
}

class _Cart extends State<Cart> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Order", style: TextStyle(height: 1, fontSize: 100)),
            Spacer(),
            Text('Hamburgers: $hamburgerCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Hot Dogs: $hotdogCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Pizza: $pizzaCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Chicken Wings: $wingsCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Chicken Tenders: $tendersCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('French Fries: $friesCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Cookies: $cookieCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Water: $waterCount', style: TextStyle(height: 1, fontSize: 25)),
            Text('Soda: $sodaCount', style: TextStyle(height: 1, fontSize: 25)),
            Spacer(),
            if(cartNumber == 1)...[
              Text('Check Out: $cartNumber item for \$$totalPrice', style: TextStyle(height: 1, fontSize: 25)),
            ]else...[
              Text('Check Out: $cartNumber items for \$$totalPrice', style: TextStyle(height: 1, fontSize: 25)),
            ],

            Spacer(),
          ],
        ),
      ),

    );
  }
}
