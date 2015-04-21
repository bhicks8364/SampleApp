// app.controller('OrdersCtrl', ['$scope', '$resource', function($scope, $resource) {
//   var Orders = $resource('/api/job_orders');
//   $scope.orders = Orders.query();
  
//   $scope.createOrder = function() {
//     var attr = {};
//     attr.symbol = $filter('uppercase')($scope.newSymbol);
//     var newStock = Stock.create(attr);
//     $scope.stocks.push(newStock);
//     $scope.newSymbol = "";
//   };
  
//   $scope.deleteOrder = function(idx) {
//     $scope.orders.splice(idx, 1);
//   };
  
// }]);

// app.controller('OrdersCtrl', ['$scope', '$resource', function($scope, $resource) {
//   var Orders = $resource('/api/job_orders');
//   $scope.orders = Orders.query();
  
//   $scope.createOrder = function() {
//     var attr = {};
//     attr.symbol = $filter('uppercase')($scope.newSymbol);
//     var newStock = Stock.create(attr);
//     $scope.stocks.push(newStock);
//     $scope.newSymbol = "";
//   };
  
//   $scope.deleteOrder = function(idx) {
//     $scope.orders.splice(idx, 1);
//   };
  
// }]);

angular.module('app', [])
.controller("ShiftListCtrl", [
  '$scope', 'Shift', function($scope, Shift) {
    return Shift.list().then(function(shifts) {
      $scope.shifts = shifts;
      console.log("ShiftListCtrl is running...")

    });
  }
]);