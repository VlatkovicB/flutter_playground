import 'package:flutter/material.dart';
import './expansion_tile_sample_data.dart';

final List<SampleData> data = <SampleData>[
  SampleData(
    "Food & Beverages",
    <SampleData>[
      SampleData(
        "Drinks",
        <SampleData>[
          SampleData("Tea"),
          SampleData("Coffee"),
          SampleData("Juices"),
        ],
      ),
      SampleData("Street food"),
    ],
  ),
  SampleData(
    "Fashion",
    <SampleData>[
      SampleData("Men's fashion"),
      SampleData("Women's fashion"),
    ],
  ),
  SampleData(
    "TVs & Appliances",
    <SampleData>[
      SampleData("Television"),
      SampleData("Washing Machine"),
      SampleData(
        "Kitchen Appliances",
        <SampleData>[
          SampleData("Microwave Ovens"),
          SampleData("Oven Toaster Grills (OTG)"),
          SampleData("Juicer/Mixer/Grinder"),
        ],
      ),
    ],
  ),
];

class ExpansionTileExample extends StatelessWidget {
  static const String routeName = '/expansiontile-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTileExample'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) => Item(data[index]),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final SampleData item;

  Item(this.item);

  @override
  Widget build(BuildContext context) {
    return _buildTile(item);
  }

  Widget _buildTile(SampleData item) {
    if (item.children.isEmpty) {
      return ListTile(
        title: Text(item.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<SampleData>(item),
      title: Text(item.title),
      children: item.children.map(_buildTile).toList(),
    );
  }
}
