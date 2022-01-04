import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime kFirstDay = DateTime(1970, 1, 1);
DateTime kLastDay = DateTime(2100, 1, 1);

extension DateTimeExtension on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59);
}

bool isSameDay(DateTime a, DateTime b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

bool isSameMonth(DateTime a, DateTime b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month;
}

class FlutterFlowCalendar extends StatefulWidget {
  const FlutterFlowCalendar({
    @required this.color,
    this.onChange,
    this.initialDate,
    this.weekFormat = false,
    this.weekStartsMonday = false,
    this.iconColor,
    this.dateStyle,
    this.dayOfWeekStyle,
    this.inactiveDateStyle,
    this.selectedDateStyle,
    this.titleStyle,
    Key key,
  }) : super(key: key);

  final bool weekFormat;
  final bool weekStartsMonday;
  final Color color;
  final void Function(DateTimeRange) onChange;
  final DateTime initialDate;
  final Color iconColor;
  final TextStyle dateStyle;
  final TextStyle dayOfWeekStyle;
  final TextStyle inactiveDateStyle;
  final TextStyle selectedDateStyle;
  final TextStyle titleStyle;

  static const Cubic pageAnimationCurve = Curves.easeInOut;
  static const Duration pageAnimationDuration = Duration(milliseconds: 350);

  @override
  State<StatefulWidget> createState() => _FlutterFlowCalendarState();
}

class _FlutterFlowCalendarState extends State<FlutterFlowCalendar> {
  DateTime focusedDay;
  DateTimeRange selectedDay;
  CalendarController calendarController;

  @override
  void initState() {
    super.initState();
    focusedDay = widget.initialDate ?? DateTime.now();
    selectedDay = DateTimeRange(
      start: widget.initialDate?.startOfDay ?? DateTime.now().startOfDay,
      end: widget.initialDate?.endOfDay ?? DateTime.now().endOfDay,
    );
    calendarController = CalendarController();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => setSelectedDay(selectedDay.start));
  }

  CalendarFormat get calendarFormat =>
      widget.weekFormat ? CalendarFormat.week : CalendarFormat.month;

  StartingDayOfWeek get startingDayOfWeek => widget.weekStartsMonday
      ? StartingDayOfWeek.monday
      : StartingDayOfWeek.sunday;

  Color get color => widget.color;

  Color get lightColor => widget.color.withOpacity(0.85);

  Color get lighterColor => widget.color.withOpacity(0.60);

  void setSelectedDay(
    DateTime newSelectedDay, [
    DateTime newSelectedEnd,
  ]) {
    final newRange = newSelectedDay == null
        ? null
        : DateTimeRange(
            start: newSelectedDay.startOfDay,
            end: newSelectedEnd ?? newSelectedDay.endOfDay,
          );
    setState(() {
      selectedDay = newRange;
      calendarController.setSelectedDay(newSelectedDay);
      widget.onChange?.call(newRange);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CalendarHeader(
            focusedDay: focusedDay,
            onLeftChevronTap: () => calendarController.previousPage(),
            onRightChevronTap: () => calendarController.nextPage(),
            onTodayButtonTap: () {
              if (!calendarController.visibleDays.any(
                calendarController.isToday,
              )) {
                setState(() {
                  calendarController.setFocusedDay(DateTime.now());
                  focusedDay = DateTime.now();
                });
              }
            },
            titleStyle: widget.titleStyle,
            iconColor: widget.iconColor,
          ),
          TableCalendar(
            calendarController: calendarController,
            startDay: kFirstDay,
            endDay: kLastDay,
            initialCalendarFormat: calendarFormat,
            headerVisible: false,
            calendarStyle: CalendarStyle(
              weekdayStyle: widget.dateStyle,
              weekendStyle: widget.dateStyle,
              holidayStyle: widget.dateStyle,
              eventDayStyle: widget.dateStyle,
              selectedStyle:
                  const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                      .merge(widget.selectedDateStyle),
              todayStyle:
                  const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                      .merge(widget.selectedDateStyle),
              unavailableStyle: const TextStyle(color: Color(0xFF9E9E9E))
                  .merge(widget.inactiveDateStyle),
              outsideStyle: const TextStyle(color: Color(0xFF9E9E9E))
                  .merge(widget.inactiveDateStyle),
              outsideWeekendStyle: const TextStyle(color: Color(0xFF9E9E9E))
                  .merge(widget.inactiveDateStyle),
              outsideHolidayStyle: const TextStyle(color: Color(0xFF9E9E9E))
                  .merge(widget.inactiveDateStyle),
              selectedColor: color,
              todayColor: lighterColor,
              markersColor: lightColor,
              markersMaxAmount: 3,
              canEventMarkersOverflow: true,
            ),
            availableGestures: AvailableGestures.horizontalSwipe,
            startingDayOfWeek: startingDayOfWeek,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: const TextStyle(color: Color(0xFF616161))
                  .merge(widget.dayOfWeekStyle),
              weekendStyle: const TextStyle(color: Color(0xFF616161))
                  .merge(widget.dayOfWeekStyle),
            ),
            holidays: const {},
            onDaySelected: (newSelectedDay, _, __) {
              if (!isSameDay(selectedDay?.start, newSelectedDay)) {
                setSelectedDay(newSelectedDay);
                if (!isSameMonth(focusedDay, newSelectedDay)) {
                  setState(() {
                    newSelectedDay.isAfter(focusedDay)
                        ? calendarController.nextPage()
                        : calendarController.previousPage();
                    focusedDay = newSelectedDay;
                    calendarController.setFocusedDay(newSelectedDay);
                  });
                }
              }
            },
            onVisibleDaysChanged: (start, end, format) => setState(() {
              focusedDay = start.add(end.difference(start) ~/ 2);
              calendarController.setFocusedDay(focusedDay);
            }),
          ),
        ],
      );
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    @required this.focusedDay,
    @required this.onLeftChevronTap,
    @required this.onRightChevronTap,
    @required this.onTodayButtonTap,
    this.iconColor,
    this.clearButtonVisible = false,
    this.onClearButtonTap,
    this.titleStyle,
    Key key,
  }) : super(key: key);

  final bool clearButtonVisible;
  final DateTime focusedDay;
  final VoidCallback onClearButtonTap;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onTodayButtonTap;
  final Color iconColor;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                DateFormat.yMMMM().format(focusedDay),
                style: const TextStyle(fontSize: 17).merge(titleStyle),
              ),
            ),
            if (clearButtonVisible)
              CustomIconButton(
                icon: Icon(Icons.clear, color: iconColor),
                onTap: onClearButtonTap,
              ),
            CustomIconButton(
              icon: Icon(Icons.calendar_today, color: iconColor),
              onTap: onTodayButtonTap,
            ),
            CustomIconButton(
              icon: Icon(Icons.chevron_left, color: iconColor),
              onTap: onLeftChevronTap,
            ),
            CustomIconButton(
              icon: Icon(Icons.chevron_right, color: iconColor),
              onTap: onRightChevronTap,
            ),
          ],
        ),
      );
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    @required this.icon,
    @required this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.padding = const EdgeInsets.all(10),
    Key key,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: padding,
            child: Icon(
              icon.icon,
              color: icon?.color,
              size: icon?.size,
            ),
          ),
        ),
      );
}
