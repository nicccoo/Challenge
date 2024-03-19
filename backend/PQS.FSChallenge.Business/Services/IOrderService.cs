using PQS.FSChallenge.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PQS.FSChallenge.Business.Services
{
    public interface IOrderService
    {
        Task<IEnumerable<OrderInfo>> GetOrders(OrderStatus status);
        Task<Order> GetOrderById(int orderId);
        void ApproveOrder(int orderId);
        void RejectOrder(int orderId);
    }
}
