angular.module('app', [])
  .service('Shift', ['Restangular', function(Restangular) {
    var Shift = Restangular.service('shifts');
 
    Restangular.extendModel('shifts', function(model) {
      model.getResult = function() {
        if (this.status == 'complete') {
          if (this.passed === null) return "Finished";
          else if (this.passed === true) return "Pass";
          else if (this.passed === false) return "Fail";
        }
        else return "Running";
      };
 
      return model;
    });
 
    return Shift;
  }]);