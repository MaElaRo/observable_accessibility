import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/model/appointments.dart';
import 'package:observable_accessibility/common/services/navigation/widgets/primary_button.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_cubit.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_state.dart';

class DateAndTimePicker extends StatefulWidget {
  const DateAndTimePicker({super.key});

  @override
  State<DateAndTimePicker> createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePicker> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String phoneNumber = '';

  final _dateController = TextEditingController();
  final _phoneController = TextEditingController();
  final _timeController = TextEditingController();
  final _nameController = TextEditingController();

  bool _isChecked = false;

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneNumberFilled = phoneNumber.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Choose your slot:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter name',
          ),
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
          textInputAction: TextInputAction.done,
          controller: _nameController,
        ),
        TextField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select Date',
            suffixIcon: InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: const Icon(Icons.calendar_today),
            ),
          ),
        ),
        TextField(
          controller: _timeController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select Time',
            suffixIcon: InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: const Icon(Icons.access_time),
            ),
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Your phone number:',
          ),
          keyboardType: TextInputType.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.done,
          controller: _phoneController,
          onChanged: (value) {
            setState(() {
              phoneNumber = value; // Store the entered phone number
            });
          },
        ),
        const SizedBox(height: 10),
        MergeSemantics(
          child: Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              const Text.rich(
                TextSpan(
                  text: 'I accept the ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'terms and conditions',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          onPressed: isPhoneNumberFilled && _isChecked
              ? () {
                  context.read<AppointmentCubit>().bookAppointment(
                        Appointment(
                          name: _nameController.text,
                          timeSlot: _mergeDateTimeAndTimeOfDay(
                            selectedDate,
                            selectedTime,
                          ),
                          code: Random().nextInt(1000).toString(),
                        ),
                      );
                }
              : null,
          text: 'Book slot!',
        ),
        BlocListener<AppointmentCubit, AppointmentState>(
          listener: (blocContext, state) {
            if (state is AppointmentBookingSuccess) {
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext context) {
                      return Semantics(
                        liveRegion: true,
                        child: AlertDialog(
                          title: const Text('Success'),
                          content: Text('Appointment booked: ${state.code}'),
                          actions: [
                            TextButton(
                              onPressed: () => _resetBookingForm(blocContext),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (blocContext, state) {
              if (state is AppointmentBookingInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AppointmentBookingFailure) {
                return Semantics(
                  liveRegion: true,
                  child: Text(state.error),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = TimeOfDay(hour: picked.hour, minute: picked.minute);
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  DateTime _mergeDateTimeAndTimeOfDay(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  void _resetBookingForm(BuildContext blocContext) {
    _timeController.clear();
    _dateController.clear();
    _phoneController.clear();
    _nameController.clear();
    blocContext.read<AppointmentCubit>().resetState();
    Navigator.of(context).pop();
  }
}
