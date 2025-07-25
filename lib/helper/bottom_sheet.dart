import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_hive/cubits/addNoteCubit/cubit/add_cubit_cubit.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/helper/add_form.dart';

class BottomSheetWidget {
  String title = '';
  String description = '';

  Future showAddNoteBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // ضروري علشان البوتوم شيت يتحرك مع الكيبورد
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => AddNoteCubit(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: BlocConsumer<AddNoteCubit, AddCubitState>(
              listener: (context, state) {
                if (state is AddCubitError) {
                  log('Error: ${state.message}');
                }
                if (state is AddCubitSuccess) {
                  log('Note added: ${state.title}');
                  context.read<LoadCubit>().fetchAllNotes();
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ModalProgressHUD(
                    color: Colors.transparent,
                    progressIndicator: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                    blur: 1,
                    inAsyncCall: state is AddCubitLoading,
                    child: AbsorbPointer(
                      absorbing: state is AddCubitLoading,
                      child: SingleChildScrollView(
                        child: AddForm(), // ← ده الفورم بتاعك
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
