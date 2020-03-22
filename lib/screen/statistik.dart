import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatistikPage extends StatefulWidget {
  StatistikPage({Key key}) : super(key: key);

  @override
  _StatistikPageState createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  int touchedIndex;

  Color greyColor = Colors.grey;

  List<int> selectedSpots = [];

  int lastPanStartOnIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Color(0xff222222),
        child: ScatterChart(
          ScatterChartData(
            scatterSpots: [
              ScatterSpot(
                4,
                4,
                color: selectedSpots.contains(0) ? Colors.green : greyColor,
              ),
              ScatterSpot(
                8,
                4,
                radius: 50,
                color: selectedSpots.contains(0) ? Colors.green : greyColor,
              ),
              ScatterSpot(
                2,
                5,
                color: selectedSpots.contains(1) ? Colors.yellow : greyColor,
                radius: 100,
              ),
              ScatterSpot(
                4,
                5,
                color:
                    selectedSpots.contains(2) ? Colors.purpleAccent : greyColor,
                radius: 8,
              ),
              ScatterSpot(
                8,
                6,
                color: selectedSpots.contains(3) ? Colors.orange : greyColor,
                radius: 20,
              ),
              ScatterSpot(
                5,
                7,
                color: selectedSpots.contains(4) ? Colors.brown : greyColor,
                radius: 14,
              ),
              ScatterSpot(
                7,
                2,
                color: selectedSpots.contains(5)
                    ? Colors.lightGreenAccent
                    : greyColor,
                radius: 18,
              ),
              ScatterSpot(
                3,
                2,
                color: selectedSpots.contains(6) ? Colors.red : greyColor,
                radius: 36,
              ),
              ScatterSpot(
                2,
                8,
                color:
                    selectedSpots.contains(7) ? Colors.tealAccent : greyColor,
                radius: 22,
              ),
            ],
            minX: 0,
            maxX: 2000,
            minY: 0,
            maxY: 2000,
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              checkToShowHorizontalLine: (value) => true,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: Colors.white.withOpacity(0.1)),
              drawVerticalLine: true,
              checkToShowVerticalLine: (value) => true,
              getDrawingVerticalLine: (value) =>
                  FlLine(color: Colors.white.withOpacity(0.1)),
            ),
            titlesData: const FlTitlesData(
              show: false,
            ),
            showingTooltipIndicators: selectedSpots,
            scatterTouchData: ScatterTouchData(
              enabled: true,
              handleBuiltInTouches: false,
              touchTooltipData: const ScatterTouchTooltipData(
                tooltipBgColor: Colors.black,
              ),
              touchCallback: (ScatterTouchResponse touchResponse) {
                if (touchResponse.touchInput is FlPanStart) {
                  lastPanStartOnIndex = touchResponse.touchedSpotIndex;
                } else if (touchResponse.touchInput is FlPanEnd) {
                  final FlPanEnd flPanEnd = touchResponse.touchInput;

                  if (flPanEnd.velocity.pixelsPerSecond <= const Offset(4, 4)) {
                    // Tap happened
                    setState(() {
                      if (selectedSpots.contains(lastPanStartOnIndex)) {
                        selectedSpots.remove(lastPanStartOnIndex);
                      } else {
                        selectedSpots.add(lastPanStartOnIndex);
                      }
                    });
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
