using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using PQS.FSChallenge.Business.Models;
using System.ComponentModel.DataAnnotations;
using System.Net;

namespace PQS.FSChallenge.Business.Services
{
    public class OrderService : IOrderService
    {
        private readonly FSChallengeContext _context;

        public OrderService(FSChallengeContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<OrderInfo>> GetOrders(int status)
        {
            return await _context.OrderInfo.Where(x => x.Status == status).ToListAsync();
        }

        public async Task<Order> GetOrderById(int orderId)
        {
            var order = await _context.Orders.Include(x => x.OrderItems).FirstOrDefaultAsync(x => x.OrderId == orderId);
            return order ?? throw new UnauthorizedAccessException();
        }

        public void ApproveOrder(int orderId)
        {
            var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);
            if (order != null)
            {
                if (order.Status == 0)
                {
                    order.Status = 1;

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
                if (order.Status == 0)
                {
                    order.Status = -1;

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
