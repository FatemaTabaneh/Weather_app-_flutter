import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/homePage.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/services/WeatherService.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(weatherService());
      },
      child: weather(),
    ),
  );
}

class weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).model == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).model!.getThemColor(),
        // brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit_bascket/counter_state.dart';

import 'cubit_bascket/counter_cubit.dart';

void main() {
  runApp(pointsCounter());
}

class pointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: screen()),
    );
  }
}

class screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, counterTwoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Team A', style: TextStyle(fontSize: 32)),
                        Text('${BlocProvider.of<CounterCubit>(context).teamAPoints}', style: TextStyle(fontSize: 150)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'A', number: 1);
                          },
                          child: Text(
                            'Add 1 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'A', number: 2);
                          },
                          child: Text(
                            'Add 2 Point',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'A', number: 3);
                          },
                          child: Text(
                            'Add 3 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Team B', style: TextStyle(fontSize: 32)),
                        Text('${BlocProvider.of<CounterCubit>(context).teamBPoints}', style: TextStyle(fontSize: 150)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'B', number: 1);
                          },
                          child: Text(
                            'Add 1 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'B', number: 2);
                          },
                          child: Text(
                            'Add 2 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(
                              context,
                            ).teamIncrement(team: 'B', number: 3);
                          },
                          child: Text(
                            'Add 3 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  backgroundColor: Colors.orange,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetMethod();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is counterA_state) {
           BlocProvider.of<CounterCubit>(context).teamAPoints;
        } else {
           BlocProvider.of<CounterCubit>(context).teamBPoints;
        }
      },
    );
  }
}*/
