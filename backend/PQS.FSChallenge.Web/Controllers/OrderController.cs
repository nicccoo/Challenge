using Microsoft.AspNetCore.Mvc;
using PQS.FSChallenge.Business.Services;
using PQS.FSChallenge.Business.Models;
using System.ComponentModel.DataAnnotations;

namespace PQS.FSChallenge.Web.Controllers
{
    [Route("api/orders")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly OrderService _orderService;

        public OrderController(OrderService order)
        {
            _orderService = order;
        }  

        [HttpGet("pending")]
        public async Task<ActionResult<IEnumerable<OrderInfo>>> GetPendingOrders()
        {
            var pendingOrders = await _orderService.GetOrders(OrderStatus.Pending);
            if (pendingOrders == null) return NotFound();

            return Ok(pendingOrders);
        }

        [HttpGet("approved")]
        public async Task<ActionResult<IEnumerable<OrderInfo>>> GetApprovedOrders()
        {
            var approvedOrders = await _orderService.GetOrders(OrderStatus.Approved);
            if (approvedOrders == null) NotFound();

            return Ok(approvedOrders);
        }

        [HttpGet("rejected")]
        public async Task<ActionResult<IEnumerable<OrderInfo>>> GetRejectedOrders()
        {
            var rejectedOrders = await _orderService.GetOrders(OrderStatus.Rejected);
            if (rejectedOrders == null) NotFound();

            return Ok(rejectedOrders);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrderById(int orderId)
        {
            Order order;

            try
            {
                order = await _orderService.GetOrderById(orderId);
            }

            catch (UnauthorizedAccessException ex)
            {
                return NotFound(ex.Message);
            }

            return Ok(order);
        }

        [HttpPost("{id}")]
        public ActionResult ApproveOrder(int orderId)
        {
            try
            {
                _orderService.ApproveOrder(orderId);
                return Ok();
            }

            catch (UnauthorizedAccessException ex)
            {
                return NotFound(ex.Message);
            }

            catch (ValidationException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult RejectOrder(int orderId)
        {
            try
            {
                _orderService.RejectOrder(orderId);
                return Ok();
            }
            catch (UnauthorizedAccessException ex)
            {
                return NotFound(ex.Message);
            }

            catch (ValidationException ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
