import 'package:flutter/material.dart';
import 'package:hosta_provider/widgets/app_bar.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hosta_provider/generated/app_localizations.dart';
import 'package:hosta_provider/screens/bookings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: isDark ? AppColors.dark : Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Daily Statistics Row
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: AppLocalizations.of(context)!.daily_bookings,
                    value: '7',
                    color: const Color(0xFF4A90E2),
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: AppLocalizations.of(context)!.daily_total,
                    value: '135000',
                    color: const Color(0xFF4A90E2),
                    isDark: isDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Monthly Statistics Row
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: AppLocalizations.of(context)!.monthly_bookings,
                    value: '35',
                    color: Colors.grey[300]!,
                    textColor: Colors.black,
                    isDark: isDark,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: AppLocalizations.of(context)!.monthly_total,
                    value: '735000',
                    color: Colors.grey[300]!,
                    textColor: Colors.black,
                    isDark: isDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Current and Pending Bookings Row
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Navigate to bookings screen and select "in_progress" tab (index 2)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingsScreen(initialTabIndex: 2),
                          ),
                        );
                      },
                      child: _buildStatCard(
                        title: AppLocalizations.of(context)!.current_booking,
                        value: '1',
                        color: Colors.grey[300]!,
                        textColor: Colors.black,
                        isDark: isDark,
                        showArrow: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Navigate to bookings screen and select "pending" tab (index 4)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingsScreen(initialTabIndex: 4),
                          ),
                        );
                      },
                      child: _buildStatCard(
                        title: AppLocalizations.of(context)!.pending_bookings,
                        value: '1',
                        color: Colors.grey[300]!,
                        textColor: Colors.black,
                        isDark: isDark,
                        showArrow: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Annual Statistics Chart
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.dark : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.annual_statistics,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: LineChart(_getChartData(isDark)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    Color? textColor,
    required bool isDark,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showArrow)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: (textColor ?? Colors.white).withValues(alpha: 0.7),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _getChartData(bool isDark) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withValues(alpha: 0.3),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
              Widget text;
              switch (value.toInt()) {
                case 0:
                  text = const Text('1', style: style);
                  break;
                case 1:
                  text = const Text('2', style: style);
                  break;
                case 2:
                  text = const Text('3', style: style);
                  break;
                case 3:
                  text = const Text('4', style: style);
                  break;
                case 4:
                  text = const Text('5', style: style);
                  break;
                case 5:
                  text = const Text('6', style: style);
                  break;
                case 6:
                  text = const Text('7', style: style);
                  break;
                case 7:
                  text = const Text('8', style: style);
                  break;
                case 8:
                  text = const Text('9', style: style);
                  break;
                case 9:
                  text = const Text('10', style: style);
                  break;
                case 10:
                  text = const Text('11', style: style);
                  break;
                case 11:
                  text = const Text('12', style: style);
                  break;
                default:
                  text = const Text('', style: style);
                  break;
              }
              return SideTitleWidget(axisSide: meta.axisSide, child: text);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            getTitlesWidget: (double value, TitleMeta meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              );
            },
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 20),
            FlSpot(1, 35),
            FlSpot(2, 25),
            FlSpot(3, 45),
            FlSpot(4, 55),
            FlSpot(5, 40),
            FlSpot(6, 65),
            FlSpot(7, 50),
            FlSpot(8, 70),
            FlSpot(9, 60),
            FlSpot(10, 80),
            FlSpot(11, 75),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              const Color(0xFF4A90E2),
              const Color(0xFF4A90E2).withValues(alpha: 0.3),
            ],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: const Color(0xFF4A90E2),
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF4A90E2).withValues(alpha: 0.3),
                const Color(0xFF4A90E2).withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
