import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'mutual_funds.dart';

class ResultChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ResultChart(this.seriesList, {this.animate});

  factory ResultChart.withSampleData() {
    return new ResultChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(
        includeArea: true,
        includePoints: true,
        includeLine: true,
      ),
      defaultInteractions: true,
      behaviors: [
        new charts.LinePointHighlighter(
            // symbolRenderer: new charts.CylinderSymbolRenderer(),
            ),
        new charts.ChartTitle('Time',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Return On Investment',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
          horizontalFirst: true,
          showMeasures: true,
          measureFormatter: (num value) {
            return value == null ? '-' : '${value.toStringAsFixed(2)}';
          },
        ),
      ],
    );
  }

  static List<charts.Series<MutualFunds, int>> _createSampleData() {
    final data1 = [
      new MutualFunds(0, 25),
      new MutualFunds(1, 25),
      new MutualFunds(2, 100),
      new MutualFunds(3, 75),
      new MutualFunds(4, 125),
    ];

    final data2 = [
      new MutualFunds(0, 50),
      new MutualFunds(1, 50),
      new MutualFunds(2, 200),
      new MutualFunds(3, 150),
      new MutualFunds(4, 130),
    ];

    return [
      new charts.Series<MutualFunds, int>(
        id: 'Normal',
        displayName: 'Normal',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MutualFunds sales, _) => sales.time,
        measureFn: (MutualFunds sales, _) => sales.roi,
        data: data1,
      ),
      new charts.Series<MutualFunds, int>(
        id: 'Smart',
        displayName: 'Smart',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (MutualFunds sales, _) => sales.time,
        measureFn: (MutualFunds sales, _) => sales.roi,
        data: data2,
      ),
    ];
  }
}
