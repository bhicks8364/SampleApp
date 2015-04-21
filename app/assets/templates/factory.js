app.factory('Order', ['$resource', function($resource) {
  function Order() {
    this.service = $resource('/api/job_orders/:id', {id: '@id'});
  };
  Order.prototype.all = function() {
    return this.service.query();
  };
  
  Order.prototype.delete = function(joId) {
    this.service.remove({orderId: joId});
  };
  
  Order.prototype.create = function(attr) {
    return this.service.save(attr);
  }
  
  return new Order;
}]);