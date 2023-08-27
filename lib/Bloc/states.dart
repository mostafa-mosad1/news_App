abstract class NewsStates{}

class initialState extends NewsStates{}

class changeNavigator extends NewsStates{}
class lightMode1 extends NewsStates{}

class initialBusiness extends NewsStates{}
class getBusiness extends NewsStates{}
class errorBusiness extends NewsStates{
  late String error;
  errorBusiness(this.error);
}


class initialsport extends NewsStates{}
class getsport extends NewsStates{}
class errorsport extends NewsStates{
  late String error;
  errorsport(this.error);
}


class initialscience extends NewsStates{}
class getscience extends NewsStates{}
class errorscience extends NewsStates{
  late String error;
  errorscience(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates
{
  final String error;

  NewsGetSearchErrorState(this.error);
}

