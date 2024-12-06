import 'package:ecommerce_app/features/profile/manager/language/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String>(
      builder: (context, currentLang) {
        return ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: DropdownButton<String>(
            value: currentLang,
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                context.read<LanguageCubit>().changeLanguage(newValue);
              }
            },
          ),
        );
      },
    );
  }
}
