import 'package:dukandaar/dynamic/bloc/distributor/distributor_bloc.dart';
import 'package:dukandaar/dynamic/bloc/shop/shop_bloc.dart';
import 'package:dukandaar/dynamic/controller/distributor_controller.dart';
import 'package:dukandaar/dynamic/models/distributor_model.dart';
import 'package:dukandaar/static/views/loader.dart';
import 'package:dukandaar/static/views/navbar.dart';
import 'package:dukandaar/static/widgets/cards/custom_distributor_card.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Distributors extends StatefulWidget {
  @override
  State<Distributors> createState() => _DistributorsState();
}

class _DistributorsState extends State<Distributors> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DistributorBloc>(context).add(GetAllDistributorEvent());
  }

  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.primaryColor,
        title: Text(
          "Distributors",
          style: TextStyle(
            color: theme.primaryColorDark,
          ),
        ),
      ),
      body: BlocConsumer<DistributorBloc, DistributorState>(
        builder: (context, state) {
          if (state is DistributorInitial || state is DistributorFailure) {
            return Loader();
          } else if (state is DistributorLoading) {
            return Loader();
          } else if (state is DistributorLoaded) {
            return ListView.builder(
              itemCount: state.distributorList.length,
              itemBuilder: (context, index) {
                return CustomDistributorCard(
                    distributorModel: state.distributorList[index]);
              },
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is DistributorFailure) {
            return CustomToast().showToast(state.error);
          }
        },
      ),
    );
  }
}
