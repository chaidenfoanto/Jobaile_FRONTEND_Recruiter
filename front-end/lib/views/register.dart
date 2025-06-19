import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '/color/color.dart';

import '../BLoC/register/register_bloc.dart';
import '../BLoC/register/register_event.dart';
import '../BLoC/register/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'ID');
  String? selectedGender;
  DateTime? _selectedDate;
  final String? _idPhotoPath = 'path/to/photo.jpg'; // Simulasi foto KTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => RegisterBloc(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              Navigator.of(context, rootNavigator: true).pop(); // Tutup loading
            }

            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registrasi berhasil!')),
              );
            }

            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, size: 28),
                              onPressed: () {
                                context.pop();
                              },
                            ),
                          ),
                          Center(
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Registrasi',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Silahkan registrasi untuk login',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),

                      const SizedBox(height: 16),
                      buildLabel('Nama Lengkap'),
                      const SizedBox(height: 8),
                      buildInputField('Enter your full name', _fullNameController),

                      const SizedBox(height: 16),
                      buildLabel('E-mail'),
                      const SizedBox(height: 8),
                      buildInputField('Enter your email', _emailController),

                      const SizedBox(height: 16),
                      buildLabel('Kata Sandi'),
                      const SizedBox(height: 8),
                      buildIconInputField('Password', Icons.lock, _passwordController, obscure: true),

                      const SizedBox(height: 16),
                      buildLabel('Nomor Telepon'),
                      const SizedBox(height: 8),
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          this.number = number;
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                        ),
                        initialValue: number,
                        textStyle: GoogleFonts.inter(fontSize: 12),
                        inputDecoration: InputDecoration(
                          hintText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),

                      const SizedBox(height: 16),
                      buildLabel('Jenis Kelamin'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildGenderOption('Laki - laki'),
                          const SizedBox(width: 20),
                          buildGenderOption('Perempuan'),
                        ],
                      ),

                      const SizedBox(height: 16),
                      BirthDateSelector(onDateSelected: (date) {
                        _selectedDate = date;
                      }),

                      const SizedBox(height: 16),
                      buildLabel('Kartu Tanda Pengenal'),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.add, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Masukkan Foto KTP',
                                  style: GoogleFonts.inter(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 34),
                      Center(
                        child: SizedBox(
                          width: 210,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  _selectedDate != null &&
                                  _idPhotoPath != null &&
                                  selectedGender != null) {
                                context.read<RegisterBloc>().add(RegisterSubmitted(
                                      fullName: _fullNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      phoneNumber: number.phoneNumber ?? '',
                                      gender: selectedGender!,
                                      birthDate: _selectedDate!.toIso8601String().split('T')[0],
                                      idPhotoPath: _idPhotoPath,
                                    ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Lengkapi semua data')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D3671),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Daftar Sekarang',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah memiliki akun? ',
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/login');
                            },
                            child: Text(
                              'Masuk',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
    );
  }

  Widget buildInputField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null,
    );
  }

  Widget buildIconInputField(String hint, IconData icon, TextEditingController controller,
      {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: Colors.grey,
            fontSize: 12,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        validator: (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null, //Unit test
      ),
    );
  }

  Widget buildGenderOption(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(
          gender,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BirthDateSelector extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BirthDateSelector({super.key, required this.onDateSelected});

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  String? selectedMonth;
  String? selectedDate;
  String? selectedYear;

  List<String> days = List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
  List<String> years = List.generate(80, (index) => (DateTime.now().year - index).toString());
  final List<String> months = const [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tanggal Lahir', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildDropdown('Month', selectedMonth, months, (val) {
              setState(() => selectedMonth = val);
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Date', selectedDate, days, (val) {
              setState(() => selectedDate = val);
            })),
            const SizedBox(width: 8),
            Expanded(child: _buildDropdown('Year', selectedYear, years, (val) {
              setState(() => selectedYear = val);
            })),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            if (selectedMonth != null && selectedDate != null && selectedYear != null) {
              final birthDate = DateTime(
                int.parse(selectedYear!),
                months.indexOf(selectedMonth!) + 1,
                int.parse(selectedDate!),
              );
              widget.onDateSelected(birthDate);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Lengkapi tanggal lahir')),
              );
            }
          },
          child: const Text('Pilih Tanggal Lahir'),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: const InputDecoration(border: InputBorder.none),
        isExpanded: true,
        hint: Text(
          hint,
          style: GoogleFonts.inter(color: Colors.grey, fontSize: 12),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 6.0,
    this.dashSpace = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double currentX = 0;
    while (currentX < size.width) {
      path.moveTo(currentX, 0);
      double endX = currentX + dashWidth;
      if (endX > size.width) {
        endX = size.width;
      }
      path.lineTo(endX, 0);
      currentX += dashWidth + dashSpace;
    }

    double currentY = 0;
    while (currentY < size.height) {
      path.moveTo(size.width, currentY);
      double endY = currentY + dashWidth;
      if (endY > size.height) {
        endY = size.height;
      }
      path.lineTo(size.width, endY);
      currentY += dashWidth + dashSpace;
    }

    currentX = size.width;
    while (currentX > 0) {
      path.moveTo(currentX, size.height);
      double endX = currentX - dashWidth;
      if (endX < 0) {
        endX = 0;
      }
      path.lineTo(endX, size.height);
      currentX -= dashWidth + dashSpace;
    }

    currentY = size.height;
    while (currentY > 0) {
      path.moveTo(0, currentY);
      double endY = currentY - dashWidth;
      if (endY < 0) {
        endY = 0;
      }
      path.lineTo(0, endY);
      currentY -= dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is DashedBorderPainter &&
        (oldDelegate.color != color ||
            oldDelegate.strokeWidth != strokeWidth ||
            oldDelegate.dashWidth != dashWidth ||
            oldDelegate.dashSpace != dashSpace);
  }
}

