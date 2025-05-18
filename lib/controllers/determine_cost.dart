
/// A utility class to determine the final cost of a service based on  the service index and the number of people.
class DetermineCost {

  static int getFinalCost({required int indexOfService, required int NumberOfPeople}){
    
    if(indexOfService == 0){
      
      switch (NumberOfPeople) {
        case 0:
          return 150;

        case 1: 
        return 250;

        case 2: 
        return 400;

        case 3:
        return 500;
      }

    }else if(indexOfService == 1){

      switch (NumberOfPeople) {
        case 0:
          return 250;
        
        case 1: 
          return 500;

        case 2: 
          return 700;

        case 3: 
          return 900;
      }
    }else{

      switch (NumberOfPeople) {
        case 0:
          return 2500;

        case 1: 
          return 4000;

        case 2: 
          return 6000;
        
        case 3: 
          return 8000;
      }
    }

    return 0;
  }
}