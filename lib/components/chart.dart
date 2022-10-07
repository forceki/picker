import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      palette: const <Color>[Colors.black, Color(0xFF2CBF6C)],
      series: <CircularSeries>[
        RadialBarSeries<GDPData, String>(
            dataSource: _chartData,
            pointColorMapper: (GDPData data, _) => data.color,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: const DataLabelSettings(isVisible: true))
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Jan', 35, const Color(0xFF2CBF6C)),
      GDPData('Feb', 28, Colors.black),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp, this.color);
  final String continent;
  final int gdp;
  final color;
}
