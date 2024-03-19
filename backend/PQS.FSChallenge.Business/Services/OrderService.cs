using Microsoft.EntityFrameworkCore;
using PQS.FSChallenge.Business.Models;
using System.ComponentModel.DataAnnotations;

namespace PQS.FSChallenge.Business.Services
{
    public class OrderService : IOrderService
    {
        private readonly FSChallengeContext _context;

        public OrderService(FSChallengeContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<OrderInfo>> GetOrders(OrderStatus status)
        {
            return await _context.OrderInfo.Where(x => x.Status == status).ToListAsync();
        }

        public async Task<Order> GetOrderById(int orderId)
        {
            var order = await _context.Orders
                .Include(x => x.OrderItems)
                .FirstOrDefaultAsync(x => x.OrderId == orderId);
            return order ?? throw new UnauthorizedAccessException();
        }

        public void ApproveOrder(int orderId)
        {
            var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);
            if (order != null)
            {
                if (order.Status == OrderStatus.Pending)
                {
                    order.Status = OrderStatus.Approved;

                    _context.SaveChanges();
                }

                else
                {
                    throw new ValidationException();
                }
            }

            else
            {
                throw new UnauthorizedAccessException();
            }
        }

        public void RejectOrder(int orderId)
        {
            var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);
            if (order != null)
            {
                if (order.Status == OrderStatus.Pending)
                {
                    order.Status = OrderStatus.Rejected;

                    _context.SaveChanges();
                }

                else
                {
                    throw new ValidationException();
                }
            }

            else
            {
                throw new UnauthorizedAccessException();
            }
        }
    }
}
