import 'package:flutter/material.dart';
import 'package:joy_p/event_detail.dart';
import 'package:table_calendar/table_calendar.dart';

class EventClendar extends StatefulWidget {
  const EventClendar({Key? key}) : super(key: key);

  @override
  State<EventClendar> createState() => _EventClendarState();
}

class _EventClendarState extends State<EventClendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List> _eventsList = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List> _selectedEvents;
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventForDay(_selectedDay!));
  }

  List _getEventForDay(DateTime day) {
    return _eventsList[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text("New Event"),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: _eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          _eventsList.addAll({
                            _selectedDay!: [_eventController.text]
                          });
                          Navigator.of(context).pop();
                          _selectedEvents.value =
                              _getEventForDay(_selectedDay!);
                        },
                        child: const Text("Submit"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        TableCalendar(
          //locale: 'ja_JP',
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          eventLoader: _getEventForDay,
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents.value = _getEventForDay(_selectedDay!);
              });
              _getEventForDay(_selectedDay!);
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        Expanded(
          child: ValueListenableBuilder<List>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EventDetail(eventName: '${value[index]}');
                          })),
                          title: Text('${value[index]}'),
                        ),
                      );
                    });
              }),
        ),
      ]),
    );
  }
}
