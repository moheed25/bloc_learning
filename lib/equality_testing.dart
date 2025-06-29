import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EqualityTest extends StatefulWidget {
  const EqualityTest({super.key});

  @override
  State<EqualityTest> createState() => _EqualityTestState();
}

class _EqualityTestState extends State<EqualityTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Equality Testing'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person = Person(name: 'moheed', age: 20);
        Person person1 = Person(name: 'moheed', age: 20);

        //
        print(person.hashCode.toString());
        print(person1.hashCode.toString());

        //
        print(person == person); // true :

        print(person == person1); // false :
      }),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/testnew.gif",
            height: 200,
          ),
        ],
      ),
    ));
  }
}

// simple class :

// class Person {
//   final String name;

//   final int age;

//   const Person({required this.name, required this.age});
// }

// without package :
class Person extends Equatable {
  final String name;

  final int age;

  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];
}

// without package :

// class Person {
//   final String name;

//   final int age;

//   const Person({required this.name, required this.age});



// // this is for to check equality of any object :
//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         other is Person &&
//             runtimeType == other.runtimeType &&
//             name == other.name &&
//             age == other.age;
//   }

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;
// }
